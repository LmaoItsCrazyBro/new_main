getgenv().AntiTeleport = true

local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
repeat task.wait() until LocalPlayer and LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart")

local HRP = LocalPlayer.Character:WaitForChild("HumanoidRootPart")
local lastCFrame = HRP.CFrame

task.spawn(function()
	while task.wait(0.05) do
		if not getgenv().AntiTeleport then
			lastCFrame = HRP.CFrame
			continue
		end

		if (HRP.CFrame.Position - lastCFrame.Position).Magnitude > 5 then
			warn("[AntiTeleport] Unauthorized CFrame movement detected. Reverting...")
			HRP.CFrame = lastCFrame
		else
			lastCFrame = HRP.CFrame
		end
	end
end)
