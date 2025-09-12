local HttpService = game:GetService("HttpService")
local TeleportService = game:GetService("TeleportService")
local Players = game:GetService("Players")
local workspace = game:GetService("Workspace")

local player = Players.LocalPlayer

local RIFTS = {
    {Name = "spikey-egg", Webhook = "https://discord.com/api/webhooks/1415712364007002143/p80C7QElE5O1EEDo-0IKJA5cGiG31O8qlEBQ1dgmibyOtO2Fr228CK7-JQiM2vpLb8Mz"},
    {Name = "FestiveRift", Webhook = "https://discord.com/api/webhooks/1415718364055077025/_cblNWmsQS35E-1xCz-CQWYMbiKm4aFncF_0ngpDsavEPFPbfL5QUE1nP7kmk2xWzy1V"}
}

local HOP_COOLDOWN = 3
local IDLE_HOP_TIME = 2
local isHopping = false
local alreadyFound = {}
local lastCheck = tick()

-- Replace with your dynamic server list
local SERVER_LIST = {"server_placeholder"}

-- Format rift names
local function formatEggName(name)
    if not name then return "" end
    name = name:gsub("-", " ")
    return name:gsub("(%a)([%w]*)", function(first, rest)
        return first:upper() .. rest:lower()
    end)
end

-- Send webhook via HttpService (avoids nil call)
local function sendWebhook(url, payload)
    local ok, body = pcall(function()
        return HttpService:JSONEncode(payload)
    end)
    if not ok then return false end
    return pcall(function()
        HttpService:PostAsync(url, body, Enum.HttpContentType.ApplicationJson)
    end)
end

-- Get available servers
local function getServerArray()
    if type(SERVER_LIST) ~= "table" then return {} end
    return SERVER_LIST
end

-- Handle teleport failures
TeleportService.TeleportInitFailed:Connect(function(player, result, errMsg)
    warn("Teleport failed:", result, errMsg)
    isHopping = false
end)

-- Hop to a random server (not current)
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
    pcall(function()
        TeleportService:TeleportToPlaceInstance(game.PlaceId, chosenJob, player)
    end)
    task.wait(HOP_COOLDOWN)
    isHopping = false
end

-- Main scanning loop
task.spawn(function()
    task.wait(2) -- give some time before first scan
    lastCheck = tick()

    while true do
        local foundRift = false
        local rendered = workspace:FindFirstChild("Rendered")
        if rendered then
            local riftsFolder = rendered:FindFirstChild("Rifts")
            if riftsFolder then
                for _, rift in ipairs(riftsFolder:GetChildren()) do
                    local nameLower = (rift.Name or ""):lower()

                    for _, riftData in ipairs(RIFTS) do
                        if riftData.Name and nameLower:find(riftData.Name:lower()) and not alreadyFound[rift.Name] then
                            foundRift = true

                            local luckText, timerText, heightText = "N/A", "N/A", "N/A"
                            local minutes, seconds = 0, 0

                            pcall(function()
                                if rift:FindFirstChild("Display") and rift.Display:FindFirstChild("SurfaceGui") then
                                    if rift.Display.SurfaceGui:FindFirstChild("Icon") and rift.Display.SurfaceGui.Icon:FindFirstChild("Luck") then
                                        luckText = rift.Display.SurfaceGui.Icon.Luck.Text or "N/A"
                                    end
                                    if rift.Display.SurfaceGui:FindFirstChild("Timer") then
                                        timerText = rift.Display.SurfaceGui.Timer.Text or ""
                                    end
                                end
                            end)

                            -- parse timer
                            pcall(function()
                                minutes = tonumber(timerText:match("(%d+) ?m")) or 0
                                seconds = tonumber(timerText:match("(%d+) ?s")) or 0
                                if minutes == 0 and seconds == 0 then
                                    local mm, ss = timerText:match("(%d+):(%d+)")
                                    if mm and ss then
                                        minutes = tonumber(mm) or 0
                                        seconds = tonumber(ss) or 0
                                    end
                                end
                            end)

                            -- get height
                            pcall(function()
                                if rift.GetPivot then
                                    heightText = tostring(math.floor(rift:GetPivot().Position.Y)) .. " studs"
                                elseif rift:FindFirstChild("Display") and rift.Display:IsA("BasePart") then
                                    heightText = tostring(math.floor(rift.Display.Position.Y)) .. " studs"
                                end
                            end)

                            -- build webhook message
                            local formattedEggName = formatEggName(rift.Name)
                            local expireTimestamp = os.time() + (minutes * 60 + seconds)
                            local jobId = tostring(game.JobId or "")
                            local playerCount = #Players:GetPlayers()
                            local maxPlayers = Players.MaxPlayers or 0

                            local message = {
                                embeds = {{
                                    title = formattedEggName .. " Has Been Found 🥚",
                                    color = 0x00FF00,
                                    fields = {
                                        {name = "🌍 Server Info", value = "Players Online: " .. playerCount .. "/" .. maxPlayers, inline = true},
                                        {name = "🎲 Rift Info", value = "Luck: " .. luckText .. "\nExpires: <t:" .. expireTimestamp .. ":R>" .. "\nHeight: " .. heightText, inline = true},
                                        {name = "🔗 Quick Join", value = "[Click to Join Server](https://www.roblox.com/games/start?placeId=" .. game.PlaceId .. "&jobId=" .. jobId .. ")", inline = false}
                                    },
                                    timestamp = DateTime.now():ToIsoDate()
                                }}
                            }

                            sendWebhook(riftData.Webhook, message)

                            alreadyFound[rift.Name] = true
                            task.delay(300, function() alreadyFound[rift.Name] = nil end)

                            -- hop but continue scanning after
                            hopServers()
                        end
                    end
                end
            end
        end

        -- idle hop if no rift found
        if not foundRift and (tick() - lastCheck) >= IDLE_HOP_TIME then
            hopServers()
            lastCheck = tick()
        end

        task.wait(1)
    end
end)
