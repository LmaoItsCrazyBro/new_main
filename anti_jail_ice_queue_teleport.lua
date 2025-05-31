if game.PlaceId == 83312952548612 then
    if not game:IsLoaded() then
        game.Loaded:Wait()
    end

    local TeleportService = cloneref and cloneref(game:GetService("TeleportService")) or game:GetService("TeleportService")
    local RunService = cloneref and cloneref(game:GetService("RunService")) or game:GetService("RunService")

    while not game.Players.LocalPlayer do
        task.wait()
    end
    local LocalPlayer = game.Players.LocalPlayer

    local function WaitForCharacter()
        if not LocalPlayer.Character or not LocalPlayer.Character:FindFirstChild("Humanoid") or not LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
            LocalPlayer.CharacterAdded:Wait()
            repeat
                task.wait()
            until LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") and LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
        end
    end

    WaitForCharacter()

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

    warn("[INFORMATION_DEBUG]: We have successfully initialized Teleport use for LocalPlayer.")

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

            LocalPlayer.CharacterAdded:Wait()
            wait(1)
            local character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()

            if not character then
                LocalPlayer.CharacterAdded:Wait()
            end
            task.wait(1)
            if character and IsFullyFrozen() then
                Rejoin()
            end
        end)
    end

    warn("[INFORMATION_DEBUG]: Toggling functions for Anti Ice/Freeze, and Jail scripts...")

    EnableJailCellWatcher()
    EnableIceWatcher()
    warn("[INFORMATION_DEBUG-LOG]: Successfully intialized and loaded Anti-Jail and Anti-Ice automatically.")
end
