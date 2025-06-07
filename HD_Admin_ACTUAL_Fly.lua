local success, clonerefFunc = pcall(function() return cloneref end)
local Players = success and clonerefFunc(game:GetService("Players")) or game:GetService("Players")
local ReplicatedStorage = success and clonerefFunc(game:GetService("ReplicatedStorage")) or game:GetService("ReplicatedStorage")
local UserInputService = success and clonerefFunc(game:GetService("UserInputService")) or game:GetService("UserInputService")
local LocalPlayer = Players.LocalPlayer
local playerName = LocalPlayer.Name
local MainFramework = require(ReplicatedStorage:WaitForChild("HDAdminClient"):WaitForChild("SharedModules"):WaitForChild("MainFramework"))
local FlyModule = require(ReplicatedStorage:WaitForChild("HDAdminClient"):WaitForChild("Modules"):WaitForChild("FlyCommand"))
local main = MainFramework:CheckInitialized()

local PlayerGui = LocalPlayer:WaitForChild("PlayerGui")
local gui = Instance.new("ScreenGui")
gui.Name = "FlyGui"
gui.ResetOnSpawn = false
gui.IgnoreGuiInset = true
gui.Parent = PlayerGui

local frame = Instance.new("Frame")
frame.Size = UDim2.new(0, 250, 0, 55)
frame.Position = UDim2.new(1, -260, 1, -70)
frame.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
frame.BackgroundTransparency = 0.15
frame.BorderSizePixel = 0
frame.Parent = gui

local toggleButton = Instance.new("TextButton")
toggleButton.Size = UDim2.new(0, 100, 1, 0)
toggleButton.Position = UDim2.new(0, 0, 0, 0)
toggleButton.Text = "FLY: [OFF]"
toggleButton.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
toggleButton.TextColor3 = Color3.fromRGB(255, 255, 255)
toggleButton.Font = Enum.Font.SourceSansBold
toggleButton.TextScaled = true
toggleButton.Parent = frame

local speedBox = Instance.new("TextBox")
speedBox.Size = UDim2.new(0, 100, 1, 0)
speedBox.Position = UDim2.new(0, 105, 0, 0)
speedBox.Text = "50"
speedBox.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
speedBox.TextColor3 = Color3.fromRGB(255, 255, 255)
speedBox.Font = Enum.Font.SourceSans
speedBox.TextScaled = true
speedBox.ClearTextOnFocus = false
speedBox.Parent = frame

local closeButton = Instance.new("TextButton")
closeButton.Size = UDim2.new(0, 40, 1, 0)
closeButton.Position = UDim2.new(0, 210, 0, 0)
closeButton.Text = "X"
closeButton.BackgroundColor3 = Color3.fromRGB(55, 0, 0)
closeButton.TextColor3 = Color3.fromRGB(255, 255, 255)
closeButton.Font = Enum.Font.SourceSansBold
closeButton.TextScaled = true
closeButton.Parent = frame

local flyEnabled = false

local function updateGuiState()
    toggleButton.Text = flyEnabled and "FLY: [ON]" or "FLY: [OFF]"
end

local function toggleFly()
    local speed = tonumber(speedBox.Text) or 50
    if not flyEnabled then
        main.commandSpeeds[playerName] = speed
        main.commandsActive[playerName] = true
        FlyModule:Fly(playerName)
        flyEnabled = true
    else
        main.commandsActive[playerName] = false
        FlyModule:Fly(playerName)
        flyEnabled = false
    end
    updateGuiState()
end

toggleButton.MouseButton1Click:Connect(toggleFly)

UserInputService.InputBegan:Connect(function(input, gameProcessed)
    if input.UserInputType == Enum.UserInputType.Keyboard and input.KeyCode == Enum.KeyCode.E then
        if not speedBox:IsFocused() then
            toggleFly()
        end
    end
end)

speedBox.FocusLost:Connect(function()
    if flyEnabled then
        local newSpeed = tonumber(speedBox.Text) or 50
        main.commandSpeeds[playerName] = newSpeed
    end
end)

closeButton.MouseButton1Click:Connect(function()
    gui:Destroy()
end)

flyEnabled = main.commandsActive[playerName] or false
updateGuiState()
