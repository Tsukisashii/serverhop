local SERVER_LIST = 
local HttpService = game:GetService("HttpService")
local TeleportService = game:GetService("TeleportService")
local Players = game:GetService("Players")
local workspace = game:GetService("Workspace")
local TextChatService = game:GetService("TextChatService")

local player = Players.LocalPlayer

local RIFTS = {
    {Name = "spikey-egg", Webhook = "https://discord.com/api/webhooks/1400470775592521798/-48oF_gPY30E3FhwJY8djz4k6eD64ZOgaWCmKHWzf9cW1nQN53WUoq0aOmd2JGWRJXWP", MinLuck = 25},  
    {Name = "brainrot-egg", Webhook = "https://discord.com/api/webhooks/1415718364055077025/_cblNWmsQS35E-1xCz-CQWYMbiKm4aFncF_0ngpDsavEPFPbfL5QUE1nP7kmk2xWzy1V", MinLuck = nil}  
}

local HOP_COOLDOWN = 5
local IDLE_HOP_TIME = 5
local isHopping = false
local lastCheck = tick()

local currentServerRifts = {}

local promoMessages = {
    "○●□ JOIN FOR RIFTS - q n 6 E R j S z ○●□",
    "○●□ FREE BRAINROT EGG ○●□"
}

task.spawn(function()
    while true do
        for _, msg in ipairs(promoMessages) do
            pcall(function()
                TextChatService.TextChannels.RBXGeneral:SendAsync(msg)
            end)
            task.wait(1)
        end
    end
end)

local function formatEggName(name)
    if not name then return "" end
    name = name:gsub("-", " ")
    return name:gsub("(%a)([%w]*)", function(first, rest)
        return first:upper() .. rest:lower()
    end)
end

local function normalize(name)
    return (name or ""):lower():gsub("%W", "")
end

local function parseLuck(luckText)
    if not luckText then return 0 end
    return tonumber(luckText:match("%d+")) or 0
end

local function shouldSendRift(riftData, luckText)
    local luck = parseLuck(luckText)
    if riftData.MinLuck then
        return luck >= riftData.MinLuck
    else
        return true
    end
end

local function parseTimer(timerText)
    if not timerText or timerText == "" then return 0 end
    local s = timerText:lower():gsub("^%s+", ""):gsub("%s+$", "")

    if s:find("ago") or s:find("expired") then return 0 end

    local h, m, sec = s:match("^(%d+):(%d+):(%d+)$")
    if h and m and sec then
        return tonumber(h)*3600 + tonumber(m)*60 + tonumber(sec)
    end

    local mm, ss = s:match("^(%d+):(%d+)$")
    if mm and ss then
        return tonumber(mm)*60 + tonumber(ss)
    end

    local totalSeconds = 0
    for number, unit in s:gmatch("(%d+)%s*([hms])") do
        number = tonumber(number)
        if unit == "h" then
            totalSeconds = totalSeconds + number * 3600
        elseif unit == "m" then
            totalSeconds = totalSeconds + number * 60
        elseif unit == "s" then
            totalSeconds = totalSeconds + number
        end
    end

    return totalSeconds
end

local function sendWebhook(url, payload)
    local body = HttpService:JSONEncode(payload)
    local success, err = pcall(function()
        if syn and syn.request then
            syn.request({Url = url, Method = "POST", Headers = { ["Content-Type"] = "application/json" }, Body = body})
        elseif request then
            request({Url = url, Method = "POST", Headers = { ["Content-Type"] = "application/json" }, Body = body})
        else
            error("Cannot send webhook: no supported HTTP request function found")
        end
    end)
    if not success then
        warn("Webhook failed:", err)
    end
end

local function getServerArray()
    if type(SERVER_LIST) ~= "table" then return {} end
    return SERVER_LIST
end

TeleportService.TeleportInitFailed:Connect(function(player, result, errMsg)
    warn("Teleport failed:", result, errMsg)
    isHopping = false
end)

