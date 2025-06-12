local Players = cloneref and cloneref(game:GetService("Players")) or game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local Vehicles_LocalPlayer_Folder = LocalPlayer:FindFirstChild("Vehicles")
local Workspace = cloneref and cloneref(game:GetService("Workspace")) or game:GetService("Workspace")
local Main_Folder = Workspace:FindFirstChild("_Main")
local Vehicles_Folder = Main_Folder and Main_Folder:FindFirstChild("Vehicles")

local function retrieve_vehicle()
    if not Vehicles_Folder or not Vehicles_LocalPlayer_Folder then return nil end
    local objectValue = Vehicles_LocalPlayer_Folder:FindFirstChildOfClass("ObjectValue")
    if not objectValue then return nil end
    for _, v in ipairs(Vehicles_Folder:GetChildren()) do
        if v:IsA("Model") and v.Name == tostring(objectValue.Value) then
            return v
        end
    end
    return nil
end

local Vehicle = retrieve_vehicle()
local PlayerName = "" -- What ever player name you want here.
local TargetPlayer = Players:FindFirstChild(PlayerName)

if Vehicle and TargetPlayer and TargetPlayer.Character then
    local charPivot = TargetPlayer.Character:GetPivot()
    local newCFrame = charPivot + Vector3.new(0, 15, 0)
    
    Vehicle:PivotTo(newCFrame)
end
