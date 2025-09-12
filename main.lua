local SERVER_LIST = SERVER_LIST_PLACEHOLDER
local HttpService = game:GetService("HttpService")
local TeleportService = game:GetService("TeleportService")
local Players = game:GetService("Players")
local workspace = game:GetService("Workspace")

local player = Players.LocalPlayer

local RIFTS = {
    {Name = "void-egg", Webhook = "https://discord.com/api/webhooks/1415712364007002143/p80C7QElE5O1EEDo-0IKJA5cGiG31O8qlEBQ1dgmibyOtO2Fr228CK7-JQiM2vpLb8Mz"},
    {Name = "FestiveRift", Webhook = "https://discord.com/api/webhooks/1415718364055077025/_cblNWmsQS35E-1xCz-CQWYMbiKm4aFncF_0ngpDsavEPFPbfL5QUE1nP7kmk2xWzy1V"}
}

local HOP_COOLDOWN = 5
local MAIN_LOOP_DELAY = 5
local isHopping = false
local alreadyFound = {}

-- format egg names
local function formatEggName(name)
    if not name then return "" end
    name = name:gsub("-", " ")
    return name:gsub("(%a)([%w]*)", function(first, rest)
        return first:upper() .. rest:lower()
    end)
end

local function sendHttpPost(url, body)
    if not url or url == "" then return false, "no url" end
    local ok, res = pcall(function()
        local payload = {
            Url = url,
            Method = "POST",
            Headers = { ["Content-Type"] = "application/json" },
            Body = body
        }
        if syn and syn.request then
            return syn.request(payload)
        elseif request then
            return request(payload)
        else
            return HttpService and HttpService:IsA("HttpService") and HttpService:PostAsync and { Body = HttpService:PostAsync(url, body, Enum.HttpContentType.ApplicationJson) } or nil
        end
    end)
    return ok, res
end

-- wrapper to JSON encode + send
local function sendWebhook(url, payload)
    local okBody, body = pcall(function()
        return HttpService:JSONEncode(payload)
    end)
    if not okBody then
        warn("sendWebhook: JSONEncode failed")
        return
    end
    local ok, res = sendHttpPost(url, body)
    if not ok then
        warn("sendWebhook failed:", res)
    end
end

-- helper: return a flat array of jobIds regardless of SERVER_LIST shape
local function getServerArray()
    if type(SERVER_LIST) ~= "table" then return {} end
    -- If first element is a table, return that inner table (common from updater)
    if type(SERVER_LIST[1]) == "table" then
        return SERVER_LIST[1]
    end
    -- otherwise assume it's already a flat array
    return SERVER_LIST
end

