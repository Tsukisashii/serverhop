local SERVER_LIST = "SERVER_LIST_PLACEHOLDER" -- This will be replaced automatically
local HttpService = game:GetService("HttpService")
local TeleportService = game:GetService("TeleportService")
local Players = game:GetService("Players")
local workspace = game:GetService("Workspace")

local player = Players.LocalPlayer
local isHopping = false
local HOP_COOLDOWN = 5 -- seconds

local RIFTS = {
    {Name = "void-egg", Webhook = "https://discord.com/api/webhooks/1415712364007002143/p80C7QElE5O1EEDo-0IKJA5cGiG31O8qlEBQ1dgmibyOtO2Fr228CK7-JQiM2vpLb8Mz"},
    {Name = "FestiveRift", Webhook = "https://discord.com/api/webhooks/1415718364055077025/_cblNWmsQS35E-1xCz-CQWYMbiKm4aFncF_0ngpDsavEPFPbfL5QUE1nP7kmk2xWzy1V"}
}

local function isRiftValid(riftName)
    local rift = workspace.Rendered.Rifts:FindFirstChild(riftName)
    return rift and rift:FindFirstChild("Display") and rift.Display:IsA("BasePart") and rift or nil
end

local function sendWebhook(url, content)
    if not url or url == "" then return end
    local payload = HttpService:JSONEncode({content = content})
    pcall(function()
        if syn and syn.request then
            syn.request({Url=url, Method="POST", Headers={["Content-Type"]="application/json"}, Body=payload})
        end
    end)
end

local function checkRifts()
    for _, riftData in ipairs(RIFTS) do
        local rift = isRiftValid(riftData.Name)
        if rift then
            local link = string.format("roblox://experiences/start?placeId=%d&gameInstanceId=%s", game.PlaceId, game.JobId)
            sendWebhook(riftData.Webhook, "**" .. riftData.Name .. " Found!**\n" .. link)
        end
    end
end

local function hopServers()
    if isHopping then return end
    isHopping = true
    local jobId = SERVER_LIST[math.random(1,#SERVER_LIST)]
    pcall(function() TeleportService:TeleportToPlaceInstance(game.PlaceId, jobId, player) end)
    wait(HOP_COOLDOWN)
    isHopping = false
end

while wait(5) do
    checkRifts()
    hopServers()
end
