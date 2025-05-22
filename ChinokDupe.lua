-- CHINOK Premium UI
-- Enhanced version with premium styling

local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")

-- Create main GUI
local ScreenGui = Instance.new("ScreenGui")
local MainFrame = Instance.new("Frame")
local TopBar = Instance.new("Frame")
local Title = Instance.new("TextLabel")
local CloseButton = Instance.new("TextButton")
local MinimizeButton = Instance.new("TextButton")
local ContentFrame = Instance.new("Frame")
local SidePanel = Instance.new("Frame")
local MainPanel = Instance.new("Frame")
local GradientBg = Instance.new("Frame")
local UIGradient = Instance.new("UIGradient")

-- Premium styling setup
ScreenGui.Name = "CHINOK_Premium"
ScreenGui.Parent = game.CoreGui
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

-- Main frame with rounded corners and shadow
MainFrame.Name = "MainFrame"
MainFrame.Parent = ScreenGui
MainFrame.BackgroundColor3 = Color3.fromRGB(15, 15, 20)
MainFrame.BorderSizePixel = 0
MainFrame.Position = UDim2.new(0.5, -400, 0.5, -250)
MainFrame.Size = UDim2.new(0, 800, 0, 500)
MainFrame.Active = true
MainFrame.Draggable = true

-- Rounded corners
local MainCorner = Instance.new("UICorner")
MainCorner.CornerRadius = UDim.new(0, 15)
MainCorner.Parent = MainFrame

-- Drop shadow effect
local Shadow = Instance.new("Frame")
Shadow.Name = "Shadow"
Shadow.Parent = ScreenGui
Shadow.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
Shadow.BackgroundTransparency = 0.7
Shadow.BorderSizePixel = 0
Shadow.Position = UDim2.new(0.5, -395, 0.5, -245)
Shadow.Size = UDim2.new(0, 810, 0, 510)
Shadow.ZIndex = MainFrame.ZIndex - 1

local ShadowCorner = Instance.new("UICorner")
ShadowCorner.CornerRadius = UDim.new(0, 15)
ShadowCorner.Parent = Shadow

-- Animated gradient background
GradientBg.Name = "GradientBg"
GradientBg.Parent = MainFrame
GradientBg.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
GradientBg.BorderSizePixel = 0
GradientBg.Size = UDim2.new(1, 0, 1, 0)
GradientBg.ZIndex = 1

local GradientBgCorner = Instance.new("UICorner")
GradientBgCorner.CornerRadius = UDim.new(0, 15)
GradientBgCorner.Parent = GradientBg

UIGradient.Color = ColorSequence.new{
    ColorSequenceKeypoint.new(0.00, Color3.fromRGB(25, 25, 35)),
    ColorSequenceKeypoint.new(0.50, Color3.fromRGB(35, 25, 45)),
    ColorSequenceKeypoint.new(1.00, Color3.fromRGB(25, 35, 25))
}
UIGradient.Rotation = 45
UIGradient.Parent = GradientBg

-- Top bar with glass effect
TopBar.Name = "TopBar"
TopBar.Parent = MainFrame
TopBar.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TopBar.BackgroundTransparency = 0.95
TopBar.BorderSizePixel = 0
TopBar.Size = UDim2.new(1, 0, 0, 60)
TopBar.ZIndex = 3

local TopBarCorner = Instance.new("UICorner")
TopBarCorner.CornerRadius = UDim.new(0, 15)
TopBarCorner.Parent = TopBar

-- Title with premium font and glow
Title.Name = "Title"
Title.Parent = TopBar
Title.BackgroundTransparency = 1
Title.Position = UDim2.new(0, 20, 0, 0)
Title.Size = UDim2.new(0, 200, 1, 0)
Title.Font = Enum.Font.GothamBold
Title.Text = "CHINOK"
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.TextSize = 24
Title.TextXAlignment = Enum.TextXAlignment.Left
Title.ZIndex = 4

-- Add text stroke for glow effect
local TitleStroke = Instance.new("UIStroke")
TitleStroke.Color = Color3.fromRGB(100, 255, 255)
TitleStroke.Thickness = 1
TitleStroke.Transparency = 0.5
TitleStroke.Parent = Title

-- Version label
local VersionLabel = Instance.new("TextLabel")
VersionLabel.Name = "Version"
VersionLabel.Parent = TopBar
VersionLabel.BackgroundTransparency = 1
VersionLabel.Position = UDim2.new(0, 85, 0, 0)
VersionLabel.Size = UDim2.new(0, 100, 1, 0)
VersionLabel.Font = Enum.Font.Gotham
VersionLabel.Text = "PREMIUM"
VersionLabel.TextColor3 = Color3.fromRGB(255, 215, 0)
VersionLabel.TextSize = 12
VersionLabel.TextXAlignment = Enum.TextXAlignment.Left
VersionLabel.ZIndex = 4

