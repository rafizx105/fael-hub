local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local LocalPlayer = Players.LocalPlayer
local autoSteal = false

local brainrotName = "Brainrot" -- Ajuste aqui se o nome for diferente
local baseName = "SafeZone"     -- Ajuste aqui se o nome for diferente

-- Criar GUI
local gui = Instance.new("ScreenGui", game.CoreGui)
gui.Name = "FaelHub"

local frame = Instance.new("Frame", gui)
frame.Size = UDim2.new(0, 200, 0, 160)
frame.Position = UDim2.new(0, 10, 0.4, 0)
frame.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
frame.BorderSizePixel = 0

local title = Instance.new("TextLabel", frame)
title.Size = UDim2.new(1, 0, 0, 30)
title.BackgroundTransparency = 1
title.Text = "🧠 Fael Hub"
title.Font = Enum.Font.SourceSansBold
title.TextSize = 22
title.TextColor3 = Color3.new(1, 1, 1)

local autoBtn = Instance.new("TextButton", frame)
autoBtn.Size = UDim2.new(1, -20, 0, 35)
autoBtn.Position = UDim2.new(0, 10, 0, 40)
autoBtn.Text = "Auto Steal: OFF"
autoBtn.Font = Enum.Font.SourceSans
autoBtn.TextSize = 18
autoBtn.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
autoBtn.TextColor3 = Color3.new(1, 1, 1)

local tpBrainrotBtn = Instance.new("TextButton", frame)
tpBrainrotBtn.Size = UDim2.new(1, -20, 0, 35)
tpBrainrotBtn.Position = UDim2.new(0, 10, 0, 85)
tpBrainrotBtn.Text = "🔄 Teleportar Brainrot"
tpBrainrotBtn.Font = Enum.Font.SourceSans
tpBrainrotBtn.TextSize = 18
tpBrainrotBtn.BackgroundColor3 = Color3.fromRGB(100, 40, 40)
tpBrainrotBtn.TextColor3 = Color3.new(1, 1, 1)

local tpBaseBtn = Instance.new("TextButton", frame)
tpBaseBtn.Size = UDim2.new(1, -20, 0, 35)
tpBaseBtn.Position = UDim2.new(0, 10, 0, 130)
tpBaseBtn.Text = "🏠 Teleportar Base"
tpBaseBtn.Font = Enum.Font.SourceSans
tpBaseBtn.TextSize = 18
tpBaseBtn.BackgroundColor3 = Color3.fromRGB(40, 100, 40)
tpBaseBtn.TextColor3 = Color3.new(1, 1, 1)

-- Toggle Auto Steal
autoBtn.MouseButton1Click:Connect(function()
	autoSteal = not autoSteal
	autoBtn.Text = "Auto Steal: " .. (autoSteal and "ON" or "OFF")
end)

-- Teleporte Brainrot (pega o brainrot e leva pra base)
tpBrainrotBtn.MouseButton1Click:Connect(function()
	local hrp = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
	local brainrot = workspace:FindFirstChild(brainrotName)
	local base = workspace:FindFirstChild(baseName)
	if hrp and brainrot and base then
		pcall(function()
			hrp.CFrame = brainrot.CFrame + Vector3.new(0, 3, 0)
			wait(0.3)
			firetouchinterest(hrp, brainrot, 0)
			wait(0.2)
			firetouchinterest(hrp, brainrot, 1)
			wait(0.3)
			hrp.CFrame = base.CFrame + Vector3.new(0, 3, 0)
		end)
	end
end)

-- Teleporte só para a base
tpBaseBtn.MouseButton1Click:Connect(function()
	local hrp = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
	local base = workspace:FindFirstChild(baseName)
	if hrp and base then
		pcall(function()
			hrp.CFrame = base.CFrame + Vector3.new(0, 3, 0)
		end)
	end
end)

-- Loop Auto Steal
RunService.RenderStepped:Connect(function()
	if autoSteal then
		local hrp = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
		local brainrot = workspace:FindFirstChild(brainrotName)
		local base = workspace:FindFirstChild(baseName)
		if hrp and brainrot and base then
			pcall(function()
				hrp.CFrame = brainrot.CFrame + Vector3.new(0, 3, 0)
				wait(0.3)
				firetouchinterest(hrp, brainrot, 0)
				wait(0.2)
				firetouchinterest(hrp, brainrot, 1)
				wait(0.3)
				hrp.CFrame = base.CFrame + Vector3.new(0, 3, 0)
			end)
			wait(1.5)
		end
	end
end)
