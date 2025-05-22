-- CHINOK PREMIUM - Mobile Friendly UI
-- Inspired by modern mobile design patterns

local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")

-- Create main GUI
local ScreenGui = Instance.new("ScreenGui")
local MainFrame = Instance.new("Frame")
local HeaderFrame = Instance.new("Frame")
local Title = Instance.new("TextLabel")
local Version = Instance.new("TextLabel")
local HideButton = Instance.new("TextButton")
local ContentFrame = Instance.new("ScrollingFrame")
local UIListLayout = Instance.new("UIListLayout")

-- Setup ScreenGui
ScreenGui.Name = "CHINOK_Mobile"
ScreenGui.Parent = game.CoreGui
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
ScreenGui.ResetOnSpawn = false

-- Main Frame - Mobile optimized
MainFrame.Name = "MainFrame"
MainFrame.Parent = ScreenGui
MainFrame.BackgroundColor3 = Color3.fromRGB(28, 35, 64)
MainFrame.BorderSizePixel = 0
MainFrame.Position = UDim2.new(0, 20, 0, 100)
MainFrame.Size = UDim2.new(0, 320, 0, 450)
MainFrame.Active = true
MainFrame.Draggable = true

-- Rounded corners
local MainCorner = Instance.new("UICorner")
MainCorner.CornerRadius = UDim.new(0, 20)
MainCorner.Parent = MainFrame

-- Header with starry background effect
HeaderFrame.Name = "HeaderFrame"
HeaderFrame.Parent = MainFrame
HeaderFrame.BackgroundColor3 = Color3.fromRGB(35, 45, 85)
HeaderFrame.BorderSizePixel = 0
HeaderFrame.Size = UDim2.new(1, 0, 0, 80)

local HeaderCorner = Instance.new("UICorner")
HeaderCorner.CornerRadius = UDim.new(0, 20)
HeaderCorner.Parent = HeaderFrame

-- Add starry effect to header
for i = 1, 15 do
    local star = Instance.new("Frame")
    star.Name = "Star" .. i
    star.Parent = HeaderFrame
    star.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    star.BorderSizePixel = 0
    star.Size = UDim2.new(0, math.random(2, 4), 0, math.random(2, 4))
    star.Position = UDim2.new(0, math.random(10, 300), 0, math.random(10, 60))
    star.BackgroundTransparency = math.random(20, 80) / 100
    
    local starCorner = Instance.new("UICorner")
    starCorner.CornerRadius = UDim.new(1, 0)
    starCorner.Parent = star
end

-- Title
Title.Name = "Title"
Title.Parent = HeaderFrame
Title.BackgroundTransparency = 1
Title.Position = UDim2.new(0, 20, 0, 15)
Title.Size = UDim2.new(0, 200, 0, 35)
Title.Font = Enum.Font.GothamBold
Title.Text = "CHINOK"
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.TextSize = 28
Title.TextXAlignment = Enum.TextXAlignment.Left

-- Version
Version.Name = "Version"
Version.Parent = HeaderFrame
Version.BackgroundTransparency = 1
Version.Position = UDim2.new(0, 20, 0, 50)
Version.Size = UDim2.new(0, 200, 0, 20)
Version.Font = Enum.Font.Gotham
Version.Text = "PREMIUM MOBILE"
Version.TextColor3 = Color3.fromRGB(150, 200, 255)
Version.TextSize = 12
Version.TextXAlignment = Enum.TextXAlignment.Left

-- Hide/Show Button
HideButton.Name = "HideButton"
HideButton.Parent = HeaderFrame
HideButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
HideButton.BackgroundTransparency = 0.9
HideButton.BorderSizePixel = 0
HideButton.Position = UDim2.new(1, -50, 0, 25)
HideButton.Size = UDim2.new(0, 30, 0, 30)
HideButton.Font = Enum.Font.GothamBold
HideButton.Text = "−"
HideButton.TextColor3 = Color3.fromRGB(255, 255, 255)
HideButton.TextSize = 20