-- Close button with hover effects
CloseButton.Name = "CloseButton"
CloseButton.Parent = TopBar
CloseButton.BackgroundColor3 = Color3.fromRGB(255, 95, 95)
CloseButton.BorderSizePixel = 0
CloseButton.Position = UDim2.new(1, -45, 0, 15)
CloseButton.Size = UDim2.new(0, 30, 0, 30)
CloseButton.Font = Enum.Font.GothamBold
CloseButton.Text = "×"
CloseButton.TextColor3 = Color3.fromRGB(255, 255, 255)
CloseButton.TextSize = 18
CloseButton.ZIndex = 4

local CloseCorner = Instance.new("UICorner")
CloseCorner.CornerRadius = UDim.new(0, 15)
CloseCorner.Parent = CloseButton

-- Minimize button
MinimizeButton.Name = "MinimizeButton"
MinimizeButton.Parent = TopBar
MinimizeButton.BackgroundColor3 = Color3.fromRGB(255, 195, 95)
MinimizeButton.BorderSizePixel = 0
MinimizeButton.Position = UDim2.new(1, -80, 0, 15)
MinimizeButton.Size = UDim2.new(0, 30, 0, 30)
MinimizeButton.Font = Enum.Font.GothamBold
MinimizeButton.Text = "−"
MinimizeButton.TextColor3 = Color3.fromRGB(255, 255, 255)
MinimizeButton.TextSize = 18
MinimizeButton.ZIndex = 4

local MinCorner = Instance.new("UICorner")
MinCorner.CornerRadius = UDim.new(0, 15)
MinCorner.Parent = MinimizeButton

-- Content frame
ContentFrame.Name = "ContentFrame"
ContentFrame.Parent = MainFrame
ContentFrame.BackgroundTransparency = 1
ContentFrame.Position = UDim2.new(0, 0, 0, 60)
ContentFrame.Size = UDim2.new(1, 0, 1, -60)
ContentFrame.ZIndex = 2

-- Side panel with glass effect
SidePanel.Name = "SidePanel"
SidePanel.Parent = ContentFrame
SidePanel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
SidePanel.BackgroundTransparency = 0.97
SidePanel.BorderSizePixel = 0
SidePanel.Size = UDim2.new(0, 200, 1, 0)
SidePanel.ZIndex = 3

local SidePanelCorner = Instance.new("UICorner")
SidePanelCorner.CornerRadius = UDim.new(0, 10)
SidePanelCorner.Parent = SidePanel

-- Main panel
MainPanel.Name = "MainPanel"
MainPanel.Parent = ContentFrame
MainPanel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
MainPanel.BackgroundTransparency = 0.98
MainPanel.BorderSizePixel = 0
MainPanel.Position = UDim2.new(0, 210, 0, 10)
MainPanel.Size = UDim2.new(1, -220, 1, -20)
MainPanel.ZIndex = 3

local MainPanelCorner = Instance.new("UICorner")
MainPanelCorner.CornerRadius = UDim.new(0, 10)
MainPanelCorner.Parent = MainPanel

-- Tab button (Main)
local TabButton = Instance.new("TextButton")
TabButton.Name = "MainTab"
TabButton.Parent = SidePanel
TabButton.BackgroundColor3 = Color3.fromRGB(100, 255, 255)
TabButton.BackgroundTransparency = 0.8
TabButton.BorderSizePixel = 0
TabButton.Position = UDim2.new(0, 10, 0, 20)
TabButton.Size = UDim2.new(1, -20, 0, 40)
TabButton.Font = Enum.Font.GothamSemibold
TabButton.Text = "🚀 Main"
TabButton.TextColor3 = Color3.fromRGB(255, 255, 255)
TabButton.TextSize = 16
TabButton.ZIndex = 4

local TabCorner = Instance.new("UICorner")
TabCorner.CornerRadius = UDim.new(0, 8)
TabCorner.Parent = TabButton

