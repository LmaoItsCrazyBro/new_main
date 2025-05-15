if getgenv().AntiBlurConnection then
    getgenv().AntiBlurConnection:Disconnect()
end

local Workspace = cloneref and cloneref(game:GetService("Workspace")) or game:GetService("Workspace")
local Players = cloneref and cloneref(game:GetService("Players")) or game:GetService("Players")
local Camera = Workspace.CurrentCamera

getgenv().AntiBlurEnabled = true
getgenv().AntiBlurConnection = nil

local function RemoveBlurEffects(cam)
    for _, child in ipairs(cam:GetChildren()) do
        if child:IsA("BlurEffect") then
            child:Destroy()
        end
    end
end

local function SetupBlurWatcher()
    if getgenv().AntiBlurConnection then
        getgenv().AntiBlurConnection:Disconnect()
    end

    if not getgenv().AntiBlurEnabled then return end
    RemoveBlurEffects(Camera)

    getgenv().AntiBlurConnection = Camera.ChildAdded:Connect(function(child)
        if getgenv().AntiBlurEnabled and child:IsA("BlurEffect") then
            task.wait() -- slight delay in case it's added async
            if child and child.Parent == Camera then
                child:Destroy()
            end
        end
    end)
end

workspace:GetPropertyChangedSignal("CurrentCamera"):Connect(function()
    Camera = workspace.CurrentCamera
    SetupBlurWatcher()
end)

SetupBlurWatcher()

getgenv().ToggleAntiBlur = function(state)
    getgenv().AntiBlurEnabled = (state ~= false) -- default true
    SetupBlurWatcher()
end
