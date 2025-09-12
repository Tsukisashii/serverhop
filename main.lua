local SERVER_LIST = { {"9094d9aa-b2db-4e69-ae9c-2cb97f855754","eda033c3-ffee-40d0-885b-3ce5583a5dac","945cec77-75d0-40b4-80d6-f503a68fc693","d2e55b15-1cb7-4756-b208-c8adffc88fa2","4b4ce9f0-ae7a-4ac8-9400-ed50bb9b2610","73e86b70-104d-4b6d-b2c5-2c873ff7c7b5","af7f4425-5ff2-4fed-8df5-4072c40df7bd","3f1aa2de-a68e-446c-8d89-6fb27abbe205","b298afa5-1b1a-4cf5-a4c8-c11985b4a070","9d9b97d4-6d89-40c3-96de-dc728b21d6c1","f016b121-f87d-4e5d-879b-257e69f737b2","424e9cf7-e004-4e2f-b2a5-f302c14a442e","e85e0192-498d-4472-9013-c422699a68f6","83dca79e-5443-46fe-9bb4-025cbd475167","8810a38e-dbfa-410c-839f-8912aec2fa9a","09813c99-28cd-49a3-9066-418b355eef67","b559228b-61a7-4034-915e-4d61d0dea9d6","ba1e1d36-5d7b-4211-8b00-d21d7eaf419a","b1baf086-f13c-4f47-98e1-704e4b150b47","7228cd45-4d05-4631-81ad-d348308ca3cc","64cb7bb3-3e4d-42e8-b90a-6b8842b23979","2943a542-4cac-4e8d-8606-cd6400a8ddcc","4239f64d-8066-44b6-83e1-b005e33cb766","24d2a20a-274f-4064-a491-a89761a79478","fbab143b-eb02-4a58-84e3-957ba2e4da40","d72e6414-8949-41d7-b21d-627ad5804e6b","e08e5031-ea7b-43a7-b1c4-90b76575ee5f","d3942769-1286-4c2e-a332-b61d43486376","e1b54a23-10d2-48f1-b85a-aacdeaf574c3","66bbba17-f308-4525-a28b-b6f6c94273ab","15f1a6c3-d84f-43a7-adff-5a8f5a8f43e8","82e14bd8-fcff-4391-a924-f68781ea6f4e","98ad5f10-c4de-442f-a925-930872af5fe1","af97a5f3-c2af-4bb4-9cd3-689632728676","a1d44cff-0117-4181-b67a-2d150dad350f","00a4a414-425f-4665-bd80-e99a51d08802","ed8fc636-8f85-4e68-844d-cff691dd5b25","0bbd31fc-e2d7-4d4e-a3cf-764dcc5a2678","f7c5ff12-b16c-4943-99ea-5cd3998d21f9","ad081a9b-81db-4746-aa7b-2f6dca6b23d5","9b858ac7-7c7d-4d9f-9087-21ce951b98a2","1feb34cb-9f31-4e09-bb28-7446f07980a6","544d7b23-6993-4def-9956-6cd287aad337","4fd751cb-b92b-4490-98df-11ea1b635e24","400a0cee-46a6-482c-8853-408e519cd716","1a1cfb0b-4530-4006-861d-002579d385d4","7daac744-0cc5-48a0-bd92-339772d754dd","097e640c-1144-447c-b4c5-0c4645e5e790","bfe4c571-caa8-47f5-a349-bcd1893b5ffe","df18f8a7-5d46-48f4-b0ee-a8fb3ebd609e"} }
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
    name = name:gsub("-", " ")
    return name:gsub("(%a)([%w]*)", function(first, rest)
        return first:upper() .. rest:lower()
    end)
end

-- send webhook
local function sendWebhook(url, payload)
    local body = HttpService:JSONEncode(payload)
    pcall(function()
        request({
            Url = url,
            Method = "POST",
            Headers = {["Content-Type"] = "application/json"},
            Body = body
        })
    end)
end

-- rift scanner
task.spawn(function()
    while true do
        local rendered = workspace:FindFirstChild("Rendered")
        if rendered then
            local riftsFolder = rendered:FindFirstChild("Rifts")
            if riftsFolder then
                for _, rift in ipairs(riftsFolder:GetChildren()) do
                    if rift.Name:lower():find("egg") and not alreadyFound[rift] then
                        local luckText, timerText, heightText = "N/A", "N/A", "N/A"
                        local minutes, seconds = 0, 0

                        pcall(function() luckText = rift.Display.SurfaceGui.Icon.Luck.Text end)
                        pcall(function()
                            timerText = rift.Display.SurfaceGui.Timer.Text
                            minutes = tonumber(timerText:match("(%d+) ?m")) or 0
                            seconds = tonumber(timerText:match("(%d+) ?s")) or 0
                        end)
                        pcall(function()
                            local riftHeight = rift:GetPivot().Position.Y
                            heightText = tostring(math.floor(riftHeight)) .. " studs"
                        end)

                        local formattedEggName = formatEggName(rift.Name)
                        local expireTimestamp = os.time() + (minutes * 60 + seconds)
                        local jobId = game.JobId
                        local playerCount = #Players:GetPlayers()
                        local maxPlayers = Players.MaxPlayers

                        local message = {
                            ["embeds"] = { {
                                ["title"] = formattedEggName .. " Has Been Found 🥚",
                                ["color"] = 0x00FF00,
                                ["fields"] = {
                                    {
                                        ["name"] = "🌍 Server Info",
                                        ["value"] = "Players Online: " .. playerCount .. "/" .. maxPlayers,
                                        ["inline"] = true
                                    },
                                    {
                                        ["name"] = "🎲 Rift Info",
                                        ["value"] = "Luck: " .. luckText ..
                                                   "\nExpires: <t:" .. expireTimestamp .. ":R>" ..
                                                   "\nHeight: " .. heightText,
                                        ["inline"] = true
                                    },
                                    {
                                        ["name"] = "🔗 Quick Join",
                                        ["value"] = "[Click to Join Server](https://www.roblox.com/games/start?placeId=" .. game.PlaceId .. "&jobId=" .. jobId .. ")",
                                        ["inline"] = false
                                    }
                                },
                                ["timestamp"] = DateTime.now():ToIsoDate()
                            } }
                        }

                        for _, riftData in ipairs(RIFTS) do
                            if rift.Name:lower():find(riftData.Name:lower()) then
                                sendWebhook(riftData.Webhook, message)
                            end
                        end

                        alreadyFound[rift] = true
                        task.delay(300, function() alreadyFound[rift] = nil end)
                    end
                end
            end
        end
        task.wait(10)
    end
end)

-- keep your hopping loop untouched
while task.wait(MAIN_LOOP_DELAY) do
    for _, riftData in ipairs(RIFTS) do
        if isRiftValid and isRiftValid(riftData.Name) then
            reportRift(riftData)
        end
    end
    if hopServers then
        hopServers()
    end
end