-- Create premium buttons
local function CreatePremiumButton(name, position, callback)
    local button = Instance.new("TextButton")
    button.Name = name
    button.Parent = MainPanel
    button.BackgroundColor3 = Color3.fromRGB(100, 255, 255)
    button.BackgroundTransparency = 0.3
    button.BorderSizePixel = 0
    button.Position = position
    button.Size = UDim2.new(0, 280, 0, 50)
    button.Font = Enum.Font.GothamBold
    button.Text = name
    button.TextColor3 = Color3.fromRGB(255, 255, 255)
    button.TextSize = 16
    button.ZIndex = 4
    
    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, 12)
    corner.Parent = button
    
    local gradient = Instance.new("UIGradient")
    gradient.Color = ColorSequence.new{
        ColorSequenceKeypoint.new(0.00, Color3.fromRGB(100, 255, 255)),
        ColorSequenceKeypoint.new(1.00, Color3.fromRGB(255, 100, 255))
    }
    gradient.Rotation = 45
    gradient.Parent = button
    
    -- Hover effects
    button.MouseEnter:Connect(function()
        TweenService:Create(button, TweenInfo.new(0.2), {BackgroundTransparency = 0.1}):Play()
        TweenService:Create(button, TweenInfo.new(0.2), {Size = UDim2.new(0, 290, 0, 55)}):Play()
    end)
    
    button.MouseLeave:Connect(function()
        TweenService:Create(button, TweenInfo.new(0.2), {BackgroundTransparency = 0.3}):Play()
        TweenService:Create(button, TweenInfo.new(0.2), {Size = UDim2.new(0, 280, 0, 50)}):Play()
    end)
    
    button.MouseButton1Click:Connect(callback)
    
    return button
end

-- Create premium slider
local function CreatePremiumSlider()
    local sliderFrame = Instance.new("Frame")
    sliderFrame.Name = "SliderFrame"
    sliderFrame.Parent = MainPanel
    sliderFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    sliderFrame.BackgroundTransparency = 0.9
    sliderFrame.BorderSizePixel = 0
    sliderFrame.Position = UDim2.new(0, 30, 0, 200)
    sliderFrame.Size = UDim2.new(0, 280, 0, 80)
    sliderFrame.ZIndex = 4
    
    local sliderCorner = Instance.new("UICorner")
    sliderCorner.CornerRadius = UDim.new(0, 12)
    sliderCorner.Parent = sliderFrame
    
    local sliderLabel = Instance.new("TextLabel")
    sliderLabel.Name = "SliderLabel"
    sliderLabel.Parent = sliderFrame
    sliderLabel.BackgroundTransparency = 1
    sliderLabel.Size = UDim2.new(1, 0, 0, 30)
    sliderLabel.Font = Enum.Font.GothamBold
    sliderLabel.Text = "🎯 Multiplier: 2"
    sliderLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    sliderLabel.TextSize = 16
    sliderLabel.ZIndex = 5
    
    local sliderBg = Instance.new("Frame")
    sliderBg.Name = "SliderBg"
    sliderBg.Parent = sliderFrame
    sliderBg.BackgroundColor3 = Color3.fromRGB(50, 50, 60)
    sliderBg.BorderSizePixel = 0
    sliderBg.Position = UDim2.new(0, 20, 0, 40)
    sliderBg.Size = UDim2.new(1, -40, 0, 20)
    sliderBg.ZIndex = 5
    
    local sliderBgCorner = Instance.new("UICorner")
    sliderBgCorner.CornerRadius = UDim.new(0, 10)
    sliderBgCorner.Parent = sliderBg
    
    local sliderFill = Instance.new("Frame")
    sliderFill.Name = "SliderFill"
    sliderFill.Parent = sliderBg
    sliderFill.BackgroundColor3 = Color3.fromRGB(100, 255, 255)
    sliderFill.BorderSizePixel = 0
    sliderFill.Size = UDim2.new(0, 0, 1, 0)
    sliderFill.ZIndex = 6
    
    local fillCorner = Instance.new("UICorner")
    fillCorner.CornerRadius = UDim.new(0, 10)
    fillCorner.Parent = sliderFill
    
    local sliderButton = Instance.new("TextButton")
    sliderButton.Name = "SliderButton"
    sliderButton.Parent = sliderBg
    sliderButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    sliderButton.BorderSizePixel = 0
    sliderButton.Position = UDim2.new(0, -10, 0, -5)
    sliderButton.Size = UDim2.new(0, 30, 0, 30)
    sliderButton.Text = ""
    sliderButton.ZIndex = 7
    
    local buttonCorner = Instance.new("UICorner")
    buttonCorner.CornerRadius = UDim.new(0, 15)
    buttonCorner.Parent = sliderButton
    
    local m = 2
    local dragging = false
    
    sliderButton.MouseButton1Down:Connect(function()
        dragging = true
    end)
    
    UserInputService.InputEnded:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            dragging = false
        end
    end)
    
    UserInputService.InputChanged:Connect(function(input)
        if dragging and input.UserInputType == Enum.UserInputType.MouseMovement then
            local mouse = game.Players.LocalPlayer:GetMouse()
            local relativeX = mouse.X - sliderBg.AbsolutePosition.X
            local percentage = math.clamp(relativeX / sliderBg.AbsoluteSize.X, 0, 1)
            
            sliderButton.Position = UDim2.new(percentage, -10, 0, -5)
            sliderFill.Size = UDim2.new(percentage, 0, 1, 0)
            
            m = math.floor(2 + (percentage * 98))
            sliderLabel.Text = "🎯 Multiplier: " .. m
        end
    end)
    
    return m
