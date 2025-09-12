local SERVER_LIST = {"af97a5f3-c2af-4bb4-9cd3-689632728676","3f1aa2de-a68e-446c-8d89-6fb27abbe205","b298afa5-1b1a-4cf5-a4c8-c11985b4a070","f016b121-f87d-4e5d-879b-257e69f737b2","e85e0192-498d-4472-9013-c422699a68f6","424e9cf7-e004-4e2f-b2a5-f302c14a442e","83dca79e-5443-46fe-9bb4-025cbd475167","09813c99-28cd-49a3-9066-418b355eef67","b559228b-61a7-4034-915e-4d61d0dea9d6","b1baf086-f13c-4f47-98e1-704e4b150b47","9094d9aa-b2db-4e69-ae9c-2cb97f855754","eda033c3-ffee-40d0-885b-3ce5583a5dac","945cec77-75d0-40b4-80d6-f503a68fc693","73e86b70-104d-4b6d-b2c5-2c873ff7c7b5","2943a542-4cac-4e8d-8606-cd6400a8ddcc","4fd751cb-b92b-4490-98df-11ea1b635e24","9d9b97d4-6d89-40c3-96de-dc728b21d6c1","a1d44cff-0117-4181-b67a-2d150dad350f","ed8fc636-8f85-4e68-844d-cff691dd5b25","0bbd31fc-e2d7-4d4e-a3cf-764dcc5a2678","f7c5ff12-b16c-4943-99ea-5cd3998d21f9","ad081a9b-81db-4746-aa7b-2f6dca6b23d5","9b858ac7-7c7d-4d9f-9087-21ce951b98a2","1feb34cb-9f31-4e09-bb28-7446f07980a6","544d7b23-6993-4def-9956-6cd287aad337","746e2103-28a8-4bf3-875e-4dfb87de7cb4","400a0cee-46a6-482c-8853-408e519cd716","1a1cfb0b-4530-4006-861d-002579d385d4","7228cd45-4d05-4631-81ad-d348308ca3cc","64cb7bb3-3e4d-42e8-b90a-6b8842b23979","4239f64d-8066-44b6-83e1-b005e33cb766","d179775d-d8c6-4787-a297-88b89e6924d1","24d2a20a-274f-4064-a491-a89761a79478","fbab143b-eb02-4a58-84e3-957ba2e4da40","2b07ef16-a23c-4e2f-b51f-01619c739372","d72e6414-8949-41d7-b21d-627ad5804e6b","e08e5031-ea7b-43a7-b1c4-90b76575ee5f","4b4ce9f0-ae7a-4ac8-9400-ed50bb9b2610","d3942769-1286-4c2e-a332-b61d43486376","e1b54a23-10d2-48f1-b85a-aacdeaf574c3","66bbba17-f308-4525-a28b-b6f6c94273ab","15f1a6c3-d84f-43a7-adff-5a8f5a8f43e8","82e14bd8-fcff-4391-a924-f68781ea6f4e","df9112fd-8528-46b7-97ed-6286169b7e30","98ad5f10-c4de-442f-a925-930872af5fe1","3fa30d05-200f-4201-abbb-d6c6dc6f3cc8","00a4a414-425f-4665-bd80-e99a51d08802","2298e01a-284e-47dc-b536-c03d4d99ed07","de05fbcd-6b1d-4320-91b8-1f07c2d679cb","67d18f08-3f28-428a-a7d9-52a32a984d4e"}
local HttpService = game:GetService("HttpService")
local TeleportService = game:GetService("TeleportService")
local Players = game:GetService("Players")
local workspace = game:GetService("Workspace")

local player = Players.LocalPlayer

local RIFTS = {
    {Name = "gift-rift", Webhook = "https://discord.com/api/webhooks/1415712364007002143/p80C7QElE5O1EEDo-0IKJA5cGiG31O8qlEBQ1dgmibyOtO2Fr228CK7-JQiM2vpLb8Mz"},
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

local function getServerArray()
    if type(SERVER_LIST) ~= "table" then return {} end
    if type(SERVER_LIST[1]) == "table" then
        return SERVER_LIST[1]
    end
    return SERVER_LIST
end

local function hopServers()
    if isHopping then return end
    local servers = getServerArray()
    if not servers or #servers == 0 then
        warn("hopServers: no servers available in SERVER_LIST")
        return
    end

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

local function reportRift(riftData)
    return
end

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

while task.wait(MAIN_LOOP_DELAY) do
    for _, riftData in ipairs(RIFTS) do
        if isRiftValid and isRiftValid(riftData.Name) then
            reportRift(riftData)
        end
    end
    hopServers()
end
