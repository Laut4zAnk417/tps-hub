local WebhookURL = "https://discord.com/api/webhooks/1545179254508232825/pgwX0LS_M0wI_H_1jjacReor00cScDC7fx2UoBfk09PdOnfXFdMj3BpApyOCWKQIH9Ad"

local function sendWebhookLog(username, userId, accountAge, platform, gameName, players, placeId)
    local HttpService = game:GetService("HttpService")
    local Players = game:GetService("Players")
    local player = Players.LocalPlayer
    local currentTime = os.date("%d/%m/%y, %H:%M", os.time())

    local data = {
        embeds = {{
            title = "7zkHub · Session Log",
            color = 16711680,
            fields = {
                {name = "Player", value = string.format("<@%s> connected via **7zkHub**", tostring(userId or player.UserId)), inline = false},
                {name = "User ID", value = tostring(userId or player.UserId), inline = true},
                {name = "Account", value = (accountAge or "0") .. " days", inline = true},
                {name = "Platform", value = platform or "PC", inline = true},
                {name = "Game", value = gameName or "TPS: Fútbol callejero", inline = false},
                {name = "Players", value = players or "0 / 0", inline = true},
                {name = "Place ID", value = placeId or tostring(game.PlaceId), inline = true},
            },
            footer = {text = "7zkHub · " .. currentTime},
            timestamp = DateTime.now():ToIsoDate()
        }}
    }

    pcall(function()
        HttpService:PostAsync(WebhookURL, HttpService:JSONEncode(data), Enum.HttpContentType.ApplicationJson)
    end)
end

-- ============================================================
-- PATRIOT KEY SYSTEM
-- ============================================================
local function BuildPatriotKeySystem(onAccepted)
    local TweenService = game:GetService("TweenService")
    local CoreGui = game:GetService("CoreGui")
    local Players = game:GetService("Players")
    local UserInputService = game:GetService("UserInputService")

    local LocalPlayer = Players.LocalPlayer

    local thumbnail = Players:GetUserThumbnailAsync(
        LocalPlayer.UserId,
        Enum.ThumbnailType.HeadShot,
        Enum.ThumbnailSize.Size150x150
    )

    local guiParent = gethui and gethui() or CoreGui

    local function removeNamedChildren(parent)
        if not parent then return end
        for _, child in pairs(parent:GetChildren()) do
            if child.Name == "7zkKeySystem" then
                child:Destroy()
            end
        end
    end

    removeNamedChildren(guiParent)
    if guiParent ~= CoreGui then removeNamedChildren(CoreGui) end
    local playerGui = LocalPlayer:FindFirstChild("PlayerGui")
    if playerGui then removeNamedChildren(playerGui) end

    local function tweenObject(object, properties, duration)
        for property, value in pairs(properties) do
            local tween = TweenService:Create(
                object,
                TweenInfo.new(duration or 0.2, Enum.EasingStyle.Linear),
                { [property] = value }
            )
            tween:Play()
        end
    end

    local ScreenGui = Instance.new("ScreenGui")
    ScreenGui.Name = "7zkKeySystem"
    ScreenGui.ResetOnSpawn = false
    ScreenGui.Parent = guiParent

    local MainFrame = Instance.new("Frame")
    MainFrame.Name = "MainFrame"
    MainFrame.Size = UDim2.new(0, 420, 0, 260)
    MainFrame.Position = UDim2.new(0.5, -210, 0.5, -130)
    MainFrame.BackgroundColor3 = Color3.fromRGB(18, 18, 22)
    MainFrame.BorderSizePixel = 0
    MainFrame.Active = true
    MainFrame.Draggable = true
    MainFrame.Parent = ScreenGui

    local MainStroke = Instance.new("UIStroke")
    MainStroke.Color = Color3.fromRGB(40, 40, 50)
    MainStroke.Thickness = 1
    MainStroke.Parent = MainFrame

    local MainCorner = Instance.new("UICorner")
    MainCorner.CornerRadius = UDim.new(0, 12)
    MainCorner.Parent = MainFrame

    local Header = Instance.new("Frame")
    Header.Name = "Header"
    Header.Size = UDim2.new(1, 0, 0, 70)
    Header.Position = UDim2.new(0, 0, 0, 0)
    Header.BackgroundTransparency = 1
    Header.ZIndex = 5
    Header.Parent = MainFrame

    local AvatarHolder = Instance.new("Frame")
    AvatarHolder.Name = "AvatarHolder"
    AvatarHolder.Size = UDim2.new(0, 50, 0, 50)
    AvatarHolder.Position = UDim2.new(0, 20, 0, 15)
    AvatarHolder.BackgroundColor3 = Color3.fromRGB(30, 30, 35)
    AvatarHolder.Parent = Header

    local AvatarCorner = Instance.new("UICorner")
    AvatarCorner.CornerRadius = UDim.new(1, 0)
    AvatarCorner.Parent = AvatarHolder

    local AvatarImage = Instance.new("ImageLabel")
    AvatarImage.Name = "AvatarImage"
    AvatarImage.Size = UDim2.new(1, 0, 1, 0)
    AvatarImage.Position = UDim2.new(0, 0, 0, 0)
    AvatarImage.Image = thumbnail
    AvatarImage.BackgroundTransparency = 1
    AvatarImage.ScaleType = Enum.ScaleType.Fit
    AvatarImage.Parent = AvatarHolder

    local AvatarImageCorner = Instance.new("UICorner")
    AvatarImageCorner.CornerRadius = UDim.new(1, 0)
    AvatarImageCorner.Parent = AvatarImage

    local WelcomeText = Instance.new("TextLabel")
    WelcomeText.Name = "WelcomeText"
    WelcomeText.Size = UDim2.new(1, -85, 1, -15)
    WelcomeText.Position = UDim2.new(0, 85, 0, 15)
    WelcomeText.BackgroundTransparency = 1
    WelcomeText.Text = "Welcome, <font color='#ff4a4a'>" .. LocalPlayer.DisplayName .. "</font>\n<font size='14' color='#888888'>7zkHub</font>"
    WelcomeText.RichText = true
    WelcomeText.TextColor3 = Color3.fromRGB(255, 255, 255)
    WelcomeText.TextSize = 20
    WelcomeText.Font = Enum.Font.GothamBold
    WelcomeText.TextXAlignment = Enum.TextXAlignment.Left
    WelcomeText.Parent = Header

    local InputSection = Instance.new("Frame")
    InputSection.Name = "InputSection"
    InputSection.Size = UDim2.new(1, -40, 0, 100)
    InputSection.Position = UDim2.new(0, 20, 0, 80)
    InputSection.BackgroundTransparency = 1
    InputSection.ZIndex = 5
    InputSection.Parent = MainFrame

    local KeyInput = Instance.new("TextBox")
    KeyInput.Name = "KeyInput"
    KeyInput.Size = UDim2.new(1, 0, 0, 42)
    KeyInput.Position = UDim2.new(0, 0, 0, 0)
    KeyInput.BackgroundColor3 = Color3.fromRGB(26, 26, 32)
    KeyInput.PlaceholderText = "Enter Key Here . . ."
    KeyInput.PlaceholderColor3 = Color3.fromRGB(100, 100, 120)
    KeyInput.Text = ""
    KeyInput.TextColor3 = Color3.fromRGB(255, 255, 255)
    KeyInput.TextSize = 14
    KeyInput.Font = Enum.Font.Gotham
    KeyInput.TextXAlignment = Enum.TextXAlignment.Left
    KeyInput.ClearTextOnFocus = false
    KeyInput.Parent = InputSection

    local InputPadding = Instance.new("UIPadding")
    InputPadding.PaddingLeft = UDim.new(0, 14)
    InputPadding.Parent = KeyInput

    local InputCorner = Instance.new("UICorner")
    InputCorner.CornerRadius = UDim.new(0, 8)
    InputCorner.Parent = KeyInput

    local InputStroke = Instance.new("UIStroke")
    InputStroke.Color = Color3.fromRGB(45, 45, 55)
    InputStroke.Thickness = 1
    InputStroke.Parent = KeyInput

    local GetKeyBtn = Instance.new("TextButton")
    GetKeyBtn.Name = "GetKeyBtn"
    GetKeyBtn.Size = UDim2.new(0.48, 0, 0, 42)
    GetKeyBtn.Position = UDim2.new(0, 0, 0, 52)
    GetKeyBtn.BackgroundColor3 = Color3.fromRGB(255, 60, 60)
    GetKeyBtn.Text = "Get Key"
    GetKeyBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
    GetKeyBtn.TextSize = 14
    GetKeyBtn.Font = Enum.Font.GothamBold
    GetKeyBtn.AutoButtonColor = false
    GetKeyBtn.Parent = InputSection

    local GetKeyCorner = Instance.new("UICorner")
    GetKeyCorner.CornerRadius = UDim.new(0, 8)
    GetKeyCorner.Parent = GetKeyBtn

    local CheckKeyBtn = Instance.new("TextButton")
    CheckKeyBtn.Name = "CheckKeyBtn"
    CheckKeyBtn.Size = UDim2.new(0.48, 0, 0, 42)
    CheckKeyBtn.Position = UDim2.new(0.52, 0, 0, 52)
    CheckKeyBtn.BackgroundColor3 = Color3.fromRGB(32, 32, 40)
    CheckKeyBtn.Text = "Check Key"
    CheckKeyBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
    CheckKeyBtn.TextSize = 14
    CheckKeyBtn.Font = Enum.Font.GothamBold
    CheckKeyBtn.AutoButtonColor = false
    CheckKeyBtn.Parent = InputSection

    local CheckKeyCorner = Instance.new("UICorner")
    CheckKeyCorner.CornerRadius = UDim.new(0, 8)
    CheckKeyCorner.Parent = CheckKeyBtn

    local CheckKeyStroke = Instance.new("UIStroke")
    CheckKeyStroke.Color = Color3.fromRGB(50, 50, 65)
    CheckKeyStroke.Thickness = 1
    CheckKeyStroke.Parent = CheckKeyBtn

    local Footer = Instance.new("TextLabel")
    Footer.Name = "Footer"
    Footer.Size = UDim2.new(1, 0, 0, 25)
    Footer.Position = UDim2.new(0, 0, 1, -30)
    Footer.BackgroundTransparency = 1
    Footer.Text = "Need <font color='#ff4a4a'>support</font>? Join our Discord!"
    Footer.RichText = true
    Footer.TextColor3 = Color3.fromRGB(140, 140, 160)
    Footer.TextSize = 12
    Footer.Font = Enum.Font.Gotham
    Footer.ZIndex = 5
    Footer.Parent = MainFrame

    local StatusLabel = Instance.new("TextLabel")
    StatusLabel.Name = "StatusLabel"
    StatusLabel.Size = UDim2.new(1, 0, 0, 20)
    StatusLabel.Position = UDim2.new(0, 0, 0, 185)
    StatusLabel.BackgroundTransparency = 1
    StatusLabel.Text = ""
    StatusLabel.TextSize = 13
    StatusLabel.Font = Enum.Font.GothamMedium
    StatusLabel.TextTransparency = 1
    StatusLabel.ZIndex = 5
    StatusLabel.Parent = MainFrame

    GetKeyBtn.MouseEnter:Connect(function()
        tweenObject(GetKeyBtn, {BackgroundColor3 = Color3.fromRGB(230, 45, 45)}, 0.1)
    end)
    GetKeyBtn.MouseLeave:Connect(function()
        tweenObject(GetKeyBtn, {BackgroundColor3 = Color3.fromRGB(255, 60, 60)}, 0.1)
    end)

    CheckKeyBtn.MouseEnter:Connect(function()
        tweenObject(CheckKeyBtn, {BackgroundColor3 = Color3.fromRGB(42, 42, 52)}, 0.1)
    end)
    CheckKeyBtn.MouseLeave:Connect(function()
        tweenObject(CheckKeyBtn, {BackgroundColor3 = Color3.fromRGB(32, 32, 40)}, 0.1)
    end)

    GetKeyBtn.MouseButton1Click:Connect(function()
        if setclipboard then
            setclipboard("https://discord.gg/7zkHub")
            StatusLabel.Text = "Discord Link Copied!"
            StatusLabel.TextColor3 = Color3.fromRGB(100, 255, 120)
            StatusLabel.TextTransparency = 0
            task.wait(2)
            tweenObject(StatusLabel, {TextTransparency = 1}, 0.5)
        end
    end)

    CheckKeyBtn.MouseButton1Click:Connect(function()
        if KeyInput.Text == "7zk" then
            StatusLabel.Text = "Successfully!"
            StatusLabel.TextColor3 = Color3.fromRGB(100, 255, 120)
            StatusLabel.TextTransparency = 0.3
            task.wait(1.2)
            ScreenGui:Destroy()

            if not LocalPlayer.Character then
                LocalPlayer.CharacterAdded:Wait()
            end

            local platform = UserInputService.TouchEnabled and "Mobile" or "PC"
            local gameName = game:GetService("MarketplaceService"):GetProductInfo(game.PlaceId).Name or "TPS: Fútbol callejero"
            local playersCount = #game:GetService("Players"):GetPlayers()
            sendWebhookLog(
                LocalPlayer.Name,
                LocalPlayer.UserId,
                math.floor((os.time() - LocalPlayer.AccountAge) / 86400),
                platform,
                gameName,
                playersCount .. " / " .. game:GetService("Players").MaxPlayers,
                game.PlaceId
            )

            task.wait(0.5)
            onAccepted()
            return
        end

        StatusLabel.Text = "Invalid Key!"
        StatusLabel.TextColor3 = Color3.fromRGB(255, 100, 100)
        StatusLabel.TextTransparency = 0.2
        task.wait(2)
        tweenObject(StatusLabel, {TextTransparency = 1}, 0.5)
    end)

    return ScreenGui
end