end

-- Create the buttons with original functionality
local DupeButton = CreatePremiumButton("🍎 Dupe Fruits & Pets", UDim2.new(0, 30, 0, 50), function()
    for i,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
        if not tostring(v):match("Seed") then
            d = v:Clone()
            d.Parent = game.Players.LocalPlayer.Backpack
        end
    end
end)

local m = 2
CreatePremiumSlider()

local SeedButton = CreatePremiumButton("🌱 Dupe Seeds", UDim2.new(0, 30, 0, 300), function()
    for i,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
        if tostring(v):match("[X%d+]") and tostring(v):match("Seed") then
            v.Name = tostring(v):gsub(tostring(v):match("(%d+)"),tonumber(tostring(v):match("(%d+)"))*m)
        end 
    end
end)

-- Add status indicator
local StatusFrame = Instance.new("Frame")
StatusFrame.Name = "StatusFrame"
StatusFrame.Parent = MainPanel
StatusFrame.BackgroundColor3 = Color3.fromRGB(50, 255, 50)
StatusFrame.BackgroundTransparency = 0.7
StatusFrame.BorderSizePixel = 0
StatusFrame.Position = UDim2.new(0, 30, 1, -60)
StatusFrame.Size = UDim2.new(0, 280, 0, 30)
StatusFrame.ZIndex = 4

local StatusCorner = Instance.new("UICorner")
StatusCorner.CornerRadius = UDim.new(0, 15)
StatusCorner.Parent = StatusFrame

local StatusLabel = Instance.new("TextLabel")
StatusLabel.Name = "StatusLabel"
StatusLabel.Parent = StatusFrame
StatusLabel.BackgroundTransparency = 1
StatusLabel.Size = UDim2.new(1, 0, 1, 0)
StatusLabel.Font = Enum.Font.GothamBold
StatusLabel.Text = "✅ CHINOK PREMIUM READY"
StatusLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
StatusLabel.TextSize = 14
StatusLabel.ZIndex = 5

-- Button click handlers
CloseButton.MouseButton1Click:Connect(function()
    TweenService:Create(MainFrame, TweenInfo.new(0.3), {Size = UDim2.new(0, 0, 0, 0)}):Play()
    TweenService:Create(Shadow, TweenInfo.new(0.3), {Size = UDim2.new(0, 0, 0, 0)}):Play()
    wait(0.3)
    ScreenGui:Destroy()
end)

local minimized = false
MinimizeButton.MouseButton1Click:Connect(function()
    if not minimized then
        TweenService:Create(MainFrame, TweenInfo.new(0.3), {Size = UDim2.new(0, 800, 0, 60)}):Play()
        TweenService:Create(Shadow, TweenInfo.new(0.3), {Size = UDim2.new(0, 810, 0, 70)}):Play()
        minimized = true
    else
        TweenService:Create(MainFrame, TweenInfo.new(0.3), {Size = UDim2.new(0, 800, 0, 500)}):Play()
        TweenService:Create(Shadow, TweenInfo.new(0.3), {Size = UDim2.new(0, 810, 0, 510)}):Play()
        minimized = false
    end
end)

-- Animated gradient background
spawn(function()
    while ScreenGui.Parent do
        for i = 0, 360, 2 do
            if ScreenGui.Parent then
                UIGradient.Rotation = i
                wait(0.1)
            else
                break
            end
        end
    end
end)

-- Entrance animation
MainFrame.Size = UDim2.new(0, 0, 0, 0)
Shadow.Size = UDim2.new(0, 0, 0, 0)

TweenService:Create(MainFrame, TweenInfo.new(0.5, Enum.EasingStyle.Back), {Size = UDim2.new(0, 800, 0, 500)}):Play()
TweenService:Create(Shadow, TweenInfo.new(0.5, Enum.EasingStyle.Back), {Size = UDim2.new(0, 810, 0, 510)}):Play()

print("CHINOK Premium UI Loaded Successfully!")