local function hopServers()
    if isHopping then return end
    local servers = getServerArray()
    if not servers or #servers == 0 then
        warn("hopServers: no servers available")
        return
    end

    local currentJob = tostring(game.JobId or "")
    local chosenJob = nil

    for _ = 1, #servers do
        local candidate = tostring(servers[math.random(1, #servers)] or "")
        if candidate ~= "" and candidate ~= currentJob then
            chosenJob = candidate
            break
        end
    end

    if not chosenJob then
        warn("No new server found (only current one).")
        return
    end

    isHopping = true
    warn("Teleporting to server:", chosenJob)
    currentServerRifts = {}
    pcall(function()
        TeleportService:TeleportToPlaceInstance(game.PlaceId, chosenJob, player)
    end)
    task.wait(HOP_COOLDOWN)
    isHopping = false
end

local function getUTCTime()
    return os.time(os.date("!*t")) 
end

task.spawn(function()
    task.wait(2)
    lastCheck = tick()

    while true do
        local riftsToSend = {}

        local rendered = workspace:FindFirstChild("Rendered")
        if rendered then
            local riftsFolder = rendered:FindFirstChild("Rifts")
            if riftsFolder then
                for _, rift in ipairs(riftsFolder:GetChildren()) do
                    local riftId = normalize(rift.Name)
                    if not currentServerRifts[riftId] then
                        for _, riftData in ipairs(RIFTS) do
                            if riftData.Name and riftId:find(normalize(riftData.Name)) then
                                table.insert(riftsToSend, {rift = rift, riftData = riftData, riftId = riftId})
                                break
                            end
                        end
                    end
                end
            end
        end

        for _, info in ipairs(riftsToSend) do
            local rift = info.rift
            local riftData = info.riftData
            local riftId = info.riftId

            local luckText, timerText, heightText = nil, nil, nil
            pcall(function()
                if rift:FindFirstChild("Display") then
                    local displayPart = rift.Display
                    if displayPart:FindFirstChild("SurfaceGui") then
                        local gui = displayPart.SurfaceGui
                        if gui:FindFirstChild("Icon") and gui.Icon:FindFirstChild("Luck") then
                            luckText = gui.Icon.Luck.Text
                        end
                        if gui:FindFirstChild("Timer") then
                            timerText = gui.Timer.Text
                        end
                    end
                    if displayPart:IsA("BasePart") then
                        heightText = math.floor(displayPart.Position.Y) .. "m"
                    end
                end
            end)

            local secondsLeft = parseTimer(timerText or "") or 0
            if secondsLeft <= 0 then continue end

            local expireTimestamp = getUTCTime() + secondsLeft
            currentServerRifts[riftId] = expireTimestamp

            if not shouldSendRift(riftData, luckText) then continue end

            local formattedEggName = formatEggName(rift.Name)
            local jobId = tostring(game.JobId or "0")
            local placeId = tostring(game.PlaceId or "0")
            local playerCount = #Players:GetPlayers()
            local maxPlayers = Players.MaxPlayers or 0
            local redirectURL = "https://serverhop-jins-projects-240eae56.vercel.app/?placeId=" .. placeId .. "&gameInstanceId=" .. jobId

            local message = {
                embeds = {{
                    title = formattedEggName .. " Has Been Found 🥚",
                    color = 0x00FF00,
                    fields = {
                        {name = "🌍 Server Info", value = "Players Online: " .. playerCount .. "/" .. maxPlayers, inline = true},
                        {name = "🎲 Rift Info", value = "Luck: " .. (luckText or "N/A") .. "\nExpires: <t:" .. expireTimestamp .. ":R>\nHeight: " .. (heightText or "N/A"), inline = true},
                        {name = "🔗 Quick Join", value = "[Click to Join Server](" .. redirectURL .. ")", inline = false}
                    },
                    timestamp = DateTime.now():ToIsoDate()
                }}
            }

            sendWebhook(riftData.Webhook, message)
            print("Webhook sent for:", rift.Name, "| Expires in:", math.floor(secondsLeft / 60), "minutes", secondsLeft % 60, "seconds")
        end

        if #riftsToSend > 0 then
            hopServers()
        elseif (tick() - lastCheck) >= IDLE_HOP_TIME then
            hopServers()
            lastCheck = tick()
        end

        task.wait(1)
    end
end)