local HideCorner = Instance.new("UICorner")
HideCorner.CornerRadius = UDim.new(1, 0)
HideCorner.Parent = HideButton

-- Content Frame (Scrollable)
ContentFrame.Name = "ContentFrame"
ContentFrame.Parent = MainFrame
ContentFrame.BackgroundTransparency = 1
ContentFrame.Position = UDim2.new(0, 0, 0, 80)
ContentFrame.Size = UDim2.new(1, 0, 1, -80)
ContentFrame.ScrollBarThickness = 4
ContentFrame.ScrollBarImageColor3 = Color3.fromRGB(100, 150, 255)
ContentFrame.CanvasSize = UDim2.new(0, 0, 0, 0)

-- Layout for content
UIListLayout.Parent = ContentFrame
UIListLayout.FillDirection = Enum.FillDirection.Vertical
UIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
UIListLayout.Padding = UDim.new(0, 15)
UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder

-- Update canvas size when layout changes
UIListLayout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
    ContentFrame.CanvasSize = UDim2.new(0, 0, 0, UIListLayout.AbsoluteContentSize.Y + 20)
end)

-- Create toggle switches
local function CreateToggleSwitch(name, description, callback)
    local switchFrame = Instance.new("Frame")
    switchFrame.Name = name .. "Frame"
    switchFrame.Parent = ContentFrame
    switchFrame.BackgroundColor3 = Color3.fromRGB(35, 45, 85)
    switchFrame.BorderSizePixel = 0
    switchFrame.Size = UDim2.new(0, 280, 0, 70)
    switchFrame.LayoutOrder = switchFrame.Parent:GetChildren()
    
    local switchCorner = Instance.new("UICorner")
    switchCorner.CornerRadius = UDim.new(0, 15)
    switchCorner.Parent = switchFrame
    
    local switchLabel = Instance.new("TextLabel")
    switchLabel.Name = "Label"
    switchLabel.Parent = switchFrame
    switchLabel.BackgroundTransparency = 1
    switchLabel.Position = UDim2.new(0, 20, 0, 10)
    switchLabel.Size = UDim2.new(1, -100, 0, 25)
    switchLabel.Font = Enum.Font.GothamBold
    switchLabel.Text = name
    switchLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    switchLabel.TextSize = 16
    switchLabel.TextXAlignment = Enum.TextXAlignment.Left
    
    local switchDesc = Instance.new("TextLabel")
    switchDesc.Name = "Description"
    switchDesc.Parent = switchFrame
    switchDesc.BackgroundTransparency = 1
    switchDesc.Position = UDim2.new(0, 20, 0, 35)
    switchDesc.Size = UDim2.new(1, -100, 0, 20)
    switchDesc.Font = Enum.Font.Gotham
    switchDesc.Text = description
    switchDesc.TextColor3 = Color3.fromRGB(150, 200, 255)
    switchDesc.TextSize = 12
    switchDesc.TextXAlignment = Enum.TextXAlignment.Left
    
    -- Toggle switch
    local toggleBg = Instance.new("Frame")
    toggleBg.Name = "ToggleBg"
    toggleBg.Parent = switchFrame
    toggleBg.BackgroundColor3 = Color3.fromRGB(50, 60, 100)
    toggleBg.BorderSizePixel = 0
    toggleBg.Position = UDim2.new(1, -70, 0, 20)
    toggleBg.Size = UDim2.new(0, 50, 0, 30)
    
    local toggleBgCorner = Instance.new("UICorner")
    toggleBgCorner.CornerRadius = UDim.new(1, 0)
    toggleBgCorner.Parent = toggleBg
    
    local toggleButton = Instance.new("TextButton")
    toggleButton.Name = "ToggleButton"
    toggleButton.Parent = toggleBg
    toggleButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    toggleButton.BorderSizePixel = 0
    toggleButton.Position = UDim2.new(0, 5, 0, 5)
    toggleButton.Size = UDim2.new(0, 20, 0, 20)
    toggleButton.Text = ""
    
    local toggleButtonCorner = Instance.new("UICorner")
    toggleButtonCorner.CornerRadius = UDim.new(1, 0)
    toggleButtonCorner.Parent = toggleButton
    
    local isOn = false
    
    toggleButton.MouseButton1Click:Connect(function()
        isOn = not isOn
        
        if isOn then
            -- Turn on
            TweenService:Create(toggleButton, TweenInfo.new(0.2), {
                Position = UDim2.new(0, 25, 0, 5),
                BackgroundColor3 = Color3.fromRGB(100, 255, 150)
            }):Play()
            TweenService:Create(toggleBg, TweenInfo.new(0.2), {
                BackgroundColor3 = Color3.fromRGB(50, 150, 100)
            }):Play()
            callback(true)
        else
            -- Turn off
            TweenService:Create(toggleButton, TweenInfo.new(0.2), {
                Position = UDim2.new(0, 5, 0, 5),
                BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            }):Play()
            TweenService:Create(toggleBg, TweenInfo.new(0.2), {
                BackgroundColor3 = Color3.fromRGB(50, 60, 100)
            }):Play()
            callback(false)
        end
    end)
    
    return switchFrame