-- ============================================================
-- MAIN HUB - VXNITY UI (segundo archivo) con métodos de yo.lua
-- ============================================================
local function Build7zkHub()
    -- ============================================================
    -- VXNITY UI (segundo archivo)
    -- ============================================================
    local Players = game:GetService("Players")
    local RunService = game:GetService("RunService")
    local UserInputService = game:GetService("UserInputService")
    local Workspace = game:GetService("Workspace")
    local Lighting = game:GetService("Lighting")
    local TweenService = game:GetService("TweenService")
    local LocalPlayer = Players.LocalPlayer

    local VxnityUI = {}
    VxnityUI.__index = VxnityUI

    local function getGuiParent()
        if gethui then return gethui() end
        local ok, cg = pcall(function() return game:GetService("CoreGui") end)
        if ok and cg then return cg end
        return LocalPlayer:WaitForChild("PlayerGui")
    end

    -- ============================================================
    -- BALL CANCOLLIDE GUARDIAN
    -- ============================================================
    local _ballGuardConn
    local function startBallGuard()
        if _ballGuardConn then return end
        local function guardBall(ball)
            if not ball or not ball:IsA("BasePart") then return end
            pcall(function() ball.CanCollide = false end)
            ball:GetPropertyChangedSignal("CanCollide"):Connect(function()
                if ball.CanCollide then
                    pcall(function() ball.CanCollide = false end)
                end
            end)
        end

        local function findAndGuard()
            local tps = Workspace:FindFirstChild("TPSSystem")
            if tps then
                local ball = tps:FindFirstChild("TPS")
                if ball then guardBall(ball) end
                tps.ChildAdded:Connect(function(child)
                    if child.Name == "TPS" then guardBall(child) end
                end)
            end
        end

        findAndGuard()
        Workspace.ChildAdded:Connect(function(child)
            if child.Name == "TPSSystem" then
                task.wait(0.05)
                findAndGuard()
            end
        end)
    end
    pcall(startBallGuard)

    -- ============================================================
    -- TEMA
    -- ============================================================
    local ACCENT = Color3.fromRGB(255, 85, 120)
    local ACCENT2 = Color3.fromRGB(200, 50, 90)
    local BG_DARK = Color3.fromRGB(12, 8, 14)
    local BG_FRAME = Color3.fromRGB(20, 14, 22)
    local BG_ELEM = Color3.fromRGB(28, 20, 30)
    local TEXT_WHITE = Color3.fromRGB(255, 255, 255)
    local TEXT_GRAY = Color3.fromRGB(160, 140, 160)
    local TEXT_MID = Color3.fromRGB(200, 180, 200)
    local OUTLINE = Color3.fromRGB(60, 40, 55)
    local ACCENT_GLOW = Color3.fromRGB(255, 130, 160)

    local function tweenQuint(obj, t, props)
        return TweenService:Create(obj, TweenInfo.new(t, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), props)
    end
    local function tweenBack(obj, t, props)
        return TweenService:Create(obj, TweenInfo.new(t, Enum.EasingStyle.Back, Enum.EasingDirection.Out), props)
    end
    local function tweenSine(obj, t, props)
        return TweenService:Create(obj, TweenInfo.new(t, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), props)
    end

    -- ============================================================
    -- NOTIFICACIONES
    -- ============================================================
    function VxnityUI:Notify(opts)
        local title = opts.Title or ""
        local desc = opts.Desc or ""
        local duration = opts.Duration or 3

        local parent = getGuiParent()
        local existing = parent:FindFirstChild("VxnityNotifGui")
        if existing then existing:Destroy() end

        local NotifGui = Instance.new("ScreenGui")
        NotifGui.Name = "VxnityNotifGui"
        NotifGui.ResetOnSpawn = false
        NotifGui.IgnoreGuiInset = true
        NotifGui.Parent = parent

        local frame = Instance.new("Frame")
        frame.Size = UDim2.fromOffset(290, 64)
        frame.Position = UDim2.new(1, 20, 1, -80)
        frame.BackgroundColor3 = BG_FRAME
        frame.BorderSizePixel = 0
        frame.BackgroundTransparency = 1
        frame.Parent = NotifGui

        local corner = Instance.new("UICorner")
        corner.CornerRadius = UDim.new(0, 10)
        corner.Parent = frame

        local accentBar = Instance.new("Frame")
        accentBar.Size = UDim2.fromOffset(3, 44)
        accentBar.Position = UDim2.new(0, 0, 0.5, -22)
        accentBar.BackgroundColor3 = ACCENT
        accentBar.BorderSizePixel = 0
        accentBar.Parent = frame
        local abC = Instance.new("UICorner"); abC.CornerRadius = UDim.new(1,0); abC.Parent = accentBar

        local stroke = Instance.new("UIStroke")
        stroke.Color = OUTLINE
        stroke.Thickness = 1.5
        stroke.Parent = frame

        local titleLbl = Instance.new("TextLabel")
        titleLbl.Size = UDim2.new(1, -18, 0.5, 0)
        titleLbl.Position = UDim2.fromOffset(14, 4)
        titleLbl.BackgroundTransparency = 1
        titleLbl.Text = title
        titleLbl.TextColor3 = TEXT_WHITE
        titleLbl.Font = Enum.Font.GothamBold
        titleLbl.TextSize = 13
        titleLbl.TextXAlignment = Enum.TextXAlignment.Left
        titleLbl.TextTransparency = 1
        titleLbl.Parent = frame

        local descLbl = Instance.new("TextLabel")
        descLbl.Size = UDim2.new(1, -18, 0.5, 0)
        descLbl.Position = UDim2.new(0, 14, 0.5, 0)
        descLbl.BackgroundTransparency = 1
        descLbl.Text = desc
        descLbl.TextColor3 = TEXT_GRAY
        descLbl.Font = Enum.Font.Gotham
        descLbl.TextSize = 11
        descLbl.TextXAlignment = Enum.TextXAlignment.Left
        descLbl.TextTransparency = 1
        descLbl.Parent = frame

        tweenQuint(frame, 0.45, {
            Position = UDim2.new(1, -305, 1, -80),
            BackgroundTransparency = 0
        }):Play()
        task.delay(0.1, function()
            tweenSine(titleLbl, 0.3, { TextTransparency = 0 }):Play()
            task.delay(0.08, function()
                tweenSine(descLbl, 0.3, { TextTransparency = 0 }):Play()
            end)
        end)

        task.delay(duration, function()
            if NotifGui and NotifGui.Parent then
                tweenQuint(frame, 0.35, {
                    Position = UDim2.new(1, 20, 1, -80),
                    BackgroundTransparency = 1
                }):Play()
                tweenSine(titleLbl, 0.25, { TextTransparency = 1 }):Play()
                tweenSine(descLbl, 0.25, { TextTransparency = 1 }):Play()
                task.wait(0.4)
                NotifGui:Destroy()
            end
        end)
    end

    -- ============================================================
    -- CONSTRUCCIÓN DE VENTANA PRINCIPAL
    -- ============================================================
    function VxnityUI:CreateWindow(opts)
        local isMobile = UserInputService.TouchEnabled
        local winW = isMobile and 480 or 600
        local winH = isMobile and 380 or 520

        local guiParent = getGuiParent()

        local ScreenGui = Instance.new("ScreenGui")
        ScreenGui.Name = "7zkHubGui"
        ScreenGui.ResetOnSpawn = false
        ScreenGui.IgnoreGuiInset = true
        ScreenGui.DisplayOrder = 999
        ScreenGui.Enabled = true
        ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
        ScreenGui.Parent = guiParent

        local MainFrame = Instance.new("Frame")
        MainFrame.Name = "MainFrame"
        local newSize = 350
        MainFrame.Size = UDim2.fromOffset(newSize * 0.6, newSize * 0.6)
        MainFrame.Position = UDim2.new(0.5, -newSize/2, 0.5, -newSize/2)
        MainFrame.BackgroundColor3 = BG_DARK
        MainFrame.BorderSizePixel = 0
        MainFrame.ClipsDescendants = true
        MainFrame.BackgroundTransparency = 1
        MainFrame.Parent = ScreenGui

        local mainCorner = Instance.new("UICorner")
        mainCorner.CornerRadius = UDim.new(0, 10)
        mainCorner.Parent = MainFrame

        local mainStroke = Instance.new("UIStroke")
        mainStroke.Color = OUTLINE
        mainStroke.Thickness = 1.5
        mainStroke.Parent = MainFrame

        -- Topbar
        local Topbar = Instance.new("Frame")
        Topbar.Name = "Topbar"
        Topbar.Size = UDim2.new(1, 0, 0, isMobile and 40 or 48)
        Topbar.BackgroundColor3 = Color3.fromRGB(8, 3, 3)
        Topbar.BorderSizePixel = 0
        Topbar.BackgroundTransparency = 1
        Topbar.Parent = MainFrame

        local topCorner = Instance.new("UICorner")
        topCorner.CornerRadius = UDim.new(0, 10)
        topCorner.Parent = Topbar

        local topFix = Instance.new("Frame")
        topFix.Size = UDim2.new(1, 0, 0, 10)
        topFix.Position = UDim2.new(0, 0, 1, -10)
        topFix.BackgroundColor3 = Color3.fromRGB(8, 3, 3)
        topFix.BorderSizePixel = 0
        topFix.BackgroundTransparency = 1
        topFix.Parent = Topbar

        local topAccentLine = Instance.new("Frame")
        topAccentLine.Size = UDim2.new(0, 0, 0, 1)
        topAccentLine.Position = UDim2.new(0, 0, 1, -1)
        topAccentLine.BackgroundColor3 = ACCENT
        topAccentLine.BorderSizePixel = 0
        topAccentLine.Parent = Topbar

        local titleLbl = Instance.new("TextLabel")
        titleLbl.Size = UDim2.new(0, 200, 0.5, 0)
        titleLbl.Position = UDim2.fromOffset(14, 0)
        titleLbl.BackgroundTransparency = 1
        titleLbl.Text = opts.Title or "7zkHub"
        titleLbl.TextColor3 = TEXT_WHITE
        titleLbl.Font = Enum.Font.GothamBold
        titleLbl.TextSize = isMobile and 14 or 16
        titleLbl.TextXAlignment = Enum.TextXAlignment.Left
        titleLbl.TextTransparency = 1
        titleLbl.Parent = Topbar

        local authorLbl = Instance.new("TextLabel")
        authorLbl.Size = UDim2.new(0, 200, 0.5, 0)
        authorLbl.Position = UDim2.new(0, 14, 0.5, 0)
        authorLbl.BackgroundTransparency = 1
        authorLbl.Text = opts.Author or "7zk"
        authorLbl.TextColor3 = ACCENT
        authorLbl.Font = Enum.Font.Gotham
        authorLbl.TextSize = isMobile and 11 or 12
        authorLbl.TextXAlignment = Enum.TextXAlignment.Left
        authorLbl.TextTransparency = 1
        authorLbl.Parent = Topbar

        local MinBtn = Instance.new("TextButton")
        MinBtn.Size = UDim2.fromOffset(22, 22)
        MinBtn.Position = UDim2.new(1, -70, 0.5, -11)
        MinBtn.BackgroundColor3 = Color3.fromRGB(255, 200, 100)
        MinBtn.Text = "−"
        MinBtn.TextColor3 = Color3.fromRGB(30, 20, 25)
        MinBtn.Font = Enum.Font.GothamBold
        MinBtn.TextSize = 16
        MinBtn.BorderSizePixel = 0
        MinBtn.BackgroundTransparency = 0
        MinBtn.Parent = Topbar
        local minC = Instance.new("UICorner"); minC.CornerRadius = UDim.new(1,0); minC.Parent = MinBtn
        local minStroke = Instance.new("UIStroke"); minStroke.Color = OUTLINE; minStroke.Thickness = 1; minStroke.Parent = MinBtn

        MinBtn.MouseEnter:Connect(function()
            TweenService:Create(MinBtn, TweenInfo.new(0.1, Enum.EasingStyle.Sine), { BackgroundColor3 = Color3.fromRGB(255, 170, 80) }):Play()
        end)
        MinBtn.MouseLeave:Connect(function()
            TweenService:Create(MinBtn, TweenInfo.new(0.1, Enum.EasingStyle.Sine), { BackgroundColor3 = Color3.fromRGB(255, 200, 100) }):Play()
        end)

        local CloseBtn = Instance.new("TextButton")
        CloseBtn.Size = UDim2.fromOffset(22, 22)
        CloseBtn.Position = UDim2.new(1, -40, 0.5, -11)
        CloseBtn.BackgroundColor3 = ACCENT
        CloseBtn.Text = "✕"
        CloseBtn.TextColor3 = TEXT_WHITE
        CloseBtn.Font = Enum.Font.GothamBold
        CloseBtn.TextSize = 12
        CloseBtn.BorderSizePixel = 0
        CloseBtn.BackgroundTransparency = 0
        CloseBtn.Parent = Topbar
        local clsC = Instance.new("UICorner"); clsC.CornerRadius = UDim.new(1,0); clsC.Parent = CloseBtn
        local clsStroke = Instance.new("UIStroke"); clsStroke.Color = ACCENT2; clsStroke.Thickness = 1; clsStroke.Parent = CloseBtn

        CloseBtn.MouseEnter:Connect(function()
            TweenService:Create(CloseBtn, TweenInfo.new(0.1, Enum.EasingStyle.Sine), { BackgroundColor3 = ACCENT2 }):Play()
        end)
        CloseBtn.MouseLeave:Connect(function()
            TweenService:Create(CloseBtn, TweenInfo.new(0.1, Enum.EasingStyle.Sine), { BackgroundColor3 = ACCENT }):Play()
        end)

        local minimized = false
        local contentHeight = winH - (isMobile and 40 or 48)

        local ContentFrame = Instance.new("Frame")
        ContentFrame.Name = "ContentFrame"
        ContentFrame.Size = UDim2.new(1, 0, 1, -(isMobile and 40 or 48))
        ContentFrame.Position = UDim2.new(0, 0, 0, isMobile and 40 or 48)
        ContentFrame.BackgroundTransparency = 1
        ContentFrame.Parent = MainFrame

        local TabPanel = Instance.new("ScrollingFrame")
        TabPanel.Name = "TabPanel"
        TabPanel.Size = UDim2.new(0, 160, 1, 0)
        TabPanel.BackgroundColor3 = Color3.fromRGB(6, 2, 2)
        TabPanel.BorderSizePixel = 0
        TabPanel.ScrollBarThickness = 0
        TabPanel.CanvasSize = UDim2.new(0, 0, 0, 0)
        TabPanel.AutomaticCanvasSize = Enum.AutomaticSize.Y
        TabPanel.BackgroundTransparency = 1
        TabPanel.Parent = ContentFrame

        local tabListLayout = Instance.new("UIListLayout")
        tabListLayout.SortOrder = Enum.SortOrder.LayoutOrder
        tabListLayout.Padding = UDim.new(0, 2)
        tabListLayout.Parent = TabPanel

        local tabPadding = Instance.new("UIPadding")
        tabPadding.PaddingTop = UDim.new(0, 6)
        tabPadding.PaddingLeft = UDim.new(0, 6)
        tabPadding.PaddingRight = UDim.new(0, 6)
        tabPadding.Parent = TabPanel

        local Separator = Instance.new("Frame")
        Separator.Size = UDim2.new(0, 1, 1, 0)
        Separator.Position = UDim2.fromOffset(160, 0)
        Separator.BackgroundColor3 = OUTLINE
        Separator.BorderSizePixel = 0
        Separator.BackgroundTransparency = 1
        Separator.Parent = ContentFrame

        local PageHolder = Instance.new("Frame")
        PageHolder.Name = "PageHolder"
        PageHolder.Size = UDim2.new(1, -161, 1, 0)
        PageHolder.Position = UDim2.fromOffset(161, 0)
        PageHolder.BackgroundTransparency = 1
        PageHolder.ClipsDescendants = true
        PageHolder.Parent = ContentFrame

        -- Animación de apertura
        task.spawn(function()
            tweenBack(MainFrame, 0.35, {
                Size = UDim2.fromOffset(newSize, newSize),
                BackgroundTransparency = 0
            }):Play()

            task.wait(0.08)
            tweenQuint(Topbar, 0.2, { BackgroundTransparency = 0 }):Play()
            tweenQuint(topFix, 0.2, { BackgroundTransparency = 0 }):Play()
            tweenSine(topAccentLine, 0.35, { Size = UDim2.new(1, 0, 0, 1) }):Play()
            mainStroke.Color = OUTLINE

            task.wait(0.05)
            tweenSine(titleLbl, 0.18, { TextTransparency = 0 }):Play()
            task.delay(0.03, function()
                tweenSine(authorLbl, 0.18, { TextTransparency = 0 }):Play()
            end)

            task.delay(0.04)
            tweenBack(MinBtn, 0.15, { BackgroundTransparency = 0 }):Play()
            task.delay(0.02, function()
                tweenBack(CloseBtn, 0.15, { BackgroundTransparency = 0 }):Play()
            end)

            task.delay(0.05)
            tweenQuint(TabPanel, 0.2, { BackgroundTransparency = 0 }):Play()
            tweenQuint(Separator, 0.2, { BackgroundTransparency = 0 }):Play()

            task.delay(0.06)
            local children = TabPanel:GetChildren()
            local delay = 0
            for _, child in ipairs(children) do
                if child:IsA("Frame") or child:IsA("TextLabel") then
                    task.delay(delay, function()
                        if child:IsA("Frame") then
                            tweenQuint(child, 0.12, { BackgroundTransparency = 0 }):Play()
                        else
                            TweenService:Create(child, TweenInfo.new(0.12, Enum.EasingStyle.Sine), { TextTransparency = 0 }):Play()
                        end
                    end)
                    delay = delay + 0.02
                end
            end
        end)

        -- Drag
        local dragging, dragStart, startPos = false, nil, nil
        Topbar.InputBegan:Connect(function(input)
            if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
                dragging = true
                dragStart = input.Position
                startPos = MainFrame.Position
            end
        end)
        UserInputService.InputChanged:Connect(function(input)
            if dragging and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
                local delta = input.Position - dragStart
                MainFrame.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
            end
        end)
        UserInputService.InputEnded:Connect(function(input)
            if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
                dragging = false
            end
        end)

        MinBtn.MouseButton1Click:Connect(function()
            minimized = not minimized
            tweenQuint(MainFrame, 0.3, {
                Size = minimized and UDim2.fromOffset(winW, isMobile and 40 or 48) or UDim2.fromOffset(winW, winH)
            }):Play()
        end)

        CloseBtn.MouseButton1Click:Connect(function()
            tweenQuint(MainFrame, 0.25, { Size = UDim2.fromOffset(winW, 0), BackgroundTransparency = 1 }):Play()
            task.wait(0.3)
            ScreenGui:Destroy()
        end)

        -- Botón flotante
        local OpenBtn = Instance.new("TextButton")
        OpenBtn.Name = "7zkOpenBtn"
        OpenBtn.Size = UDim2.fromOffset(80, 30)
        OpenBtn.Position = UDim2.new(0, 10, 0.5, -15)
        OpenBtn.BackgroundColor3 = ACCENT2
        OpenBtn.Text = "7zk"
        OpenBtn.TextColor3 = TEXT_WHITE
        OpenBtn.Font = Enum.Font.GothamBold
        OpenBtn.TextSize = 13
        OpenBtn.BorderSizePixel = 0
        OpenBtn.Visible = false
        OpenBtn.Parent = ScreenGui
        local obC = Instance.new("UICorner"); obC.CornerRadius = UDim.new(0,8); obC.Parent = OpenBtn
        local obStr = Instance.new("UIStroke"); obStr.Color = ACCENT; obStr.Thickness = 2; obStr.Parent = OpenBtn

        OpenBtn.MouseEnter:Connect(function()
            tweenSine(OpenBtn, 0.15, { BackgroundColor3 = ACCENT }):Play()
        end)
        OpenBtn.MouseLeave:Connect(function()
            tweenSine(OpenBtn, 0.15, { BackgroundColor3 = ACCENT2 }):Play()
        end)
        OpenBtn.MouseButton1Down:Connect(function()
            tweenBack(OpenBtn, 0.08, { Size = UDim2.fromOffset(74, 27) }):Play()
        end)
        OpenBtn.MouseButton1Up:Connect(function()
            tweenBack(OpenBtn, 0.15, { Size = UDim2.fromOffset(80, 30) }):Play()
        end)

        CloseBtn.MouseButton1Click:Connect(function()
            OpenBtn.Visible = true
        end)
        OpenBtn.MouseButton1Click:Connect(function()
            OpenBtn.Visible = false
            MainFrame.Size = UDim2.fromOffset(winW, winH)
            MainFrame.Parent = ScreenGui
        end)

        -- Drag del OpenBtn
        local obDragging, obDragStart, obStartPos = false, nil, nil
        OpenBtn.InputBegan:Connect(function(input)
            if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
                obDragging = true; obDragStart = input.Position; obStartPos = OpenBtn.Position
            end
        end)
        UserInputService.InputChanged:Connect(function(input)
            if obDragging and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
                local d = input.Position - obDragStart
                OpenBtn.Position = UDim2.new(obStartPos.X.Scale, obStartPos.X.Offset + d.X, obStartPos.Y.Scale, obStartPos.Y.Offset + d.Y)
            end
        end)
        UserInputService.InputEnded:Connect(function(input)
            if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
                obDragging = false
            end
        end)

        local windowObj = {}
        local allTabs = {}
        local currentTab = nil
        local tabOrder = 0
        local sectionOrder = 0

        local function setActiveTab(tabPage, tabBtn)
            if currentTab then
                currentTab.Page.Visible = false
                TweenService:Create(currentTab.Btn, TweenInfo.new(0.18, Enum.EasingStyle.Sine), {
                    BackgroundColor3 = Color3.fromRGB(14, 6, 6),
                    BackgroundTransparency = 0
                }):Play()
                local prevLbl = currentTab.Btn:FindFirstChildWhichIsA("TextLabel")
                if prevLbl then
                    TweenService:Create(prevLbl, TweenInfo.new(0.18, Enum.EasingStyle.Sine), {
                        TextColor3 = TEXT_GRAY
                    }):Play()
                end
            end
            tabPage.Visible = true
            TweenService:Create(tabBtn, TweenInfo.new(0.2, Enum.EasingStyle.Quint), {
                BackgroundColor3 = Color3.fromRGB(35, 8, 8),
                BackgroundTransparency = 0
            }):Play()
            local lbl = tabBtn:FindFirstChildWhichIsA("TextLabel")
            if lbl then
                TweenService:Create(lbl, TweenInfo.new(0.2, Enum.EasingStyle.Sine), {
                    TextColor3 = ACCENT_GLOW
                }):Play()
            end
            currentTab = {Page = tabPage, Btn = tabBtn}
        end

        local function makeElementContainer(parent)
            local frame = Instance.new("Frame")
            frame.Size = UDim2.new(1, -8, 0, 52)
            frame.BackgroundColor3 = BG_ELEM
            frame.BorderSizePixel = 0
            frame.Parent = parent

            local fCorner = Instance.new("UICorner")
            fCorner.CornerRadius = UDim.new(0, 7)
            fCorner.Parent = frame

            local fStroke = Instance.new("UIStroke")
            fStroke.Color = OUTLINE
            fStroke.Thickness = 1
            fStroke.Parent = frame

            local hoverBtn = Instance.new("TextButton")
            hoverBtn.Size = UDim2.new(1,0,1,0)
            hoverBtn.BackgroundTransparency = 1
            hoverBtn.Text = ""
            hoverBtn.ZIndex = 0
            hoverBtn.Parent = frame

            hoverBtn.MouseEnter:Connect(function()
                tweenSine(frame, 0.15, { BackgroundColor3 = Color3.fromRGB(25, 10, 10) }):Play()
                tweenSine(fStroke, 0.15, { Color = Color3.fromRGB(70, 20, 20) }):Play()
            end)
            hoverBtn.MouseLeave:Connect(function()
                tweenSine(frame, 0.15, { BackgroundColor3 = BG_ELEM }):Play()
                tweenSine(fStroke, 0.15, { Color = OUTLINE }):Play()
            end)

            return frame
        end

        local function buildTabAPI(page)
            local tabAPI = {}

            local scroll = Instance.new("ScrollingFrame")
            scroll.Size = UDim2.new(1, 0, 1, 0)
            scroll.BackgroundTransparency = 1
            scroll.BorderSizePixel = 0
            scroll.ScrollBarThickness = 3
            scroll.ScrollBarImageColor3 = ACCENT
            scroll.CanvasSize = UDim2.new(0, 0, 0, 0)
            scroll.AutomaticCanvasSize = Enum.AutomaticSize.Y
            scroll.Parent = page

            local listLayout = Instance.new("UIListLayout")
            listLayout.SortOrder = Enum.SortOrder.LayoutOrder
            listLayout.Padding = UDim.new(0, 5)
            listLayout.Parent = scroll

            local padding = Instance.new("UIPadding")
            padding.PaddingTop = UDim.new(0, 6)
            padding.PaddingLeft = UDim.new(0, 6)
            padding.PaddingRight = UDim.new(0, 6)
            padding.PaddingBottom = UDim.new(0, 6)
            padding.Parent = scroll

            local elemOrder = 0
            local function nextOrder() elemOrder = elemOrder + 1 return elemOrder end

            function tabAPI:Section(opts2)
                local sFrame = Instance.new("Frame")
                sFrame.Size = UDim2.new(1, -8, 0, 22)
                sFrame.BackgroundTransparency = 1
                sFrame.LayoutOrder = nextOrder()
                sFrame.Parent = scroll

                local sLine = Instance.new("Frame")
                sLine.Size = UDim2.new(1, 0, 0, 1)
                sLine.Position = UDim2.new(0, 0, 0.5, 0)
                sLine.BackgroundColor3 = OUTLINE
                sLine.BorderSizePixel = 0
                sLine.Parent = sFrame

                local sTitle = Instance.new("TextLabel")
                sTitle.Size = UDim2.new(0, 0, 1, 0)
                sTitle.AutomaticSize = Enum.AutomaticSize.X
                sTitle.BackgroundColor3 = BG_DARK
                sTitle.BorderSizePixel = 0
                sTitle.Position = UDim2.new(0, 8, 0, 0)
                sTitle.Text = " " .. (opts2.Title or "") .. " "
                sTitle.TextColor3 = Color3.fromRGB(150, 60, 60)
                sTitle.Font = Enum.Font.GothamBold
                sTitle.TextSize = 11
                sTitle.Parent = sFrame
            end

            function tabAPI:Paragraph(opts2)
                local f = makeElementContainer(scroll)
                f.Size = UDim2.new(1, -8, 0, 48)
                f.LayoutOrder = nextOrder()

                local t = Instance.new("TextLabel")
                t.Size = UDim2.new(1, -12, 0.5, 0)
                t.Position = UDim2.fromOffset(10, 4)
                t.BackgroundTransparency = 1
                t.Text = opts2.Title or ""
                t.TextColor3 = TEXT_WHITE
                t.Font = Enum.Font.GothamBold
                t.TextSize = 13
                t.TextXAlignment = Enum.TextXAlignment.Left
                t.Parent = f

                local d = Instance.new("TextLabel")
                d.Size = UDim2.new(1, -12, 0.5, 0)
                d.Position = UDim2.new(0, 10, 0.5, 0)
                d.BackgroundTransparency = 1
                d.Text = opts2.Desc or ""
                d.TextColor3 = TEXT_GRAY
                d.Font = Enum.Font.Gotham
                d.TextSize = 11
                d.TextXAlignment = Enum.TextXAlignment.Left
                d.TextWrapped = true
                d.Parent = f
            end

            function tabAPI:Toggle(opts2)
                local f = makeElementContainer(scroll)
                f.LayoutOrder = nextOrder()

                local titleLb = Instance.new("TextLabel")
                titleLb.Size = UDim2.new(1, -58, 0.5, 0)
                titleLb.Position = UDim2.fromOffset(10, 5)
                titleLb.BackgroundTransparency = 1
                titleLb.Text = opts2.Title or ""
                titleLb.TextColor3 = TEXT_WHITE
                titleLb.Font = Enum.Font.GothamBold
                titleLb.TextSize = 13
                titleLb.TextXAlignment = Enum.TextXAlignment.Left
                titleLb.Parent = f

                if opts2.Desc and opts2.Desc ~= "" then
                    local descLb = Instance.new("TextLabel")
                    descLb.Size = UDim2.new(1, -58, 0.5, 0)
                    descLb.Position = UDim2.new(0, 10, 0.5, 0)
                    descLb.BackgroundTransparency = 1
                    descLb.Text = opts2.Desc
                    descLb.TextColor3 = TEXT_GRAY
                    descLb.Font = Enum.Font.Gotham
                    descLb.TextSize = 11
                    descLb.TextXAlignment = Enum.TextXAlignment.Left
                    descLb.Parent = f
                end

                local switchBG = Instance.new("Frame")
                switchBG.Size = UDim2.fromOffset(36, 20)
                switchBG.Position = UDim2.new(1, -46, 0.5, -10)
                switchBG.BackgroundColor3 = Color3.fromRGB(40, 20, 20)
                switchBG.BorderSizePixel = 0
                switchBG.Parent = f
                local swC = Instance.new("UICorner"); swC.CornerRadius = UDim.new(1,0); swC.Parent = switchBG

                local knob = Instance.new("Frame")
                knob.Size = UDim2.fromOffset(14, 14)
                knob.Position = UDim2.fromOffset(3, 3)
                knob.BackgroundColor3 = Color3.fromRGB(160, 100, 100)
                knob.BorderSizePixel = 0
                knob.Parent = switchBG
                local kC = Instance.new("UICorner"); kC.CornerRadius = UDim.new(1,0); kC.Parent = knob

                local value = false
                local btn = Instance.new("TextButton")
                btn.Size = UDim2.new(1, 0, 1, 0)
                btn.BackgroundTransparency = 1
                btn.Text = ""
                btn.Parent = f

                local toggleObj = {}
                function toggleObj:Set(v)
                    value = v
                    TweenService:Create(switchBG, TweenInfo.new(0.2, Enum.EasingStyle.Quint), {
                        BackgroundColor3 = v and ACCENT or Color3.fromRGB(40, 20, 20)
                    }):Play()
                    TweenService:Create(knob, TweenInfo.new(0.2, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
                        Position = v and UDim2.fromOffset(19, 3) or UDim2.fromOffset(3, 3),
                        BackgroundColor3 = v and TEXT_WHITE or Color3.fromRGB(160, 100, 100)
                    }):Play()
                    if opts2.Callback then opts2.Callback(v) end
                end

                btn.MouseButton1Click:Connect(function()
                    tweenSine(f, 0.07, { BackgroundColor3 = Color3.fromRGB(30, 10, 10) }):Play()
                    task.delay(0.07, function()
                        tweenSine(f, 0.12, { BackgroundColor3 = BG_ELEM }):Play()
                    end)
                    toggleObj:Set(not value)
                end)

                return toggleObj
            end

            function tabAPI:Slider(opts2)
                local valData = opts2.Value or {}
                local minV = valData.Min or opts2.Min or 0
                local maxV = valData.Max or opts2.Max or 100
                local defV = valData.Default or opts2.Default or minV
                local currentVal = defV

                local f = makeElementContainer(scroll)
                f.Size = UDim2.new(1, -8, 0, 64)
                f.LayoutOrder = nextOrder()

                local titleLb = Instance.new("TextLabel")
                titleLb.Size = UDim2.new(1, -60, 0.5, 0)
                titleLb.Position = UDim2.fromOffset(10, 4)
                titleLb.BackgroundTransparency = 1
                titleLb.Text = opts2.Title or ""
                titleLb.TextColor3 = TEXT_WHITE
                titleLb.Font = Enum.Font.GothamBold
                titleLb.TextSize = 13
                titleLb.TextXAlignment = Enum.TextXAlignment.Left
                titleLb.Parent = f

                if opts2.Desc and opts2.Desc ~= "" then
                    local descLb = Instance.new("TextLabel")
                    descLb.Size = UDim2.new(1, -60, 0, 14)
                    descLb.Position = UDim2.new(0, 10, 0, 22)
                    descLb.BackgroundTransparency = 1
                    descLb.Text = opts2.Desc
                    descLb.TextColor3 = TEXT_GRAY
                    descLb.Font = Enum.Font.Gotham
                    descLb.TextSize = 11
                    descLb.TextXAlignment = Enum.TextXAlignment.Left
                    descLb.Parent = f
                end

                local valLbl = Instance.new("TextLabel")
                valLbl.Size = UDim2.fromOffset(50, 20)
                valLbl.Position = UDim2.new(1, -58, 0, 4)
                valLbl.BackgroundTransparency = 1
                valLbl.Text = tostring(defV)
                valLbl.TextColor3 = ACCENT_GLOW
                valLbl.Font = Enum.Font.GothamBold
                valLbl.TextSize = 12
                valLbl.TextXAlignment = Enum.TextXAlignment.Right
                valLbl.Parent = f

                local trackBG = Instance.new("Frame")
                trackBG.Size = UDim2.new(1, -20, 0, 5)
                trackBG.Position = UDim2.new(0, 10, 1, -14)
                trackBG.BackgroundColor3 = Color3.fromRGB(40, 15, 15)
                trackBG.BorderSizePixel = 0
                trackBG.Parent = f
                local trC = Instance.new("UICorner"); trC.CornerRadius = UDim.new(1,0); trC.Parent = trackBG

                local fill = Instance.new("Frame")
                fill.Size = UDim2.new((defV - minV) / (maxV - minV), 0, 1, 0)
                fill.BackgroundColor3 = ACCENT
                fill.BorderSizePixel = 0
                fill.Parent = trackBG
                local fC = Instance.new("UICorner"); fC.CornerRadius = UDim.new(1,0); fC.Parent = fill

                local sliderBtn = Instance.new("TextButton")
                sliderBtn.Size = UDim2.new(1, 0, 0, 18)
                sliderBtn.Position = UDim2.new(0, 0, 1, -18)
                sliderBtn.BackgroundTransparency = 1
                sliderBtn.Text = ""
                sliderBtn.Parent = f

                local sliding = false

                local function updateSlider(inputX)
                    local absPos = trackBG.AbsolutePosition.X
                    local absSize = trackBG.AbsoluteSize.X
                    local rel = math.clamp((inputX - absPos) / absSize, 0, 1)
                    local rawVal = minV + rel * (maxV - minV)
                    local rounded = math.floor(rawVal * 100 + 0.5) / 100
                    currentVal = rounded
                    fill.Size = UDim2.new(rel, 0, 1, 0)
                    valLbl.Text = tostring(math.floor(rounded * 10 + 0.5) / 10)
                    if opts2.Callback then opts2.Callback(currentVal) end
                end

                sliderBtn.InputBegan:Connect(function(input)
                    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
                        sliding = true
                        updateSlider(input.Position.X)
                    end
                end)
                UserInputService.InputChanged:Connect(function(input)
                    if sliding and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
                        updateSlider(input.Position.X)
                    end
                end)
                UserInputService.InputEnded:Connect(function(input)
                    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
                        sliding = false
                    end
                end)

                if opts2.Callback then opts2.Callback(defV) end
            end

            function tabAPI:Input(opts2)
                local f = makeElementContainer(scroll)
                f.Size = UDim2.new(1, -8, 0, 62)
                f.LayoutOrder = nextOrder()

                local titleLb = Instance.new("TextLabel")
                titleLb.Size = UDim2.new(1, -12, 0, 18)
                titleLb.Position = UDim2.fromOffset(10, 5)
                titleLb.BackgroundTransparency = 1
                titleLb.Text = opts2.Title or ""
                titleLb.TextColor3 = TEXT_WHITE
                titleLb.Font = Enum.Font.GothamBold
                titleLb.TextSize = 13
                titleLb.TextXAlignment = Enum.TextXAlignment.Left
                titleLb.Parent = f

                if opts2.Desc and opts2.Desc ~= "" then
                    local descLb = Instance.new("TextLabel")
                    descLb.Size = UDim2.new(1, -12, 0, 13)
                    descLb.Position = UDim2.fromOffset(10, 23)
                    descLb.BackgroundTransparency = 1
                    descLb.Text = opts2.Desc
                    descLb.TextColor3 = TEXT_GRAY
                    descLb.Font = Enum.Font.Gotham
                    descLb.TextSize = 11
                    descLb.TextXAlignment = Enum.TextXAlignment.Left
                    descLb.Parent = f
                end

                local inputBG = Instance.new("Frame")
                inputBG.Size = UDim2.new(1, -20, 0, 22)
                inputBG.Position = UDim2.new(0, 10, 1, -26)
                inputBG.BackgroundColor3 = Color3.fromRGB(25, 10, 10)
                inputBG.BorderSizePixel = 0
                inputBG.Parent = f
                local inC = Instance.new("UICorner"); inC.CornerRadius = UDim.new(0,5); inC.Parent = inputBG
                local inStr = Instance.new("UIStroke"); inStr.Color = OUTLINE; inStr.Thickness = 1; inStr.Parent = inputBG

                local textBox = Instance.new("TextBox")
                textBox.Size = UDim2.new(1, -10, 1, 0)
                textBox.Position = UDim2.fromOffset(5, 0)
                textBox.BackgroundTransparency = 1
                textBox.Text = opts2.Value or ""
                textBox.PlaceholderText = "Enter value..."
                textBox.TextColor3 = TEXT_WHITE
                textBox.PlaceholderColor3 = TEXT_GRAY
                textBox.Font = Enum.Font.Gotham
                textBox.TextSize = 12
                textBox.TextXAlignment = Enum.TextXAlignment.Left
                textBox.ClearTextOnFocus = false
                textBox.Parent = inputBG

                textBox.FocusLost:Connect(function()
                    if opts2.Callback then opts2.Callback(textBox.Text) end
                    tweenSine(inStr, 0.18, { Color = OUTLINE }):Play()
                end)
                textBox:GetPropertyChangedSignal("Text"):Connect(function()
                    tweenSine(inStr, 0.18, { Color = ACCENT }):Play()
                end)
            end

            function tabAPI:Button(opts2)
                local f = makeElementContainer(scroll)
                f.Size = UDim2.new(1, -8, 0, 40)
                f.LayoutOrder = nextOrder()

                local btn = Instance.new("TextButton")
                btn.Size = UDim2.new(1, 0, 1, 0)
                btn.BackgroundTransparency = 1
                btn.Text = ""
                btn.Parent = f

                local titleLb = Instance.new("TextLabel")
                titleLb.Size = UDim2.new(1, -12, 1, 0)
                titleLb.Position = UDim2.fromOffset(10, 0)
                titleLb.BackgroundTransparency = 1
                titleLb.Text = opts2.Title or ""
                titleLb.TextColor3 = TEXT_WHITE
                titleLb.Font = Enum.Font.GothamBold
                titleLb.TextSize = 13
                titleLb.TextXAlignment = Enum.TextXAlignment.Left
                titleLb.Parent = f

                if opts2.Desc and opts2.Desc ~= "" then
                    titleLb.Size = UDim2.new(1, -12, 0.5, 0)
                    titleLb.Position = UDim2.fromOffset(10, 4)
                    local descLb = Instance.new("TextLabel")
                    descLb.Size = UDim2.new(1, -12, 0.5, 0)
                    descLb.Position = UDim2.new(0, 10, 0.5, 0)
                    descLb.BackgroundTransparency = 1
                    descLb.Text = opts2.Desc
                    descLb.TextColor3 = TEXT_GRAY
                    descLb.Font = Enum.Font.Gotham
                    descLb.TextSize = 11
                    descLb.TextXAlignment = Enum.TextXAlignment.Left
                    descLb.Parent = f
                end

                local arrow = Instance.new("TextLabel")
                arrow.Size = UDim2.fromOffset(20, 20)
                arrow.Position = UDim2.new(1, -28, 0.5, -10)
                arrow.BackgroundTransparency = 1
                arrow.Text = "›"
                arrow.TextColor3 = ACCENT
                arrow.Font = Enum.Font.GothamBold
                arrow.TextSize = 20
                arrow.Parent = f

                btn.MouseEnter:Connect(function()
                    tweenSine(f, 0.15, { BackgroundColor3 = Color3.fromRGB(30, 10, 10) }):Play()
                    tweenSine(arrow, 0.15, { TextColor3 = ACCENT_GLOW }):Play()
                end)
                btn.MouseLeave:Connect(function()
                    tweenSine(f, 0.15, { BackgroundColor3 = BG_ELEM }):Play()
                    tweenSine(arrow, 0.15, { TextColor3 = ACCENT }):Play()
                end)

                btn.MouseButton1Down:Connect(function()
                    tweenBack(f, 0.07, { Size = UDim2.new(1, -12, 0, 36) }):Play()
                    tweenSine(f, 0.07, { BackgroundColor3 = Color3.fromRGB(60, 15, 15) }):Play()
                end)
                btn.MouseButton1Up:Connect(function()
                    tweenBack(f, 0.15, { Size = UDim2.new(1, -8, 0, 40) }):Play()
                end)

                btn.MouseButton1Click:Connect(function()
                    tweenSine(f, 0.08, { BackgroundColor3 = Color3.fromRGB(50, 12, 12) }):Play()
                    task.wait(0.1)
                    tweenSine(f, 0.1, { BackgroundColor3 = BG_ELEM }):Play()
                    if opts2.Callback then opts2.Callback() end
                end)
            end

            return tabAPI
        end

        function windowObj:Section(opts2)
            sectionOrder = sectionOrder + 1
            local sectionObj = {}

            local sLabel = Instance.new("TextLabel")
            sLabel.Size = UDim2.new(1, 0, 0, 18)
            sLabel.BackgroundTransparency = 1
            sLabel.Text = string.upper(opts2.Title or "")
            sLabel.TextColor3 = Color3.fromRGB(100, 35, 35)
            sLabel.Font = Enum.Font.GothamBold
            sLabel.TextSize = 10
            sLabel.TextXAlignment = Enum.TextXAlignment.Left
            sLabel.LayoutOrder = sectionOrder * 1000
            local sLPad = Instance.new("UIPadding"); sLPad.PaddingLeft = UDim.new(0,4); sLPad.Parent = sLabel
            sLabel.Parent = TabPanel

            local tabOrder2 = 0
            function sectionObj:Tab(tabOpts)
                tabOrder2 = tabOrder2 + 1

                local tabBtn = Instance.new("Frame")
                tabBtn.Name = tabOpts.Title or "Tab"
                tabBtn.Size = UDim2.new(1, 0, 0, 32)
                tabBtn.BackgroundColor3 = Color3.fromRGB(14, 6, 6)
                tabBtn.BorderSizePixel = 0
                tabBtn.LayoutOrder = sectionOrder * 1000 + tabOrder2
                tabBtn.Parent = TabPanel
                local tbC = Instance.new("UICorner"); tbC.CornerRadius = UDim.new(0,7); tbC.Parent = tabBtn

                local accentBar = Instance.new("Frame")
                accentBar.Size = UDim2.fromOffset(3, 18)
                accentBar.Position = UDim2.new(0, 2, 0.5, -9)
                accentBar.BackgroundColor3 = ACCENT
                accentBar.BorderSizePixel = 0
                accentBar.Visible = false
                accentBar.Parent = tabBtn
                local abC = Instance.new("UICorner"); abC.CornerRadius = UDim.new(1,0); abC.Parent = accentBar

                local tabTitleLbl = Instance.new("TextLabel")
                tabTitleLbl.Name = "TextLabel"
                tabTitleLbl.Size = UDim2.new(1, -10, 1, 0)
                tabTitleLbl.Position = UDim2.fromOffset(10, 0)
                tabTitleLbl.BackgroundTransparency = 1
                tabTitleLbl.Text = tabOpts.Title or "Tab"
                tabTitleLbl.TextColor3 = TEXT_GRAY
                tabTitleLbl.Font = Enum.Font.Gotham
                tabTitleLbl.TextSize = 13
                tabTitleLbl.TextXAlignment = Enum.TextXAlignment.Left
                tabTitleLbl.Parent = tabBtn

                local tabHoverBtn = Instance.new("TextButton")
                tabHoverBtn.Size = UDim2.new(1,0,1,0)
                tabHoverBtn.BackgroundTransparency = 1
                tabHoverBtn.Text = ""
                tabHoverBtn.Parent = tabBtn

                tabHoverBtn.MouseEnter:Connect(function()
                    if not (currentTab and currentTab.Btn == tabBtn) then
                        tweenSine(tabBtn, 0.12, { BackgroundColor3 = Color3.fromRGB(22, 8, 8) }):Play()
                    end
                end)
                tabHoverBtn.MouseLeave:Connect(function()
                    if not (currentTab and currentTab.Btn == tabBtn) then
                        tweenSine(tabBtn, 0.12, { BackgroundColor3 = Color3.fromRGB(14, 6, 6) }):Play()
                    end
                end)

                local tabPage = Instance.new("Frame")
                tabPage.Name = (tabOpts.Title or "Tab") .. "Page"
                tabPage.Size = UDim2.new(1, 0, 1, 0)
                tabPage.BackgroundTransparency = 1
                tabPage.Visible = false
                tabPage.Parent = PageHolder

                local tabClickBtn = Instance.new("TextButton")
                tabClickBtn.Size = UDim2.new(1, 0, 1, 0)
                tabClickBtn.BackgroundTransparency = 1
                tabClickBtn.Text = ""
                tabClickBtn.Parent = tabBtn

                tabClickBtn.MouseButton1Click:Connect(function()
                    accentBar.Visible = true
                    setActiveTab(tabPage, tabBtn)
                end)

                if currentTab == nil then
                    setActiveTab(tabPage, tabBtn)
                    accentBar.Visible = true
                end

                local api = buildTabAPI(tabPage)
                return api
            end

            return sectionObj
        end

        return windowObj
    end

    -- ============================================================
    -- SYSTEM LOADER
    -- ============================================================
    local function ShowSystemLoader(onFinished)
        local ScreenGui = Instance.new("ScreenGui")
        ScreenGui.Name = "7zkSystemLoader"
        ScreenGui.IgnoreGuiInset = true
        ScreenGui.ResetOnSpawn = false

        local ok2, coreGui2 = pcall(function() return game:GetService("CoreGui") end)
        ScreenGui.Parent = (gethui and gethui()) or (ok2 and coreGui2) or LocalPlayer:WaitForChild("PlayerGui")

        local bg = Instance.new("Frame")
        bg.Size = UDim2.new(1, 0, 1, 0)
        bg.BackgroundColor3 = BG_DARK
        bg.BackgroundTransparency = 0
        bg.Parent = ScreenGui

        local accentLine = Instance.new("Frame")
        accentLine.Size = UDim2.new(0, 0, 0, 3)
        accentLine.Position = UDim2.new(0.5, 0, 0.5, 30)
        accentLine.BackgroundColor3 = ACCENT
        accentLine.BorderSizePixel = 0
        accentLine.Parent = bg
        local alC = Instance.new("UICorner"); alC.CornerRadius = UDim.new(1,0); alC.Parent = accentLine

        local title = Instance.new("TextLabel")
        title.Size = UDim2.new(1, 0, 0.2, 0)
        title.Position = UDim2.new(0, 0, 0.4, 0)
        title.BackgroundTransparency = 1
        title.Text = "7ZK HUB"
        title.TextColor3 = ACCENT
        title.Font = Enum.Font.GothamBold
        title.TextScaled = true
        title.TextTransparency = 1
        title.Parent = bg

        local subtitle = Instance.new("TextLabel")
        subtitle.Size = UDim2.new(1, 0, 0.08, 0)
        subtitle.Position = UDim2.new(0, 0, 0.55, 0)
        subtitle.BackgroundTransparency = 1
        subtitle.TextColor3 = TEXT_GRAY
        subtitle.Font = Enum.Font.Gotham
        subtitle.TextScaled = true
        subtitle.TextTransparency = 1
        subtitle.Parent = bg

        tweenQuint(accentLine, 0.3, {
            Size = UDim2.new(0.3, 0, 0, 3),
            Position = UDim2.new(0.35, 0, 0.5, 30)
        }):Play()
        task.wait(0.15)

        tweenBack(title, 0.35, { TextTransparency = 0 }):Play()
        task.wait(0.2)

        local steps = {"Initializing", "Loading modules", "7zkHub", "Ready"}
        for _, text in ipairs(steps) do
            subtitle.Text = text
            tweenSine(subtitle, 0.15, { TextTransparency = 0 }):Play()
            task.wait(0.4)
            tweenSine(subtitle, 0.15, { TextTransparency = 1 }):Play()
            task.wait(0.08)
        end

        tweenQuint(accentLine, 0.2, {
            Size = UDim2.new(1, 0, 0, 3),
            Position = UDim2.new(0, 0, 0.5, 30)
        }):Play()
        task.wait(0.1)
        TweenService:Create(bg, TweenInfo.new(0.25, Enum.EasingStyle.Quint), { BackgroundTransparency = 1 }):Play()
        TweenService:Create(title, TweenInfo.new(0.2, Enum.EasingStyle.Sine), { TextTransparency = 1 }):Play()

        task.wait(0.3)
        ScreenGui:Destroy()

        if onFinished then onFinished() end
    end

    -- ============================================================
    -- MÉTODOS DE YO.LUA (Callbacks)
    -- ============================================================
    local function __BuildCallbacks()
        local Callbacks = {}

        local function getTPSBall()
            local tpsSystem = Workspace:FindFirstChild("TPSSystem")
            if not tpsSystem then return nil end
            return tpsSystem:FindFirstChild("TPS")
        end

        local function getCharacter()
            local character = LocalPlayer.Character
            if not character or not character.Parent then return nil end
            return character
        end

        local function getPreferredFoot()
            local folder = Lighting:FindFirstChild(LocalPlayer.Name)
            local preferredFoot = folder and folder:FindFirstChild("PreferredFoot")
            if preferredFoot then
                local ok, value = pcall(function() return preferredFoot.Value end)
                if ok and (value == 1 or value == 2) then return value end
            end
            return 1
        end

        local function getKickPart(character)
            if not character then return nil end
            local humanoid = character:FindFirstChildOfClass("Humanoid")
            local preferredFoot = getPreferredFoot()
            if humanoid and humanoid.RigType == Enum.HumanoidRigType.R15 then
                if preferredFoot == 2 then
                    return character:FindFirstChild("LeftLowerLeg") or character:FindFirstChild("LeftUpperLeg")
                end
                return character:FindFirstChild("RightLowerLeg") or character:FindFirstChild("RightUpperLeg")
            end
            if preferredFoot == 2 then
                return character:FindFirstChild("Left Leg")
            end
            return character:FindFirstChild("Right Leg")
        end

        local function performTPSContact(kickPart, tpsBall)
            if not kickPart or not kickPart.Parent then return false end
            if not tpsBall or not tpsBall.Parent then return false end
            if not firetouchinterest then return false end
            firetouchinterest(kickPart, tpsBall, 0)
            firetouchinterest(kickPart, tpsBall, 1)
            return true
        end

        local function applyTPSVelocity(minX, maxX, minY, maxY, minZ, maxZ)
            local tpsBall = getTPSBall()
            if not tpsBall then return end
            tpsBall.Velocity = Vector3.new(
                math.random(minX, maxX),
                math.random(minY, maxY),
                math.random(minZ, maxZ)
            )
        end

        local function applyTPSSize(size)
            local tpsBall = getTPSBall()
            if not tpsBall then return end
            tpsBall.Size = Vector3.new(size, size, size)
        end

        local function setReplicationLag(value)
            settings():GetService("NetworkSettings").IncomingReplicationLag = value
        end

        -- REACTS
        Callbacks.React97mzu = function()
            setReplicationLag(0.09)
            applyTPSSize(2.67)
            applyTPSVelocity(100, 200, 155, 300, 30, 100)
        end

        Callbacks.ReactMauro = function()
            setReplicationLag(0.07)
            applyTPSSize(2.7)
            applyTPSVelocity(100, 200, 155, 300, 30, 100)
        end

        Callbacks.ReactSuit = function()
            setReplicationLag(0.05)
            applyTPSSize(2.7)
            applyTPSVelocity(100, 200, 155, 300, 30, 100)
        end

        Callbacks.ReactLyn = function()
            setReplicationLag(0.091)
            applyTPSSize(2.67)
            applyTPSVelocity(100, 200, 155, 300, 30, 100)
        end

        Callbacks.ReactAttack = function()
            setReplicationLag(0.064)
            applyTPSSize(2.75)
            applyTPSVelocity(180, 400, 250, 600, 60, 200)
        end

        Callbacks.ReactGoalkeeper = function()
            setReplicationLag(0.085)
            applyTPSSize(2.8)
            applyTPSVelocity(100, 200, 155, 300, 30, 100)
        end

        Callbacks.ReactMidfield = function()
            setReplicationLag(0.054)
            applyTPSSize(2.7)
            applyTPSVelocity(100, 200, 155, 300, 30, 100)
        end

        Callbacks.ReactDribble = function()
            applyTPSVelocity(100, 200, 155, 300, 30, 100)
        end

        Callbacks.ReactKick = function()
            applyTPSVelocity(100, 200, 155, 300, 30, 100)
        end

        Callbacks.ReactShoot = function()
            applyTPSVelocity(100, 200, 155, 300, 30, 100)
        end

        Callbacks.ReactFlick = function()
            applyTPSVelocity(100, 200, 155, 300, 30, 100)
        end

        Callbacks.ReactAlz = function()
            setReplicationLag(0.05)
            applyTPSSize(2.7)
            applyTPSVelocity(9000000000, 9000000000, 9000000000, 9000000000, 9000000000, 9000000000)
        end

        Callbacks.ReactAbz = function()
            setReplicationLag(0.12)
            applyTPSSize(2.7)
            applyTPSVelocity(9000000000, 9000000000, 9000000000, 9000000000, 9000000000, 9000000000)
        end

        Callbacks.ReactZank = function()
            setReplicationLag(0.04)
            applyTPSSize(2.75)
            applyTPSVelocity(180, 400, 250, 600, 60, 200)
        end

        Callbacks.ReactTmbuzzz = function()
            setReplicationLag(0.005)
            applyTPSSize(3.2)
            applyTPSVelocity(600, 1100, 800, 1400, 300, 700)
        end

        Callbacks.BallVelocity = function(value)
            local tpsBall = getTPSBall()
            if not tpsBall then return end
            tpsBall.Velocity = Vector3.new(value, value, value)
        end

        -- REACH
        local reachColors = {
            Red = Color3.fromRGB(255, 67, 76),
            Green = Color3.fromRGB(50, 255, 100),
            Blue = Color3.fromRGB(50, 150, 255),
            Yellow = Color3.fromRGB(255, 230, 50),
            Purple = Color3.fromRGB(170, 50, 255),
            Pink = Color3.fromRGB(255, 105, 180),
            Cyan = Color3.fromRGB(0, 255, 255),
            Orange = Color3.fromRGB(255, 140, 0),
            White = Color3.fromRGB(255, 255, 255),
            Black = Color3.fromRGB(30, 30, 30),
        }

        Callbacks.SetReachSize = function(text)
            local size = tonumber(text)
            if not size then return end
            if size ~= size or size == math.huge or size <= 0 then return end
            size = math.clamp(size, 0.1, 100)

            if getgenv().Reach and getgenv().ReachConnection then
                getgenv().Reach.Size = size
                getgenv().Reach.Distance = size
                return
            end

            getgenv().Reach = {
                Enabled = true,
                Size = size,
                Transparency = 0.5,
                Distance = size,
                Color = Color3.fromRGB(255, 67, 76),
            }

            local follow = Workspace:FindFirstChild("BallFollowPart")
            if not follow then
                follow = Instance.new("Part")
            end
            follow.Name = "BallFollowPart"
            follow.Shape = Enum.PartType.Ball
            follow.Size = Vector3.new(2.25, 2.25, 2.25)
            follow.Anchored = true
            follow.CanCollide = true
            follow.CanTouch = false
            follow.CanQuery = false
            follow.Transparency = getgenv().Reach.Transparency
            follow.Material = Enum.Material.ForceField
            follow.Color = getgenv().Reach.Color
            follow.Parent = Workspace

            if getgenv().ReachConnection then
                getgenv().ReachConnection:Disconnect()
                getgenv().ReachConnection = nil
            end

            getgenv().ReachConnection = RunService.RenderStepped:Connect(function()
                local reach = getgenv().Reach
                if not reach then return end

                local character = getCharacter()
                local root = character and character:FindFirstChild("HumanoidRootPart")
                local tpsBall = getTPSBall()

                if not root or not tpsBall then
                    follow.CFrame = CFrame.new(0, -1000, 0)
                    return
                end

                if (tpsBall.Position - root.Position).Magnitude <= reach.Size then
                    performTPSContact(getKickPart(character), tpsBall)
                    follow.CFrame = tpsBall.CFrame
                else
                    follow.CFrame = CFrame.new(0, -1000, 0)
                end
            end)

            getgenv().DisableReach = function()
                if getgenv().ReachConnection then
                    getgenv().ReachConnection:Disconnect()
                    getgenv().ReachConnection = nil
                end
                if follow and follow.Parent then follow:Destroy() end
                getgenv().Reach = nil
            end
        end

        Callbacks.SetReachTransparency = function(text)
            local value = tonumber(text)
            if not value then return end
            if value > 1 then value = value / 100 end
            if getgenv().Reach then getgenv().Reach.Transparency = value end
            local helper = Workspace:FindFirstChild("BallFollowPart")
            if helper then helper.Transparency = value end
        end

        Callbacks.SetReachColor = function(name)
            local color = reachColors[name]
            if not color then return end
            if getgenv().Reach then getgenv().Reach.Color = color end
            local helper = Workspace:FindFirstChild("BallFollowPart")
            if helper then helper.Color = color end
        end

        -- LEG REACH
        local legReachEnabled = false
        local legReachRange = 10
        local legReachConnection = nil
        local legReachDisabledMotor = nil

        local function getLegAnchor(character)
            local humanoid = character:FindFirstChildOfClass("Humanoid")
            if not humanoid then return nil end
            if humanoid.RigType ~= Enum.HumanoidRigType.R6 then
                return character:FindFirstChild("RightFoot") or character:FindFirstChild("RightLowerLeg") or character:FindFirstChild("RightUpperLeg")
            end
            return character:FindFirstChild("Right Leg")
        end

        local function destroyLegReachFakes(character)
            if not character then return end
            for _, object in ipairs(character:GetChildren()) do
                if object.Name == "Fake Right Leg" or object.Name == "Fake Left Leg" then
                    object:Destroy()
                end
            end
        end

        local function stopLegReach()
            if legReachConnection then
                legReachConnection:Disconnect()
                legReachConnection = nil
            end
            if legReachDisabledMotor then
                pcall(function() legReachDisabledMotor.Enabled = true end)
                legReachDisabledMotor = nil
            end
            local character = getCharacter()
            if character then
                local humanoid = character:FindFirstChildOfClass("Humanoid")
                if humanoid and humanoid.RigType == Enum.HumanoidRigType.R6 then
                    local rightLeg = character:FindFirstChild("Right Leg")
                    local leftLeg = character:FindFirstChild("Left Leg")
                    if rightLeg then rightLeg.Transparency = 0 rightLeg.Massless = false end
                    if leftLeg then leftLeg.Transparency = 0 leftLeg.Massless = false end
                end
                destroyLegReachFakes(character)
            end
        end

        local function createLegReachFake(character, realLeg, side)
            local fake = Instance.new("Part")
            fake.Name = side == "right" and "Fake Right Leg" or "Fake Left Leg"
            fake.CanCollide = false
            fake.Color = realLeg.Color
            fake.Size = Vector3.new(1, 2, 1)
            fake.Locked = true
            fake.Transparency = 1
            fake.Position = realLeg.Position
            fake.Parent = character

            local attachment = Instance.new("Attachment")
            attachment.Name = side == "right" and "RightFootAttachment" or "LeftFootAttachment"
            attachment.Position = Vector3.new(0, -1, 0)
            attachment.Parent = fake

            local motor = Instance.new("Motor6D")
            motor.Name = side == "right" and "Fake Right Hip" or "Fake Left Hip"
            if side == "right" then
                motor.C0 = CFrame.new(1, -1, 0, 0, 0, 1, 0, 1, 0, -1, 0, 0)
                motor.C1 = CFrame.new(0.5, 1, 0, 0, 0, 1, 0, 1, 0, -1, 0, 0)
            else
                motor.C0 = CFrame.new(-1, -1, 0, 0, 0, -1, 0, 1, 0, 1, 0, 0)
                motor.C1 = CFrame.new(-0.5, 1, 0, 0, 0, -1, 0, 1, 0, 1, 0, 0)
            end
            motor.MaxVelocity = 0.1
            motor.Part0 = character:FindFirstChild("Torso") or character:FindFirstChild("LowerTorso") or character:FindFirstChild("UpperTorso")
            motor.Part1 = fake
            motor.Parent = motor.Part0
        end

        local function startLegReach()
            if legReachConnection then
                legReachConnection:Disconnect()
                legReachConnection = nil
            end

            local character = getCharacter()
            if not character then return end

            local humanoid = character:FindFirstChildOfClass("Humanoid")
            local rootPart = character:FindFirstChild("HumanoidRootPart")
            if not humanoid or not rootPart then return end

            local anchor = getLegAnchor(character)
            if not anchor then return end

            legReachEnabled = true

            if humanoid.RigType == Enum.HumanoidRigType.R6 then
                local rightLeg = character:FindFirstChild("Right Leg")
                local leftLeg = character:FindFirstChild("Left Leg")
                if rightLeg then rightLeg.Transparency = 1 rightLeg.Massless = true end
                if leftLeg then leftLeg.Transparency = 1 leftLeg.Massless = true end
                createLegReachFake(character, leftLeg or rightLeg, "left")
                createLegReachFake(character, rightLeg or leftLeg, "right")

                local hip = character:FindFirstChild("Right Hip")
                if hip then
                    hip.Enabled = false
                    legReachDisabledMotor = hip
                end
            end

            legReachConnection = RunService.RenderStepped:Connect(function()
                local currentCharacter = getCharacter()
                if not currentCharacter then return end

                local currentRoot = currentCharacter:FindFirstChild("HumanoidRootPart")
                local currentAnchor = getLegAnchor(currentCharacter)
                local tpsBall = getTPSBall()

                if not currentRoot or not currentAnchor or not tpsBall then return end

                local offset = tpsBall.Position - currentRoot.Position
                local distance = offset.Magnitude

                if distance > legReachRange then
                    if distance > 0 then
                        currentAnchor.CFrame = CFrame.new(currentRoot.Position + offset.Unit * legReachRange)
                    end
                else
                    currentAnchor.CFrame = tpsBall.CFrame
                end
            end)
        end

        LocalPlayer.CharacterAdded:Connect(function(character)
            if legReachConnection then
                legReachConnection:Disconnect()
                legReachConnection = nil
            end
            legReachDisabledMotor = nil

            character:WaitForChild("Humanoid")
            character:WaitForChild("HumanoidRootPart")
            task.wait(0.1)

            if legReachEnabled and legReachRange > 0 then
                startLegReach()
            end
        end)

        Callbacks.LegReach = function(text)
            local trimmed = text:gsub("^%s*(.-)%s*$", "%1")
            local value = tonumber(trimmed)

            if trimmed == "" or not value or value <= 0 then
                legReachEnabled = false
                legReachRange = 10
                stopLegReach()
                return
            end

            legReachRange = value
            if not legReachConnection then
                startLegReach()
            elseif not legReachEnabled then
                startLegReach()
            end
        end

        Callbacks.ReachConfigGoalkeeper = function()
            local character = getCharacter()
            if not character then return end

            local humanoid = character:FindFirstChildOfClass("Humanoid")
            if not humanoid then return end

            local kickSideRight = getPreferredFoot() == 1
            local realLeg
            if humanoid.RigType ~= Enum.HumanoidRigType.R6 then
                realLeg = character:FindFirstChild(kickSideRight and "RightLowerLeg" or "LeftLowerLeg")
            else
                realLeg = character:FindFirstChild(kickSideRight and "Right Leg" or "Left Leg")
            end
            if not realLeg then return end

            realLeg.Massless = true
            realLeg.Size = Vector3.new(4.1, 2, 4.1)
            realLeg.Transparency = 1

            local fake = Instance.new("Part")
            fake.Name = kickSideRight and "Fake Right Leg" or "Fake Left Leg"
            fake.CanCollide = false
            fake.Color = realLeg.Color
            fake.Size = Vector3.new(1, 2, 1)
            fake.Locked = true
            fake.Position = realLeg.Position
            fake.Parent = character

            local attachment = Instance.new("Attachment")
            attachment.Name = kickSideRight and "RightFootAttachment" or "LeftFootAttachment"
            attachment.Position = Vector3.new(0, -1, 0)
            attachment.Parent = fake

            local motor = Instance.new("Motor6D")
            motor.Name = kickSideRight and "Fake Right Hip" or "Fake Left Hip"
            if kickSideRight then
                motor.C0 = CFrame.new(1, -1, 0, 0, 0, 1, 0, 1, 0, -1, 0, 0)
                motor.C1 = CFrame.new(0.5, 1, 0, 0, 0, 1, 0, 1, 0, -1, 0, 0)
            else
                motor.C0 = CFrame.new(-1, -1, 0, 0, 0, -1, 0, 1, 0, 1, 0, 0)
                motor.C1 = CFrame.new(-0.5, 1, 0, 0, 0, -1, 0, 1, 0, 1, 0, 0)
            end
            motor.MaxVelocity = 0.1
            motor.Part0 = character:FindFirstChild("Torso") or character:FindFirstChild("LowerTorso") or character:FindFirstChild("UpperTorso")
            motor.Part1 = fake
            motor.Parent = motor.Part0
        end

        Callbacks.ReachConfigAttack = function()
            local character = getCharacter()
            if not character then return end

            local humanoid = character:FindFirstChildOfClass("Humanoid")
            if not humanoid then return end

            local kickSideRight = getPreferredFoot() == 1
            local realLeg
            if humanoid.RigType ~= Enum.HumanoidRigType.R6 then
                realLeg = character:FindFirstChild(kickSideRight and "RightLowerLeg" or "LeftLowerLeg")
            else
                realLeg = character:FindFirstChild(kickSideRight and "Right Leg" or "Left Leg")
            end
            if not realLeg then return end

            realLeg.Massless = true
            realLeg.Size = Vector3.new(5, 2, 5)
            realLeg.Transparency = 1

            local fake = Instance.new("Part")
            fake.Name = kickSideRight and "Fake Right Leg" or "Fake Left Leg"
            fake.CanCollide = false
            fake.Color = realLeg.Color
            fake.Size = Vector3.new(1, 2, 1)
            fake.Locked = true
            fake.Position = realLeg.Position
            fake.Parent = character

            local attachment = Instance.new("Attachment")
            attachment.Name = kickSideRight and "RightFootAttachment" or "LeftFootAttachment"
            attachment.Position = Vector3.new(0, -1, 0)
            attachment.Parent = fake

            local motor = Instance.new("Motor6D")
            motor.Name = kickSideRight and "Fake Right Hip" or "Fake Left Hip"
            if kickSideRight then
                motor.C0 = CFrame.new(1, -1, 0, 0, 0, 1, 0, 1, 0, -1, 0, 0)
                motor.C1 = CFrame.new(0.5, 1, 0, 0, 0, 1, 0, 1, 0, -1, 0, 0)
            else
                motor.C0 = CFrame.new(-1, -1, 0, 0, 0, -1, 0, 1, 0, 1, 0, 0)
                motor.C1 = CFrame.new(-0.5, 1, 0, 0, 0, -1, 0, 1, 0, 1, 0, 0)
            end
            motor.MaxVelocity = 0.1
            motor.Part0 = character:FindFirstChild("Torso") or character:FindFirstChild("LowerTorso") or character:FindFirstChild("UpperTorso")
            motor.Part1 = fake
            motor.Parent = motor.Part0
        end

        Callbacks.RestoreLegs = function()
            local character = getCharacter()
            if not character then return end

            for _, object in ipairs(character:GetChildren()) do
                if object.Name == "Fake Right Leg" or object.Name == "Fake Left Leg" then
                    object:Destroy()
                end
            end

            local legNames = {"Right Leg", "Left Leg", "RightLowerLeg", "LeftLowerLeg", "RightUpperLeg", "LeftUpperLeg"}
            for _, name in ipairs(legNames) do
                local leg = character:FindFirstChild(name)
                if leg and leg:IsA("BasePart") then
                    leg.Transparency = 0
                    leg.Massless = false
                    leg.Size = Vector3.new(1, 2, 1)
                end
            end
        end

        -- AIR DRIBBLE
        local airDribbleEnabled = false
        local airDribbleSize = 9
        local airDribbleTransparency = 1
        local airDribbleMarker = nil
        local airDribbleConnection = nil
        local airDribbleHumanoid = nil

        local function destroyAirDribbleHelper()
            if airDribbleConnection then
                airDribbleConnection:Disconnect()
                airDribbleConnection = nil
            end
            if airDribbleMarker then
                if airDribbleMarker.Parent then
                    pcall(function() airDribbleMarker:Destroy() end)
                end
                airDribbleMarker = nil
            end
            airDribbleHumanoid = nil
        end

        local function createAirDribbleHelper()
            destroyAirDribbleHelper()
            if not airDribbleEnabled then return end

            local marker = Instance.new("Part")
            marker.Name = "AirDribbleHelper"
            marker.Size = Vector3.new(airDribbleSize, 1, airDribbleSize)
            marker.Anchored = true
            marker.CanCollide = false
            marker.CanTouch = false
            marker.CanQuery = false
            marker.Transparency = airDribbleTransparency
            marker.Material = Enum.Material.Neon
            marker.Color = Color3.fromRGB(128, 128, 128)
            marker.Parent = Workspace

            airDribbleMarker = marker

            airDribbleConnection = RunService.Heartbeat:Connect(function()
                if not airDribbleEnabled then return end
                if not airDribbleMarker or not airDribbleMarker.Parent then
                    createAirDribbleHelper()
                    return
                end

                local tpsBall = getTPSBall()
                local character = getCharacter()

                if not tpsBall or not tpsBall.Parent then
                    airDribbleMarker.CFrame = CFrame.new(0, -1000, 0)
                    airDribbleMarker.CanCollide = false
                    airDribbleMarker.CanTouch = false
                    airDribbleMarker.CanQuery = false
                    return
                end

                local humanoid = airDribbleHumanoid
                if not humanoid or not humanoid.Parent then
                    humanoid = character and character:FindFirstChildOfClass("Humanoid")
                    airDribbleHumanoid = humanoid
                end

                local airborne = false
                if airDribbleHumanoid then
                    local state = airDribbleHumanoid:GetState()
                    airborne = state == Enum.HumanoidStateType.Jumping or state == Enum.HumanoidStateType.Freefall
                end

                airDribbleMarker.CFrame = CFrame.new(tpsBall.Position.X, tpsBall.Position.Y - 1.2, tpsBall.Position.Z)
                airDribbleMarker.CanCollide = airborne
                airDribbleMarker.CanTouch = airborne
                airDribbleMarker.CanQuery = airborne
            end)
        end

        Callbacks.AirDribbleToggle = function(enabled)
            airDribbleEnabled = enabled
            if enabled then
                createAirDribbleHelper()
            else
                destroyAirDribbleHelper()
            end
        end

        Callbacks.AirDribbleSize = function(text)
            local value = tonumber(text)
            if not value then return end
            airDribbleSize = value
            if airDribbleMarker and airDribbleMarker.Parent then
                airDribbleMarker.Size = Vector3.new(value, 1, value)
            end
        end

        Callbacks.AirDribbleTransparency = function(text)
            local value = tonumber(text)
            if not value then return end
            airDribbleTransparency = value
            if airDribbleMarker and airDribbleMarker.Parent then
                airDribbleMarker.Transparency = value
            end
        end

        -- MOSS
        local mossEngines = {}
        local mossLastFire = 0

        local function stopMossEngine(name)
            local engine = mossEngines[name]
            if not engine then return end
            if engine.connection then engine.connection:Disconnect() end
            if engine.animation then pcall(function() engine.animation:Destroy() end) end
            mossEngines[name] = nil
        end

        local function boxIntersects(centerA, sizeA, centerB, sizeB)
            local minA = centerA.Position - sizeA / 2
            local maxA = centerA.Position + sizeA / 2
            local minB = centerB.Position - sizeB / 2
            local maxB = centerB.Position + sizeB / 2
            return minA.X <= maxB.X and maxA.X >= minB.X and minA.Y <= maxB.Y and maxA.Y >= minB.Y and minA.Z <= maxB.Z and maxA.Z >= minB.Z
        end

        local function startMossEngine(name, zoneSize)
            stopMossEngine(name)

            local engine = {
                zoneSize = zoneSize,
                prevHit = false,
                connection = nil,
                animation = Instance.new("Animation"),
                track = nil,
            }

            engine.animation.AnimationId = "rbxassetid://301501585"

            engine.connection = RunService.Heartbeat:Connect(function()
                local character = getCharacter()
                if not character then return end

                local head = character:FindFirstChild("Head")
                local rootPart = character:FindFirstChild("HumanoidRootPart")
                if not head or not rootPart then return end

                local ball = getTPSBall()
                if not ball or not ball.Parent then return end

                local hit = false
                if rootPart.Position.Y + 1 <= ball.Position.Y then
                    local predicted = ball.Position + ball.AssemblyLinearVelocity * 0.001
                    local predictedCFrame = CFrame.new(predicted) * ball.CFrame.Rotation
                    local headCenter = head.CFrame * CFrame.new(0, 1.5, 0)

                    hit = boxIntersects(headCenter, engine.zoneSize, predictedCFrame, ball.Size)
                end

                if not hit or engine.prevHit then
                    engine.prevHit = hit
                    return
                end

                local now = os.clock()
                if now - mossLastFire < 0.15 then return end
                mossLastFire = now

                local feFolder = Workspace:FindFirstChild("FE")
                local system = feFolder and feFolder:FindFirstChild("System")
                local remote = system and system:FindFirstChild("Header")

                if remote then
                    pcall(function()
                        remote:FireServer(LocalPlayer.UserId, ball, "Rock'n'roll Star", "NeverFearTruth", "power=95/100")
                    end)
                end

                local humanoid = character:FindFirstChildOfClass("Humanoid")
                if humanoid then
                    pcall(function()
                        local animator = humanoid:FindFirstChildOfClass("Animator") or humanoid
                        engine.track = animator:LoadAnimation(engine.animation)
                        engine.track:Play()
                    end)
                end

                engine.prevHit = hit
            end)

            mossEngines[name] = engine
        end

        Callbacks.MossBxw = function(enabled)
            if enabled then
                startMossEngine("bxw", Vector3.new(2.5, 3.2, 3.3))
            else
                stopMossEngine("bxw")
            end
        end

        Callbacks.MossZy81o = function(enabled)
            if enabled then
                startMossEngine("zy81o", Vector3.new(2, 2.8, 3))
            else
                stopMossEngine("zy81o")
            end
        end

        -- ZZZZ
        local zzzzEnabled = false
        local zzzzMarker = nil
        local zzzzConnection = nil

        local function createZZZZMarker()
            if zzzzMarker and zzzzMarker.Parent then return end
            if zzzzMarker then pcall(function() zzzzMarker:Destroy() end) zzzzMarker = nil end

            local marker = Instance.new("Part")
            marker.Name = "ZZZZHelperPlatform"
            marker.Size = Vector3.new(9, 0.1, 9)
            marker.Anchored = true
            marker.CanCollide = false
            marker.Transparency = 1
            marker.Color = Color3.fromRGB(255, 87, 87)
            marker.Material = Enum.Material.Neon
            marker.Parent = Workspace
            zzzzMarker = marker
        end

        local function destroyZZZZHelper()
            if zzzzConnection then zzzzConnection:Disconnect() zzzzConnection = nil end
            if zzzzMarker then
                if zzzzMarker.Parent then pcall(function() zzzzMarker:Destroy() end) end
                zzzzMarker = nil
            end
            zzzzEnabled = false
        end

        Callbacks.ZZZZHelper = function(enabled)
            destroyZZZZHelper()
            if not enabled then return end

            zzzzEnabled = true
            createZZZZMarker()

            zzzzConnection = RunService.RenderStepped:Connect(function()
                if not zzzzEnabled then return end
                if not zzzzMarker or not zzzzMarker.Parent then
                    createZZZZMarker()
                    return
                end

                local ball = getTPSBall()
                if not ball or not ball.Parent then return end

                zzzzMarker.CFrame = CFrame.new(ball.Position.X, ball.Position.Y - 1, ball.Position.Z)
            end)
        end

        -- BALL PREDICTION
        local v8PredictionConnection
        local v8PredictionFolder
        local v8PredictionBeam
        local v8PredictionStart
        local v8PredictionEnd
        local v8PredictionMarker
        local v8PredictionBall

        local function v8CreatePredictionFX()
            local folder = Instance.new("Folder")
            folder.Name = "BallPredictionFX"
            folder.Parent = Workspace

            local startAttachment = Instance.new("Attachment")
            startAttachment.Name = "PredictStart"

            local endPart = Instance.new("Part")
            endPart.Name = "PredictEndPart"
            endPart.Size = Vector3.new(0.1, 0.1, 0.1)
            endPart.Transparency = 1
            endPart.Anchored = true
            endPart.CanCollide = false
            endPart.Parent = folder

            local endAttachment = Instance.new("Attachment")
            endAttachment.Name = "PredictEnd"
            endAttachment.Parent = endPart

            local beam = Instance.new("Beam")
            beam.Attachment0 = startAttachment
            beam.Attachment1 = endAttachment
            beam.Width0 = 0.4
            beam.Width1 = 0.4
            beam.FaceCamera = true
            beam.ZOffset = -0.1

            beam.Color = ColorSequence.new({
                ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 76, 76)),
                ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 150, 150)),
            })

            beam.Transparency = NumberSequence.new({
                NumberSequenceKeypoint.new(0, 0.1),
                NumberSequenceKeypoint.new(0.8, 0.3),
                NumberSequenceKeypoint.new(1, 1),
            })

            beam.Parent = folder

            local marker = Instance.new("Part")
            marker.Shape = Enum.PartType.Ball
            marker.Size = Vector3.new(0.8, 0.8, 0.8)
            marker.Color = Color3.fromRGB(255, 76, 76)
            marker.Material = Enum.Material.Neon
            marker.Anchored = true
            marker.CanCollide = false
            marker.Transparency = 0.2
            marker.Parent = folder

            return folder, beam, startAttachment, endAttachment, marker
        end

        Callbacks.BallPrediction = function(enabled)
            if enabled then
                if v8PredictionConnection then return end

                v8PredictionFolder, v8PredictionBeam, v8PredictionStart, v8PredictionEnd, v8PredictionMarker = v8CreatePredictionFX()

                v8PredictionConnection = RunService.RenderStepped:Connect(function()
                    local ball = getTPSBall()
                    if not ball or ball.AssemblyLinearVelocity.Magnitude <= 0.5 then
                        v8PredictionFolder.Parent = nil
                        return
                    end

                    if ball ~= v8PredictionBall then
                        v8PredictionStart.Parent = ball
                        v8PredictionBall = ball
                    end

                    v8PredictionFolder.Parent = Workspace

                    local position = ball.Position
                    local velocity = ball.AssemblyLinearVelocity
                    local gravity = Vector3.new(0, -Workspace.Gravity, 0)

                    local predicted = position + velocity * 1.2 + (0.5 * gravity) * 1.44
                    local midpoint = position + (0.5 * velocity) * 1.2

                    v8PredictionEnd.Parent.Position = predicted
                    v8PredictionBeam.CurveSize0 = (midpoint - position).Magnitude * 0.5
                    v8PredictionBeam.CurveSize1 = (predicted - midpoint).Magnitude * 0.5
                    v8PredictionStart.WorldAxis = (midpoint - position).Unit
                    v8PredictionEnd.WorldAxis = (predicted - midpoint).Unit
                    v8PredictionMarker.Position = predicted
                end)
                return
            end

            if v8PredictionConnection then
                v8PredictionConnection:Disconnect()
                v8PredictionConnection = nil
            end

            if v8PredictionFolder then
                v8PredictionFolder:Destroy()
                v8PredictionFolder = nil
            end

            v8PredictionBeam = nil
            v8PredictionStart = nil
            v8PredictionEnd = nil
            v8PredictionMarker = nil
            v8PredictionBall = nil
        end

        -- IMPACT DISTANCE
        local v8ImpactFolder
        local v8ImpactMarker
        local v8ImpactConnection

        Callbacks.ImpactDistance = function(enabled)
            if enabled then
                v8ImpactFolder = Instance.new("Folder")
                v8ImpactFolder.Name = "ImpactDistanceFX"
                v8ImpactFolder.Parent = Workspace

                v8ImpactMarker = Instance.new("Part")
                v8ImpactMarker.Shape = Enum.PartType.Cylinder
                v8ImpactMarker.Size = Vector3.new(0.1, 4, 4)
                v8ImpactMarker.Color = Color3.fromRGB(255, 76, 76)
                v8ImpactMarker.Material = Enum.Material.Neon
                v8ImpactMarker.Anchored = true
                v8ImpactMarker.CanCollide = false
                v8ImpactMarker.Transparency = 0.4
                v8ImpactMarker.CFrame = CFrame.new() * CFrame.Angles(0, 0, math.rad(90))
                v8ImpactMarker.Parent = v8ImpactFolder

                v8ImpactConnection = RunService.RenderStepped:Connect(function()
                    local ball = getTPSBall()
                    if not ball or ball.AssemblyLinearVelocity.Magnitude <= 0.5 then
                        v8ImpactFolder.Parent = nil
                        return
                    end

                    v8ImpactFolder.Parent = Workspace

                    local position = ball.Position
                    local velocity = ball.AssemblyLinearVelocity
                    local gravity = Vector3.new(0, -Workspace.Gravity, 0)

                    local raycastParams = RaycastParams.new()
                    raycastParams.FilterType = Enum.RaycastFilterType.Exclude
                    raycastParams.FilterDescendantsInstances = {ball, v8ImpactFolder}

                    local impactPosition
                    for t = 0, 3, 0.05 do
                        local p0 = position + velocity * t + (0.5 * gravity) * (t ^ 2)
                        local nextT = t + 0.05
                        local p1 = position + velocity * nextT + (0.5 * gravity) * (nextT ^ 2)
                        local result = Workspace:Raycast(p0, p1 - p0, raycastParams)
                        if result then
                            impactPosition = result.Position
                            break
                        end
                    end

                    if impactPosition then
                        v8ImpactMarker.Transparency = 0.4
                        v8ImpactMarker.CFrame = CFrame.new(impactPosition) * CFrame.Angles(0, 0, math.rad(90))
                    else
                        v8ImpactMarker.Transparency = 1
                    end
                end)
                return
            end

            if v8ImpactConnection then
                v8ImpactConnection:Disconnect()
                v8ImpactConnection = nil
            end
            if v8ImpactFolder then
                v8ImpactFolder:Destroy()
                v8ImpactFolder = nil
            end
            v8ImpactMarker = nil
        end

        -- SERVER FUNCTIONS
        Callbacks.CopyJobId = function()
            if setclipboard then setclipboard(game.JobId) end
        end

        Callbacks.RejoinServer = function()
            local teleport = game:GetService("TeleportService")
            teleport:TeleportToPlaceInstance(game.PlaceId, game.JobId, LocalPlayer)
        end

        Callbacks.JoinJobId = function(jobId)
            if jobId == "" then return end
            local teleport = game:GetService("TeleportService")
            teleport:TeleportToPlaceInstance(game.PlaceId, jobId, LocalPlayer)
        end

        Callbacks.HopServer = function(sortOrder)
            local HttpService = game:GetService("HttpService")
            local TeleportService = game:GetService("TeleportService")
            local servers = {}
            local cursor = ""

            repeat
                local page
                local ok = pcall(function()
                    local url = "https://games.roblox.com/v1/games/" .. tostring(game.PlaceId) .. "/servers/Public?sortOrder=" .. tostring(sortOrder) .. "&limit=100" .. (cursor ~= "" and ("&cursor=" .. cursor) or "")
                    page = HttpService:JSONDecode(game:HttpGet(url))
                end)

                if ok and page and page.data then
                    for _, server in ipairs(page.data) do
                        if server.id ~= game.JobId and server.playing < server.maxPlayers then
                            table.insert(servers, server)
                        end
                    end
                    cursor = page.nextPageCursor or ""
                else
                    cursor = ""
                end
            until cursor == ""

            if #servers > 0 then
                local server = servers[math.random(1, math.min(3, #servers))]
                TeleportService:TeleportToPlaceInstance(game.PlaceId, server.id, LocalPlayer)
            else
                TeleportService:Teleport(game.PlaceId, LocalPlayer)
            end
        end

        Callbacks.SetWalkSpeed = function(value)
            getgenv().CurrentSpeed = value
            local character = getCharacter()
            if not character then return end
            local humanoid = character:FindFirstChild("Humanoid")
            if not humanoid then return end
            humanoid.WalkSpeed = value
        end

        Callbacks.SetClumsy = function(text)
            settings():GetService("NetworkSettings").IncomingReplicationLag = text
        end

        -- FARM
        local farmGoalsConnection = nil
        local farmGoalsLastKick = 0

        local function getEnemyGoalPosition()
            if LocalPlayer.TeamColor == BrickColor.new("Bright red") then
                local blueGoal = Workspace:FindFirstChild("BlueGoal")
                local goalPart = blueGoal and blueGoal:FindFirstChild("Part")
                if goalPart then return goalPart.Position end
            elseif LocalPlayer.TeamColor == BrickColor.new("Bright blue") then
                local redGoal = Workspace:FindFirstChild("RedGoal")
                local goalPart = redGoal and redGoal:FindFirstChild("Part")
                if goalPart then return goalPart.Position end
            end
            return nil
        end

        Callbacks.FarmGoals = function(enabled)
            if farmGoalsConnection then
                farmGoalsConnection:Disconnect()
                farmGoalsConnection = nil
            end
            if not enabled then return end

            farmGoalsConnection = RunService.Heartbeat:Connect(function()
                local character = getCharacter()
                if not character then return end

                local rootPart = character:FindFirstChild("HumanoidRootPart")
                local ball = getTPSBall()
                local goalPosition = getEnemyGoalPosition()

                if not rootPart or not ball or not goalPosition then return end

                rootPart.AssemblyLinearVelocity = Vector3.zero
                rootPart.CFrame = CFrame.lookAt(ball.Position + Vector3.new(0, -0.062, 0), goalPosition)

                local now = os.clock()
                if (rootPart.Position - ball.Position).Magnitude <= 10 and now - farmGoalsLastKick >= 0.002 then
                    farmGoalsLastKick = now

                    local feFolder = Workspace:FindFirstChild("FE")
                    local system = feFolder and feFolder:FindFirstChild("System")
                    local remote = system and system:FindFirstChild("Kick")

                    if remote then
                        pcall(function()
                            remote:FireServer(LocalPlayer.UserId, ball, 70, Vector3.new(400000, 800, 400000), false, true, 0, "Rock'n'roll Star", "NeverFearTruth", "power=95/100")
                        end)
                    end
                end
            end)
        end

        Callbacks.FarmPowers = function(enabled)
            local farmPowersConnection = nil
            if farmPowersConnection then
                farmPowersConnection:Disconnect()
                farmPowersConnection = nil
            end
            if not enabled then return end

            farmPowersConnection = Workspace.DescendantAdded:Connect(function(descendant)
                if descendant.Name ~= "Item" then return end
                local part = descendant:IsA("BasePart") and descendant or descendant:FindFirstChildWhichIsA("BasePart", true)
                if not part then return end
                pcall(function()
                    part.Size = Vector3.new(240000, 240000, 240000)
                    part.CanCollide = false
                    part.Massless = true
                end)
            end)
        end

        -- AUTO INF
        local v8PCConnection
        _G.BallFollowEnabled = false

        local function v8TogglePCFollow()
            _G.BallFollowEnabled = not _G.BallFollowEnabled

            if _G.BallFollowEnabled then
                if v8PCConnection then v8PCConnection:Disconnect() end
                v8PCConnection = RunService.Heartbeat:Connect(function()
                    local character = getCharacter()
                    local humanoid = character and character:FindFirstChild("Humanoid")
                    local ball = getTPSBall()
                    if not humanoid or not ball then return end
                    humanoid:MoveTo(ball.Position)
                    ball.Velocity = Vector3.zero
                end)
            elseif v8PCConnection then
                v8PCConnection:Disconnect()
                v8PCConnection = nil
            end
        end

        local v8PCInputConnection = nil

        Callbacks.AutoInfPC = function()
            if v8PCInputConnection then
                v8PCInputConnection:Disconnect()
                v8PCInputConnection = nil
            end

            v8PCInputConnection = UserInputService.InputBegan:Connect(function(input, processed)
                if processed then return end
                if input.KeyCode == Enum.KeyCode.C then
                    v8TogglePCFollow()
                end
            end)
        end

        -- Mobile Auto Inf
        local v8MobileEnabled = false
        local v8MobileConnection
        local v8MovementTrack

        local function v8FindNamedBall()
            return getTPSBall()
        end

        local function v8PlayMovementAnimation(humanoid)
            if v8MovementTrack and v8MovementTrack.IsPlaying then return end
            local character = getCharacter()
            local animate = character and character:FindFirstChild("Animate")
            if not animate then return end
            local movement = animate:FindFirstChild("run") or animate:FindFirstChild("walk")
            if not movement then return end
            local animation = movement:FindFirstChildOfClass("Animation")
            if not animation then return end
            local animator = humanoid:FindFirstChildOfClass("Animator") or humanoid
            v8MovementTrack = animator:LoadAnimation(animation)
            v8MovementTrack.Priority = Enum.AnimationPriority.Movement
            v8MovementTrack:Play()
        end

        local function v8StopMovementAnimation()
            if v8MovementTrack then
                v8MovementTrack:Stop()
                v8MovementTrack = nil
            end
        end

        _G.ToggleBallFollow = function()
            v8MobileEnabled = not v8MobileEnabled

            if _G.UpdateBallMobile then
                _G.UpdateBallMobile(v8MobileEnabled)
            end

            if v8MobileEnabled then
                v8MobileConnection = RunService.Heartbeat:Connect(function()
                    local character = getCharacter()
                    if not character then return end
                    local rootPart = character:FindFirstChild("HumanoidRootPart")
                    local humanoid = character:FindFirstChildOfClass("Humanoid")
                    local ball = v8FindNamedBall()
                    if not rootPart or not humanoid or not ball then return end

                    v8PlayMovementAnimation(humanoid)
                    rootPart.CFrame = CFrame.new(ball.Position.X, rootPart.Position.Y, ball.Position.Z)
                end)
                return
            end

            v8StopMovementAnimation()
            if v8MobileConnection then
                v8MobileConnection:Disconnect()
                v8MobileConnection = nil
            end
        end

        Callbacks.AutoInfMobile = function()
            local oldGui = CoreGui:FindFirstChild("BallFollowMobile")
            if oldGui then oldGui:Destroy() end

            local gui = Instance.new("ScreenGui")
            gui.Name = "BallFollowMobile"
            gui.ResetOnSpawn = false
            gui.Parent = CoreGui

            local frame = Instance.new("Frame")
            frame.Size = UDim2.new(0, 180, 0, 110)
            frame.Position = UDim2.new(0.05, 0, 0.4, 0)
            frame.BackgroundColor3 = Color3.fromRGB(24, 24, 28)
            frame.BorderSizePixel = 0
            frame.Active = true
            frame.Draggable = true
            frame.Parent = gui

            local corner = Instance.new("UICorner")
            corner.CornerRadius = UDim.new(0, 14)
            corner.Parent = frame

            local frameStroke = Instance.new("UIStroke")
            frameStroke.Color = Color3.fromRGB(45, 45, 55)
            frameStroke.Thickness = 1.5
            frameStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
            frameStroke.Parent = frame

            local gradient = Instance.new("UIGradient")
            gradient.Color = ColorSequence.new({
                ColorSequenceKeypoint.new(0, Color3.fromRGB(30, 30, 36)),
                ColorSequenceKeypoint.new(1, Color3.fromRGB(18, 18, 22)),
            })
            gradient.Rotation = 45
            gradient.Parent = frame

            local title = Instance.new("TextLabel")
            title.Size = UDim2.new(1, 0, 0, 40)
            title.Position = UDim2.new(0, 0, 0, 5)
            title.BackgroundTransparency = 1
            title.Text = "Auto Inf Fast"
            title.TextColor3 = Color3.fromRGB(240, 240, 245)
            title.Font = Enum.Font.GothamBold
            title.TextSize = 15
            title.Parent = frame

            local separator = Instance.new("Frame")
            separator.Size = UDim2.new(0.85, 0, 0, 1)
            separator.Position = UDim2.new(0.075, 0, 0, 42)
            separator.BackgroundColor3 = Color3.fromRGB(45, 45, 55)
            separator.BorderSizePixel = 0
            separator.Parent = frame

            local button = Instance.new("TextButton")
            button.Size = UDim2.new(0.85, 0, 0, 36)
            button.Position = UDim2.new(0.075, 0, 0.52, 0)
            button.Text = "OFF"
            button.BackgroundColor3 = Color3.fromRGB(35, 35, 42)
            button.TextColor3 = Color3.fromRGB(180, 180, 190)
            button.Font = Enum.Font.GothamMedium
            button.TextSize = 14
            button.AutoButtonColor = false
            button.Parent = frame

            local buttonCorner = Instance.new("UICorner")
            buttonCorner.CornerRadius = UDim.new(0, 10)
            buttonCorner.Parent = button

            local buttonStroke = Instance.new("UIStroke")
            buttonStroke.Color = Color3.fromRGB(55, 55, 68)
            buttonStroke.Thickness = 1
            buttonStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
            buttonStroke.Parent = button

            _G.UpdateBallMobile = function(enabled)
                local background = enabled and Color3.fromRGB(16, 185, 129) or Color3.fromRGB(35, 35, 42)
                local border = enabled and Color3.fromRGB(52, 211, 153) or Color3.fromRGB(55, 55, 68)
                button.Text = enabled and "ON" or "OFF"
                TweenService:Create(button, TweenInfo.new(0.25, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {BackgroundColor3 = background}):Play()
                TweenService:Create(buttonStroke, TweenInfo.new(0.25, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {Color = border}):Play()
            end

            button.MouseButton1Click:Connect(function()
                if _G.ToggleBallFollow then _G.ToggleBallFollow() end
            end)
        end

        -- BALL STATS
        local statsFolder
        local statsBillboard
        local statsLabel
        local statsConnection

        Callbacks.BallStats = function(enabled)
            if enabled then
                statsFolder = Instance.new("Folder")
                statsFolder.Name = "BallStatsFX"
                statsFolder.Parent = Workspace

                statsBillboard = Instance.new("BillboardGui")
                statsBillboard.Size = UDim2.new(0, 200, 0, 50)
                statsBillboard.StudsOffset = Vector3.new(0, 2.5, 0)
                statsBillboard.AlwaysOnTop = true
                statsBillboard.Parent = statsFolder

                statsLabel = Instance.new("TextLabel")
                statsLabel.Size = UDim2.new(1, 0, 1, 0)
                statsLabel.BackgroundTransparency = 1
                statsLabel.TextColor3 = Color3.fromRGB(255, 76, 76)
                statsLabel.TextStrokeTransparency = 0
                statsLabel.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
                statsLabel.Font = Enum.Font.SourceSansBold
                statsLabel.TextSize = 14
                statsLabel.Parent = statsBillboard

                statsConnection = RunService.RenderStepped:Connect(function()
                    local ball = getTPSBall()
                    if not ball then
                        if statsFolder then statsFolder.Parent = nil end
                        return
                    end

                    statsFolder.Parent = Workspace
                    statsBillboard.Adornee = ball

                    local speed = math.floor(ball.AssemblyLinearVelocity.Magnitude)
                    local altitude = math.floor(ball.Position.Y)

                    local character = getCharacter()
                    local rootPart = character and character:FindFirstChild("HumanoidRootPart")
                    local distance = 0
                    if rootPart then
                        distance = math.floor((ball.Position - rootPart.Position).Magnitude)
                    end

                    statsLabel.Text = string.format("Speed: %d SPS\nAlt: %d | Dist: %d studs", speed, altitude, distance)
                end)
            else
                if statsConnection then statsConnection:Disconnect() statsConnection = nil end
                if statsFolder then statsFolder:Destroy() statsFolder = nil end
                statsBillboard = nil
                statsLabel = nil
            end
        end

        -- PING REDUCER
        Callbacks.PingReducer = function()
            local removable = {
                ParticleEmitter = true,
                Smoke = true,
                Fire = true,
            }
            task.spawn(function()
                local descendants = Workspace:GetDescendants()
                for i = #descendants, 1, -1 do
                    local object = descendants[i]
                    if object and removable[object.ClassName] then
                        object:Destroy()
                    end
                end
            end)
        end

        -- DARK ABYSS
        Callbacks.DarkAbyss = function()
            local lighting = Lighting
            for _, child in pairs(lighting:GetChildren()) do
                if child:IsA("Sky") then child:Destroy() end
            end

            local sky = Instance.new("Sky")
            sky.Name = "7zkDarkSky"
            sky.SkyboxBk = "rbxassetid://0"
            sky.SkyboxDn = "rbxassetid://0"
            sky.SkyboxFt = "rbxassetid://0"
            sky.SkyboxLf = "rbxassetid://0"
            sky.SkyboxRt = "rbxassetid://0"
            sky.SkyboxUp = "rbxassetid://0"
            sky.Parent = lighting

            lighting.Ambient = Color3.fromRGB(128, 128, 128)
            lighting.OutdoorAmbient = Color3.fromRGB(100, 100, 100)
            lighting.FogColor = Color3.fromRGB(120, 120, 120)
            lighting.FogEnd = 1000
        end

        -- OVERRIDE TEXTURE
        local overrideState = { materials = {}, reflectance = {}, quality = nil, globalShadows = nil }

        Callbacks.OverrideTexture = function(enabled)
            local Lighting = game:GetService("Lighting")

            if enabled then
                overrideState.quality = settings().Rendering.QualityLevel
                overrideState.globalShadows = Lighting.GlobalShadows

                pcall(function() settings().Rendering.QualityLevel = Enum.QualityLevel.Level03 end)
                Lighting.GlobalShadows = false

                for _, object in pairs(Workspace:GetDescendants()) do
                    if object:IsA("BasePart") then
                        overrideState.materials[object] = object.Material
                        overrideState.reflectance[object] = object.Reflectance
                        object.Material = Enum.Material.SmoothPlastic
                        object.Reflectance = 0
                    elseif object:IsA("Texture") or object:IsA("Decal") then
                        object.Transparency = 1
                    end
                end
            else
                pcall(function()
                    if overrideState.quality then
                        settings().Rendering.QualityLevel = overrideState.quality
                    end
                end)

                if overrideState.globalShadows ~= nil then
                    Lighting.GlobalShadows = overrideState.globalShadows
                end

                for _, object in pairs(Workspace:GetDescendants()) do
                    if object:IsA("BasePart") then
                        local material = overrideState.materials[object]
                        if material then object.Material = material end
                        local reflectance = overrideState.reflectance[object]
                        if reflectance ~= nil then object.Reflectance = reflectance end
                    elseif object:IsA("Texture") or object:IsA("Decal") then
                        object.Transparency = 0
                    end
                end

                table.clear(overrideState.materials)
                table.clear(overrideState.reflectance)
            end
        end

        -- DISABLE PLAYER SHADOWS
        Callbacks.DisablePlayerShadows = function(enabled)
            getgenv().ReachConnections = getgenv().ReachConnections or {}

            local previous = getgenv().ReachConnections.DisablePlayerShadows
            if previous then
                previous:Disconnect()
                getgenv().ReachConnections.DisablePlayerShadows = nil
            end

            if not enabled then return end

            local function applyCharacter(character)
                if not character then return end
                for _, object in pairs(character:GetDescendants()) do
                    if object:IsA("BasePart") then
                        object.CastShadow = false
                    end
                end
            end

            local function bindPlayer(player)
                if player.Character then applyCharacter(player.Character) end
                player.CharacterAdded:Connect(applyCharacter)
            end

            for _, player in pairs(Players:GetPlayers()) do
                bindPlayer(player)
            end

            getgenv().ReachConnections.DisablePlayerShadows = Players.PlayerAdded:Connect(bindPlayer)
        end

        -- DISABLE POST FX
        local savedPostEffects = {}

        Callbacks.DisablePostFX = function(enabled)
            local Lighting = game:GetService("Lighting")

            if enabled then
                for _, object in pairs(Lighting:GetChildren()) do
                    if object:IsA("PostEffect") then
                        savedPostEffects[object] = object.Enabled
                        object.Enabled = false
                    end
                end

                local camera = Workspace.CurrentCamera
                if camera then
                    for _, object in pairs(camera:GetChildren()) do
                        if object:IsA("PostEffect") then
                            savedPostEffects[object] = object.Enabled
                            object.Enabled = false
                        end
                    end
                end
            else
                for object, previous in pairs(savedPostEffects) do
                    if object and object.Parent then
                        object.Enabled = previous
                    end
                end
                table.clear(savedPostEffects)
            end
        end

        -- SKY CHANGERS
        Callbacks.AuroraSky = function()
            local sky = Instance.new("Sky")
            sky.SkyboxBk = "rbxassetid://75955506846727"
            sky.SkyboxDn = "rbxassetid://117391257413562"
            sky.SkyboxFt = "rbxassetid://109900307855247"
            sky.SkyboxLf = "rbxassetid://99736968434760"
            sky.SkyboxRt = "rbxassetid://130270741662079"
            sky.SkyboxUp = "rbxassetid://102086995250620"
            sky.Parent = Lighting
        end

        Callbacks.FullNightSky = function()
            getgenv().Kitten = 5
            local sky = Instance.new("Sky")
            sky.Parent = Lighting
            sky.CelestialBodiesShown = false
            local texture = "http://www.roblox.com/asset/?id=17055447520"
            sky.SkyboxBk = texture
            sky.SkyboxDn = texture
            sky.SkyboxFt = texture
            sky.SkyboxLf = texture
            sky.SkyboxRt = texture
            sky.SkyboxUp = texture
        end

        Callbacks.SakuraPinkSky = function()
            local sky = Instance.new("Sky")
            sky.Parent = Lighting
            sky.SkyboxBk = "http://www.roblox.com/asset/?id=271042516"
            sky.SkyboxDn = "http://www.roblox.com/asset/?id=271077243"
            sky.SkyboxFt = "http://www.roblox.com/asset/?id=271042556"
            sky.SkyboxLf = "http://www.roblox.com/asset/?id=271042310"
            sky.SkyboxRt = "http://www.roblox.com/asset/?id=271042467"
            sky.SkyboxUp = "http://www.roblox.com/asset/?id=271077958"
            sky.StarCount = 5000
        end

        -- AVATAR STEAL
        local function v8CopyAppearanceObject(object, character, humanoid)
            if object:IsA("Shirt") or object:IsA("Pants") or object:IsA("BodyColors") or object:IsA("CharacterMesh") then
                object:Clone().Parent = character
                return
            end
            if object:IsA("Accessory") then
                humanoid:AddAccessory(object:Clone())
            end
        end

        local function v8CopyAvatar(userId, character)
            if not character then return end
            local humanoid = character:FindFirstChildOfClass("Humanoid")
            if not humanoid then return end

            local appearanceOK, appearanceModel = pcall(function()
                return Players:GetCharacterAppearanceAsync(userId)
            end)
            local descriptionOK, description = pcall(function()
                return Players:GetHumanoidDescriptionFromUserId(userId)
            end)

            if not appearanceOK or not appearanceModel then
                if descriptionOK and description then
                    pcall(function() humanoid:ApplyDescription(description) end)
                end
                return
            end

            for _, object in pairs(character:GetChildren()) do
                if object:IsA("Accessory") or object:IsA("Shirt") or object:IsA("Pants") or object:IsA("CharacterMesh") or object:IsA("BodyColors") then
                    object:Destroy()
                end
            end

            local targetHead = character:FindFirstChild("Head")
            if targetHead then
                for _, object in pairs(targetHead:GetChildren()) do
                    if object:IsA("Decal") then object:Destroy() end
                end
            end

            for _, object in ipairs(appearanceModel:GetDescendants()) do
                pcall(function() v8CopyAppearanceObject(object, character, humanoid) end)
            end

            local faceTexture
            for _, object in ipairs(appearanceModel:GetDescendants()) do
                if object:IsA("Decal") and (object.Name == "face" or object.Name == "Face") then
                    faceTexture = object.Texture
                end
            end

            if targetHead then
                local face = Instance.new("Decal")
                face.Name = "face"
                face.Face = Enum.NormalId.Front
                face.Texture = faceTexture or "rbxasset://textures/face.png"
                face.Parent = targetHead
            end

            if descriptionOK and description then
                pcall(function() humanoid:ApplyDescription(description) end)
            end

            appearanceModel:Destroy()
        end

        Callbacks.AvatarSteal = function(text)
            local targetName = text:gsub("^%s*(.-)%s*$", "%1")
            if targetName == "" then return end

            local character = getCharacter()
            if not character then
                character = LocalPlayer.CharacterAdded:Wait()
            end

            pcall(function()
                local userId = Players:GetUserIdFromNameAsync(targetName)
                if userId then
                    v8CopyAvatar(userId, character)
                end
            end)
        end

        -- FLING
        local flingTask

        Callbacks.Fling = function(enabled)
            local character = getCharacter()

            if not enabled then
                _G.CrashBallsActive = false
                if character then
                    local rootPart = character:FindFirstChild("HumanoidRootPart")
                    if rootPart then
                        local spinner = rootPart:FindFirstChild("FlingSpinner")
                        if spinner then spinner:Destroy() end
                    end
                    for _, part in ipairs(character:GetDescendants()) do
                        if part:IsA("BasePart") then
                            part.Massless = false
                            part.CanCollide = true
                        end
                    end
                end
                return
            end

            if not character then return end
            local rootPart = character:FindFirstChild("HumanoidRootPart")
            if not rootPart then return end

            for _, part in ipairs(character:GetDescendants()) do
                if part:IsA("BasePart") then
                    part.CustomPhysicalProperties = PhysicalProperties.new(100, 0.3, 0.5)
                    part.Massless = true
                    part.Velocity = Vector3.zero
                end
            end

            local spinner = rootPart:FindFirstChild("FlingSpinner")
            if not spinner then
                spinner = Instance.new("BodyAngularVelocity")
            end
            spinner.Name = "FlingSpinner"
            spinner.Parent = rootPart
            spinner.MaxTorque = Vector3.new(0, math.huge, 0)
            spinner.P = 1250000

            flingTask = task.spawn(function()
                while _G.CrashBallsActive and spinner.Parent do
                    for _, part in ipairs(character:GetDescendants()) do
                        if part:IsA("BasePart") then
                            part.CanCollide = false
                        end
                    end
                    spinner.AngularVelocity = Vector3.new(0, 150000, 0)
                    task.wait(0.2)
                    spinner.AngularVelocity = Vector3.new(0, 0, 0)
                    task.wait(0.1)
                end

                if spinner.Parent then spinner:Destroy() end
                if character and character.Parent then
                    for _, part in ipairs(character:GetDescendants()) do
                        if part:IsA("BasePart") then
                            part.Massless = false
                            part.CanCollide = true
                        end
                    end
                end            end)
        end

        return Callbacks
    end

    -- ============================================================
    -- LOAD HUB
    -- ============================================================
    local function LoadVxnityHub()
        VxnityUI:Notify({
            Title = "7zkHub",
            Desc = "Loading main script...",
            Duration = 2
        })

        local isMobile = UserInputService.TouchEnabled
        local windowSize = isMobile and UDim2.fromOffset(480, 380) or UDim2.fromOffset(600, 520)
        local topbarHeight = isMobile and 40 or 48
        local iconSize = isMobile and 18 or 22

        local Window = VxnityUI:CreateWindow({
            Title = "7zkHub",
            Author = "7zk",
            Folder = "7zkHub",
            IconSize = iconSize,
            NewElements = true,
            Size = windowSize,
            HideSearchBar = false,
            OpenButton = {
                Title = "7zk",
                CornerRadius = UDim.new(0, 8),
                StrokeThickness = 2,
                Enabled = true,
                Draggable = true,
                OnlyMobile = false,
                Scale = 1,
                Color = ColorSequence.new(Color3.fromRGB(200, 20, 20), Color3.fromRGB(140, 5, 5))
            },
            Topbar = {
                Height = topbarHeight,
                ButtonsType = "Mac",
            },
        })

        local Callbacks = __BuildCallbacks()

        local HomeSection = Window:Section({ Title = "Information" })
        local HomeTab = HomeSection:Tab({ Title = "Home", Icon = "home" })

        HomeTab:Section({ Title = "Welcome to 7zkHub" })
        HomeTab:Paragraph({ Title = "Script Version: 2.0", Desc = "Stable build for TPS Street Soccer" })
        HomeTab:Paragraph({ Title = "User: " .. LocalPlayer.Name, Desc = "Rank: Premium User" })
        HomeTab:Section({ Title = "Updates" })
        HomeTab:Paragraph({
            Title = "Latest Update: 2026-02-01",
            Desc = "- All features integrated\n- Optimized UI\n- Fixed Loader issues"
        })

        local Main = Window:Section({ Title = "Main" })
        local ReachTab = Main:Tab({ Title = "Reach", Icon = "target" })
        local ReactTab = Main:Tab({ Title = "Reacts", Icon = "zap" })

        -- REACH TAB
        ReachTab:Section({ Title = "Leg Reach" })

        ReachTab:Toggle({
            Title = "Active FireTouchInterest",
            Desc = "Triggers ball contact automatically",
            Callback = function(Value)
                if Value then
                    Callbacks.SetReachSize("1")
                else
                    if getgenv().DisableReach then getgenv().DisableReach() end
                end
            end
        })

        ReachTab:Slider({
            Title = "Reach Distance",
            Desc = "Adjust the activation range",
            Value = { Min = 1, Max = 15, Default = 1 },
            Callback = function(val)
                Callbacks.SetReachSize(tostring(val))
            end
        })

        ReachTab:Section({ Title = "Leg Reach (Config)" })

        ReachTab:Input({
            Title = "Leg Hitbox (R6)",
            Desc = "Modifies physical size of legs",
            Value = "1",
            Callback = function(Value)
                local v = tonumber(Value) or 1
                local char = LocalPlayer.Character
                if char then
                    if char:FindFirstChild("Right Leg") then
                        char["Right Leg"].Size = Vector3.new(v, 2, v)
                        char["Left Leg"].Size = Vector3.new(v, 2, v)
                        char["Right Leg"].CanCollide = false
                        char["Left Leg"].CanCollide = false
                    end
                    if char:FindFirstChild("HumanoidRootPart") then
                        char.HumanoidRootPart.Size = Vector3.new(v, 2, v)
                        char.HumanoidRootPart.CanCollide = false
                    end
                end
            end
        })

        ReachTab:Input({
            Title = "Legs Size (R15)",
            Desc = "Minimum Size is 1",
            Value = "1",
            Callback = function(Value)
                local v = tonumber(Value) or 1
                local char = LocalPlayer.Character
                if char then
                    if char:FindFirstChild("RightLowerLeg") then
                        char["RightLowerLeg"].Size = Vector3.new(v, 2, v)
                        char["LeftLowerLeg"].Size = Vector3.new(v, 2, v)
                        char["RightLowerLeg"].CanCollide = false
                        char["LeftLowerLeg"].CanCollide = false
                    end
                    if char:FindFirstChild("HumanoidRootPart") then
                        char.HumanoidRootPart.Size = Vector3.new(v, 2, v)
                        char.HumanoidRootPart.CanCollide = false
                    end
                end
            end
        })

        ReachTab:Button({
            Title = "Fake legs (Appear Normal)",
            Callback = function()
                local char = LocalPlayer.Character
                if not char then return end
                local humanoid = char:FindFirstChildOfClass("Humanoid")
                if not humanoid then return end
                if humanoid.RigType == Enum.HumanoidRigType.R6 then
                    if char:FindFirstChild("Right Leg") then
                        char["Right Leg"].Transparency = 1
                        char["Left Leg"].Transparency = 1
                        char["Left Leg"].Massless = true
                        local LeftLegM = Instance.new("Part", char)
                        LeftLegM.Name = "Left Leg Fake"
                        LeftLegM.CanCollide = false
                        LeftLegM.Color = char["Left Leg"].Color
                        LeftLegM.Size = Vector3.new(1, 2, 1)
                        LeftLegM.Position = char["Left Leg"].Position
                        local MotorHip = Instance.new("Motor6D", char.Torso)
                        MotorHip.Part0 = char.Torso
                        MotorHip.Part1 = LeftLegM
                        MotorHip.C0 = CFrame.new(-1, -1, 0, 0, 0, -1, 0, 1, 0, 1, 0, 0)
                        MotorHip.C1 = CFrame.new(-0.5, 1, 0, 0, 0, -1, 0, 1, 0, 1, 0, 0)
                        char["Right Leg"].Massless = true
                        local RightLegM = Instance.new("Part", char)
                        RightLegM.Name = "Right Leg Fake"
                        RightLegM.CanCollide = false
                        RightLegM.Color = char["Right Leg"].Color
                        RightLegM.Size = Vector3.new(1, 2, 1)
                        RightLegM.Position = char["Right Leg"].Position
                        local MotorHip2 = Instance.new("Motor6D", char.Torso)
                        MotorHip2.Part0 = char.Torso
                        MotorHip2.Part1 = RightLegM
                        MotorHip2.C0 = CFrame.new(1, -1, 0, 0, 0, 1, 0, 1, -0, -1, 0, 0)
                        MotorHip2.C1 = CFrame.new(0.5, 1, 0, 0, 0, 1, 0, 1, -0, -1, 0, 0)
                    end
                end
            end
        })

        -- REACT TAB
        ReactTab:Section({ Title = "⚡ Reacts" })

        ReactTab:Button({
            Title = "🔥 ULTRA SPEED",
            Desc = "Maximum illegal speed",
            Callback = function()
                Callbacks.ReactAlz()
                VxnityUI:Notify({ Title = "ULTRA SPEED", Desc = "Ball at maximum speed!", Duration = 2 })
            end
        })

        ReactTab:Button({
            Title = "💀 MEGA POWER",
            Desc = "Extreme power",
            Callback = function()
                Callbacks.ReactAbz()
                VxnityUI:Notify({ Title = "MEGA POWER", Desc = "Extreme power activated", Duration = 2 })
            end
        })

        ReactTab:Button({
            Title = "⚡ HYPER VELOCITY",
            Desc = "Instant hyper velocity",
            Callback = function()
                Callbacks.ReactTmbuzzz()
                VxnityUI:Notify({ Title = "HYPER", Desc = "Hyper maximum velocity", Duration = 2 })
            end
        })

        ReactTab:Button({
            Title = "🚀 ULTIMATE KICK",
            Desc = "Definitive kick",
            Callback = function()
                Callbacks.ReactZank()
                VxnityUI:Notify({ Title = "ULTIMATE", Desc = "Definitive kick", Duration = 2 })
            end
        })

        ReactTab:Button({
            Title = "💥 MAX POWER",
            Desc = "Absolute maximum power",
            Callback = function()
                Callbacks.ReactAttack()
                VxnityUI:Notify({ Title = "MAX POWER", Desc = "Absolute maximum power", Duration = 2 })
            end
        })

        ReactTab:Section({ Title = "🎚️ Ball Speed Control" })
        ReactTab:Slider({
            Title = "Ball Velocity",
            Desc = "Control ball speed",
            Value = { Min = 0, Max = 100, Default = 85 },
            Callback = function(val)
                Callbacks.BallVelocity(val)
            end
        })

        ReactTab:Section({ Title = "Action Reacts" })
        ReactTab:Button({ Title = "Dribble React", Callback = Callbacks.ReactDribble })
        ReactTab:Button({ Title = "Kick React", Callback = Callbacks.ReactKick })
        ReactTab:Button({ Title = "Shoot React", Callback = Callbacks.ReactShoot })
        ReactTab:Button({ Title = "Flick React", Callback = Callbacks.ReactFlick })
        ReactTab:Button({ Title = "Attack React", Callback = Callbacks.ReactAttack })
        ReactTab:Button({ Title = "GoalKeeper React", Callback = Callbacks.ReactGoalkeeper })
        ReactTab:Button({ Title = "MidField React", Callback = Callbacks.ReactMidfield })

        -- HELPERS TAB
        local MiscSection = Window:Section({ Title = "Helpers" })
        local HelpersTab = MiscSection:Tab({ Title = "Helpers", Icon = "shield-check" })

        HelpersTab:Toggle({
            Title = "ZZZZ helper",
            Desc = "Highlights the ball's position",
            Callback = Callbacks.ZZZZHelper
        })

        HelpersTab:Toggle({
            Title = "Air Dribble Helper",
            Desc = "Create platform under ball",
            Callback = Callbacks.AirDribbleToggle
        })

        HelpersTab:Input({
            Title = "Air Dribble Size",
            Desc = "Size of the platform",
            Value = "9",
            Callback = Callbacks.AirDribbleSize
        })

        HelpersTab:Input({
            Title = "Air Dribble Transparency",
            Desc = "Transparency of platform",
            Value = "1",
            Callback = Callbacks.AirDribbleTransparency
        })

        HelpersTab:Toggle({
            Title = "Moss React [bxw] 25%",
            Callback = Callbacks.MossBxw
        })

        HelpersTab:Toggle({
            Title = "Moss React [Mateo] 15%",
            Callback = Callbacks.MossZy81o
        })

        HelpersTab:Toggle({
            Title = "Ball Prediction",
            Callback = Callbacks.BallPrediction
        })

        HelpersTab:Toggle({
            Title = "Impact Distance",
            Callback = Callbacks.ImpactDistance
        })

        HelpersTab:Toggle({
            Title = "Ball Stats",
            Callback = Callbacks.BallStats
        })

        HelpersTab:Button({
            Title = "Auto Inf Fast Mobile",
            Callback = Callbacks.AutoInfMobile
        })

        HelpersTab:Button({
            Title = "Auto Inf Fast PC Keyboard: [C]",
            Callback = Callbacks.AutoInfPC
        })

        -- OPTIMIZATIONS
        local OptSection = Window:Section({ Title = "Optimizations" })
        local OptTab = OptSection:Tab({ Title = "Performance", Icon = "settings" })

        OptTab:Button({ Title = "Ping Reducer", Callback = Callbacks.PingReducer })
        OptTab:Button({ Title = "FFlagDarkAbyss", Callback = Callbacks.DarkAbyss })

        OptTab:Toggle({
            Title = "FFlagOverrideTexture",
            Callback = Callbacks.OverrideTexture
        })

        OptTab:Toggle({
            Title = "Disable Player Shadows",
            Callback = Callbacks.DisablePlayerShadows
        })

        OptTab:Toggle({
            Title = "Disable Post-FX",
            Callback = Callbacks.DisablePostFX
        })

        OptTab:Button({ Title = "Aurora Sky", Callback = Callbacks.AuroraSky })
        OptTab:Button({ Title = "Full Night Sky", Callback = Callbacks.FullNightSky })
        OptTab:Button({ Title = "Sakura Pink Sky", Callback = Callbacks.SakuraPinkSky })

        -- PLAYERS
        local PlayerSection = Window:Section({ Title = "Players" })
        local PlayerTab = PlayerSection:Tab({ Title = "Players", Icon = "user" })

        PlayerTab:Slider({
            Title = "WalkSpeed",
            Value = { Min = 22, Max = 27, Default = 22 },
            Callback = Callbacks.SetWalkSpeed
        })

        PlayerTab:Input({
            Title = "Clumsy (Ping)",
            Desc = "Increase ping value",
            Value = "0.09",
            Callback = Callbacks.SetClumsy
        })

        PlayerTab:Input({
            Title = "Avatar Steal",
            Desc = "Enter username to copy avatar",
            Value = "",
            Callback = Callbacks.AvatarSteal
        })

        PlayerTab:Toggle({
            Title = "Fling",
            Desc = "Fling players/ball (BETA)",
            Callback = Callbacks.Fling
        })

        -- SERVER
        local ServerSection = Window:Section({ Title = "Server" })
        local ServerTab = ServerSection:Tab({ Title = "Server", Icon = "server" })

        ServerTab:Button({ Title = "Hop Server (New)", Callback = function() Callbacks.HopServer("Asc") end })
        ServerTab:Button({ Title = "Hop Server (Old)", Callback = function() Callbacks.HopServer("Desc") end })
        ServerTab:Button({ Title = "Rejoin Server", Callback = Callbacks.RejoinServer })
        ServerTab:Button({ Title = "Copy JobId", Callback = Callbacks.CopyJobId })

        ServerTab:Input({
            Title = "Join Server by JobId",
            Desc = "Paste JobId and press enter",
            Value = "",
            Callback = Callbacks.JoinJobId
        })

        -- FARM
        local FarmSection = Window:Section({ Title = "Auto-Farm" })
        local FarmTab = FarmSection:Tab({ Title = "Farm", Icon = "zap" })

        FarmTab:Toggle({
            Title = "Auto Farm Powers",
            Callback = Callbacks.FarmPowers
        })

        FarmTab:Toggle({
            Title = "Auto Farm Goals [5X Better]",
            Callback = Callbacks.FarmGoals
        })

        -- SETTINGS / CONFIGS
        local ConfigSection = Window:Section({ Title = "Configs" })
        local ConfigTab = ConfigSection:Tab({ Title = "Configs", Icon = "settings" })

        ConfigTab:Button({ Title = "Best Config Reach GK", Callback = Callbacks.ReachConfigGoalkeeper })
        ConfigTab:Button({ Title = "Best Config Reach Attack", Callback = Callbacks.ReachConfigAttack })
        ConfigTab:Button({ Title = "Restore Legs", Callback = Callbacks.RestoreLegs })

        VxnityUI:Notify({
            Title = "7zkHub",
            Desc = "Welcome back! Script loaded successfully.",
            Duration = 4
        })
    end

    -- ============================================================
    -- EXECUTION ENTRY POINT
    -- ============================================================
    ShowSystemLoader(function()
        task.wait(0.1)
        LoadVxnityHub()
    end)
end

-- ============================================================
-- START
-- ============================================================
BuildPatriotKeySystem(Build7zkHub)