-- hop server function (random pick, try to avoid current job)
local function hopServers()
    if isHopping then return end
    local servers = getServerArray()
    if not servers or #servers == 0 then
        warn("hopServers: no servers available in SERVER_LIST")
        return
    end

    -- seed RNG (ok to call repeatedly)
    math.randomseed(tick() % 2^31)

    local currentJob = tostring(game.JobId or "")
    local chosenJob = nil
    local attempts = 0
    local maxAttempts = math.min(6, #servers)

    while attempts < maxAttempts do
        local idx = math.random(1, #servers)
        local candidate = tostring(servers[idx] or "")
        if candidate ~= "" and candidate ~= currentJob then
            chosenJob = candidate
            break
        end
        attempts = attempts + 1
    end

    if not chosenJob then
        chosenJob = tostring(servers[math.random(1, #servers)])
    end

    isHopping = true
    warn("hopServers -> teleporting to:", chosenJob)
    pcall(function()
        TeleportService:TeleportToPlaceInstance(game.PlaceId, chosenJob, player)
    end)
    task.wait(HOP_COOLDOWN)
    isHopping = false
end

-- isRiftValid: returns the rift instance if valid, otherwise nil
local function isRiftValid(riftName)
    if not riftName then return nil end
    local rendered = workspace:FindFirstChild("Rendered")
    if not rendered then return nil end
    local riftsFolder = rendered:FindFirstChild("Rifts")
    if not riftsFolder then return nil end
    local found = riftsFolder:FindFirstChild(riftName)
    if found and found:FindFirstChild("Display") and found.Display:IsA("BasePart") then
        return found
    end
    return nil
end

-- reportRift stub (no-op) - your task.spawn scanner already sends embeds so avoid duplicates
local function reportRift(riftData)
    -- intentionally left minimal to avoid double-sending.
    -- If you want the main loop to also build/send an embed, implement it here.
    return
end

-- rift scanner (keeps your embed appearance and includes rift info)
task.spawn(function()
    while true do
        local rendered = workspace:FindFirstChild("Rendered")
        if rendered then
            local riftsFolder = rendered:FindFirstChild("Rifts")
            if riftsFolder then
                for _, rift in ipairs(riftsFolder:GetChildren()) do
                    local nameLower = (rift.Name or ""):lower()
                    if nameLower:find("egg") and not alreadyFound[rift.Name] then
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

                        -- try to parse mm and ss, fallback to number-only minutes
                        pcall(function()
                            minutes = tonumber(timerText:match("(%d+) ?m")) or minutes
                            seconds = tonumber(timerText:match("(%d+) ?s")) or seconds
                            if minutes == 0 and seconds == 0 then
                                local mm, ss = timerText:match("(%d+):(%d+)")
                                if mm and ss then
                                    minutes = tonumber(mm) or 0
                                    seconds = tonumber(ss) or 0
                                else
                                    minutes = tonumber(timerText:match("(%d+)")) or minutes
                                end
                            end
                        end)

                        pcall(function()
                            if rift.GetPivot then
                                local riftHeight = rift:GetPivot().Position.Y
                                heightText = tostring(math.floor(riftHeight)) .. " studs"
                            elseif rift:FindFirstChild("Display") and rift.Display:IsA("BasePart") then
                                heightText = tostring(math.floor(rift.Display.Position.Y)) .. " studs"
                            end
                        end)

                        local formattedEggName = formatEggName(rift.Name)
                        local expireTimestamp = os.time() + (minutes * 60 + seconds)
                        local jobId = tostring(game.JobId or "")
                        local playerCount = #Players:GetPlayers()
                        local maxPlayers = Players.MaxPlayers or 0

                        local message = {
                            embeds = { {
                                title = formattedEggName .. " Has Been Found 🥚",
                                color = 0x00FF00,
                                fields = {
                                    { name = "🌍 Server Info", value = "Players Online: " .. playerCount .. "/" .. maxPlayers, inline = true },
                                    { name = "🎲 Rift Info", value = "Luck: " .. luckText .. "\nExpires: <t:" .. expireTimestamp .. ":R>" .. "\nHeight: " .. heightText, inline = true },
                                    { name = "🔗 Quick Join", value = "[Click to Join Server](https://www.roblox.com/games/start?placeId=" .. tostring(game.PlaceId) .. "&jobId=" .. jobId .. ")", inline = false }
                                },
                                timestamp = DateTime.now():ToIsoDate()
                            } }
                        }

                        -- send only to matching webhook(s)
                        for _, riftData in ipairs(RIFTS) do
                            if (riftData.Name and nameLower:find(riftData.Name:lower())) then
                                sendWebhook(riftData.Webhook, message)
                            end
                        end

                        alreadyFound[rift.Name] = true
                        task.delay(300, function() alreadyFound[rift.Name] = nil end)
                    end
                end
            end
        end
        task.wait(10)
    end
end)

-- main loop: keeps your hopping loop untouched and safe
while task.wait(MAIN_LOOP_DELAY) do
    for _, riftData in ipairs(RIFTS) do
        if isRiftValid and isRiftValid(riftData.Name) then
            reportRift(riftData)
        end
    end
    hopServers()
end