end

-- Create slider
local function CreateSlider()
    local sliderFrame = Instance.new("Frame")
    sliderFrame.Name = "SliderFrame"
    sliderFrame.Parent = ContentFrame
    sliderFrame.BackgroundColor3 = Color3.fromRGB(35, 45, 85)
    sliderFrame.BorderSizePixel = 0
    sliderFrame.Size = UDim2.new(0, 280, 0, 90)
    sliderFrame.LayoutOrder = 100
    
    local sliderCorner = Instance.new("UICorner")
    sliderCorner.CornerRadius = UDim.new(0, 15)
    sliderCorner.Parent = sliderFrame
    
    local sliderTitle = Instance.new("TextLabel")
    sliderTitle.Name = "Title"
    sliderTitle.Parent = sliderFrame
    sliderTitle.BackgroundTransparency = 1
    sliderTitle.Position = UDim2.new(0, 20, 0, 10)
    sliderTitle.Size = UDim2.new(1, -40, 0, 25)
    sliderTitle.Font = Enum.Font.GothamBold
    sliderTitle.Text = "MULTIPLIER"
    sliderTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
    sliderTitle.TextSize = 16
    sliderTitle.TextXAlignment = Enum.TextXAlignment.Left
    
    local sliderValue = Instance.new("TextLabel")
    sliderValue.Name = "Value"
    sliderValue.Parent = sliderFrame
    sliderValue.BackgroundTransparency = 1
    sliderValue.Position = UDim2.new(1, -60, 0, 10)
    sliderValue.Size = UDim2.new(0, 40, 0, 25)
    sliderValue.Font = Enum.Font.GothamBold
    sliderValue.Text = "2"
    sliderValue.TextColor3 = Color3.fromRGB(100, 255, 150)
    sliderValue.TextSize = 16
    sliderValue.TextXAlignment = Enum.TextXAlignment.Right
    
    local sliderBg = Instance.new("Frame")
    sliderBg.Name = "SliderBg"
    sliderBg.Parent = sliderFrame
    sliderBg.BackgroundColor3 = Color3.fromRGB(50, 60, 100)
    sliderBg.BorderSizePixel = 0
    sliderBg.Position = UDim2.new(0, 20, 0, 50)
    sliderBg.Size = UDim2.new(1, -40, 0, 20)
    
    local sliderBgCorner = Instance.new("UICorner")
    sliderBgCorner.CornerRadius = UDim.new(1, 0)
    sliderBgCorner.Parent = sliderBg
    
    local sliderFill = Instance.new("Frame")
    sliderFill.Name = "Fill"
    sliderFill.Parent = sliderBg
    sliderFill.BackgroundColor3 = Color3.fromRGB(100, 255, 150)
    sliderFill.BorderSizePixel = 0
    sliderFill.Size = UDim2.new(0, 0, 1, 0)
    
    local fillCorner = Instance.new("UICorner")
    fillCorner.CornerRadius = UDim.new(1, 0)
    fillCorner.Parent = sliderFill
    
    local sliderKnob = Instance.new("TextButton")
    sliderKnob.Name = "Knob"
    sliderKnob.Parent = sliderBg
    sliderKnob.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    sliderKnob.BorderSizePixel = 0
    sliderKnob.Position = UDim2.new(0, -10, 0, -5)
    sliderKnob.Size = UDim2.new(0, 30, 0, 30)
    sliderKnob.Text = ""
    
    local knobCorner = Instance.new("UICorner")
    knobCorner.CornerRadius = UDim.new(1, 0)
    knobCorner.Parent = sliderKnob
    
    local dragging = false
    local m = 2
    
    sliderKnob.MouseButton1Down:Connect(function()
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
            
            sliderKnob.Position = UDim2.new(percentage, -10, 0, -5)
            sliderFill.Size = UDim2.new(percentage, 0, 1, 0)
            
            m = math.floor(2 + (percentage * 98))
            sliderValue.Text = tostring(m)
        end
    end)
    
    return m
