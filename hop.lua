local RIFTS = {
    {Name = "lunar-egg", Webhook = "https://discord.com/api/webhooks/1415712364007002143/p80C7QElE5O1EEDo-0IKJA5cGiG31O8qlEBQ1dgmibyOtO2Fr228CK7-JQiM2vpLb8Mz", MinLuck = 25}, 
    {Name = "brainrot-egg", Webhook = "https://discord.com/api/webhooks/1415718364055077025/_cblNWmsQS35E-1xCz-CQWYMbiKm4aFncF_0ngpDsavEPFPbfL5QUE1nP7kmk2xWzy1V"} 
}

local HOP_COOLDOWN = 3
local IDLE_HOP_TIME = 2
local isHopping = false
local alreadyFound = {}
local lastCheck = tick()

loadstring(game:HttpGet("https://raw.githubusercontent.com/Tsukisashii/serverhop/refs/heads/main/main.lua"))()
