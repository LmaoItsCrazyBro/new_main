local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local playerName = LocalPlayer.Name

local function RunFly(speed)
    local MainFramework = require(game:GetService("ReplicatedStorage")
        :WaitForChild("HDAdminHDClient")
        :WaitForChild("SharedModules")
        :WaitForChild("MainFramework"))

    local main = MainFramework:CheckInitialized()

    main.commandSpeeds[playerName] = speed or 50
    main.commandsActive[playerName] = true

    local FlyModule = require(game:GetService("ReplicatedStorage")
        :WaitForChild("HDAdminHDClient")
        :WaitForChild("Modules")
        :WaitForChild("FlyCommand"))

    FlyModule:Fly(playerName)
end

RunFly(50) -- speed you want here, and can be run multiple times btw