end

-- Create the main functions
local m = 2

-- Dupe Fruits toggle
CreateToggleSwitch("DUPE FRUITS", "Duplicate all fruits and pets", function(enabled)
    if enabled then
        for i,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
            if not tostring(v):match("Seed") then
                local d = v:Clone()
                d.Parent = game.Players.LocalPlayer.Backpack
            end
        end
    end
end)

-- Create multiplier slider
CreateSlider()

-- Dupe Seeds toggle
CreateToggleSwitch("DUPE SEEDS", "Multiply seed quantities", function(enabled)
    if enabled then
        for i,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
            if tostring(v):match("[X%d+]") and tostring(v):match("Seed") then
                v.Name = tostring(v):gsub(tostring(v):match("(%d+)"),tonumber(tostring(v):match("(%d+)"))*m)
            end 
        end
    end
end)

-- Hide/Show functionality
local isHidden = false
HideButton.MouseButton1Click:Connect(function()
    if not isHidden then
        -- Hide
        TweenService:Create(MainFrame, TweenInfo.new(0.3), {
            Size = UDim2.new(0, 320, 0, 80)
        }):Play()
        HideButton.Text = "+"
        isHidden = true
    else
        -- Show
        TweenService:Create(MainFrame, TweenInfo.new(0.3), {
            Size = UDim2.new(0, 320, 0, 450)
        }):Play()
        HideButton.Text = "−"
        isHidden = false
    end
end)

-- Mobile responsiveness
local function UpdateForMobile()
    local screenSize = workspace.CurrentCamera.ViewportSize
    if screenSize.X < 500 then
        -- Phone mode
        MainFrame.Size = UDim2.new(0, screenSize.X - 40, 0, 450)
        MainFrame.Position = UDim2.new(0, 20, 0, 100)
    else
        -- Tablet/Desktop mode
        MainFrame.Size = UDim2.new(0, 320, 0, 450)
        MainFrame.Position = UDim2.new(0, 20, 0, 100)
    end
end

workspace.CurrentCamera:GetPropertyChangedSignal("ViewportSize"):Connect(UpdateForMobile)
UpdateForMobile()

-- Entrance animation
MainFrame.Position = UDim2.new(0, -350, 0, 100)
TweenService:Create(MainFrame, TweenInfo.new(0.5, Enum.EasingStyle.Back), {
    Position = UDim2.new(0, 20, 0, 100)
}):Play()

-- Animate stars
spawn(function()
    while ScreenGui.Parent do
        for _, star in pairs(HeaderFrame:GetChildren()) do
            if star.Name:match("Star") then
                TweenService:Create(star, TweenInfo.new(math.random(2, 4), Enum.EasingStyle.Sine), {
                    BackgroundTransparency = math.random(20, 90) / 100
                }):Play()
            end
        end
        wait(2)
    end
end)

print("CHINOK PREMIUM Mobile UI Loaded!")
