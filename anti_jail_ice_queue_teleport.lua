local TeleportService = cloneref and cloneref(game:GetService("TeleportService")) or game:GetService("TeleportService")
local RunService = cloneref and cloneref(game:GetService("RunService")) or game:GetService("RunService")
repeat wait() until game.Players.LocalPlayer
local LocalPlayer = game.Players.LocalPlayer
LocalPlayer.CharacterAdded:Wait()
task.wait(0.1)
repeat wait() until LocalPlayer.Character:FindFirstChild("Humanoid") and LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
local PlaceID = game.PlaceId
local JobID = game.JobId
warn("[INFORMATION_DEBUG]: Initializing automatic Anti-Teleport and Anti-Ice scripts...")

local function Rejoin()
    TeleportService:TeleportToPlaceInstance(PlaceID, JobID, LocalPlayer)
end

warn("[INFORMATION_DEBUG]: Preparing Ice, Freeze and Jail connections...")

LocalPlayer.OnTeleport:Connect(function(State)
    if (not getgenv().Anti_Ice_Jail_AutoRun) and getgenv().queueteleport then
        getgenv().Anti_Ice_Jail_AutoRun = true
        queueteleport("loadstring(game:HttpGet(('https://raw.githubusercontent.com/LmaoItsCrazyBro/new_main/refs/heads/main/anti_jail_ice_queue_teleport.lua')))()")
    else
        return getgenv().notify("Failure:", "Your executor does not support 'queueteleport'!", 6)
    end
end)

local JailCellConnection
getgenv().JailCellCheckEnabled = false
local IceBlockConnection
local FreezeCheckConnection
getgenv().IceBlockCheckEnabled = false
task.wait()
local function EnableJailCellWatcher()
    if JailCellConnection then return end
    getgenv().JailCellCheckEnabled = true

    JailCellConnection = workspace.DescendantAdded:Connect(function(descendant)
        if not getgenv().JailCellCheckEnabled then return end
        if descendant:IsA("Model") and descendant.Name == LocalPlayer.Name.."'s JailCell" then
            Rejoin()
        end
    end)
end

local function EnableIceWatcher()
    if IceBlockConnection then return end
    getgenv().IceBlockCheckEnabled = true

    IceBlockConnection = workspace.DescendantAdded:Connect(function(descendant)
        if not getgenv().IceBlockCheckEnabled then return end
        if descendant:IsA("Part") and descendant.Name == LocalPlayer.Name.."'s FreezeBlock" then
            Rejoin()
        end
    end)

    FreezeCheckConnection = RunService.Heartbeat:Connect(function()
        if not getgenv().IceBlockCheckEnabled then return end

        local character = LocalPlayer.Character
        if character and IsFullyFrozen() then
            Rejoin()
        end
    end)
end

warn("[INFORMATION_DEBUG]: Toggling functions for Anti Ice/Freeze, and Jail scripts...")

EnableJailCellWatcher()
EnableIceWatcher()
warn("[INFORMATION_DEBUG-LOG]: Successfully intialized and loaded Anti-Jail and Anti-Ice automatically.")
