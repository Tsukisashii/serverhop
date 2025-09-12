local SERVER_LIST = {}
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
    return name:gsub("(%a)([%w]*)", function(first, rest) return first:upper() .. rest:lower() end)
end

-- send to discord
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

-- hop servers
local function hopServers()
    if isHopping or #SERVER_LIST == 0 then return end
    isHopping = true
    local jobId = SERVER_LIST[math.random(1, #SERVER_LIST)]
    pcall(function()
        TeleportService:TeleportToPlaceInstance(game.PlaceId, jobId, player)
    end)
    task.wait(HOP_COOLDOWN)
    isHopping = false
end

-- scan for rifts
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
                            ["embeds"] = {{
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
                            }}
                        }

                        -- send only to matching webhook
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

-- main loop for hopping
while task.wait(MAIN_LOOP_DELAY) do
    hopServers()
end