--[[
    7zkHub - TPS Street Soccer Script
    UI: Shard Hub (deobfuscated.lua)
    Key System: Patriot (clave: 7zk)
    Métodos: yo.lua (Reach, Reacts, Air Helper, Moss, etc.)
]]

-- ══════════════════════════════════════════════
--  KEY SYSTEM (Patriot - clave: 7zk)
-- ══════════════════════════════════════════════
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

-- ══════════════════════════════════════════════
--  SHARD HUB UI (deobfuscated.lua)
-- ══════════════════════════════════════════════
local function Build7zkHub()
    -- ══════════════════════════════════════════════
    --  SERVICES & LOCALS
    -- ══════════════════════════════════════════════
    local Players = game:GetService("Players")
    local RunService = game:GetService("RunService")
    local UserInputService = game:GetService("UserInputService")
    local TweenService = game:GetService("TweenService")
    local CoreGui = game:GetService("CoreGui")
    local Workspace = game:GetService("Workspace")
    local Lighting = game:GetService("Lighting")
    local lp = Players.LocalPlayer
    local fti = firetouchinterest
    local abs = math.abs
    local clamp = math.clamp
    local sqrt = math.sqrt
    local clock = os.clock
    local V3 = Vector3.new

    -- ══════════════════════════════════════════════
    --  CARGA DE LA UI (Shard Hub)
    -- ══════════════════════════════════════════════
    local ShardUI = loadstring(game:HttpGet("https://raw.githubusercontent.com/Footagesus/WindUI/main/dist/main.lua"))()
    
    -- ══════════════════════════════════════════════
    --  WINDOW
    -- ══════════════════════════════════════════════
    local Window = ShardUI:CreateWindow({
        Title = "7zkHub",
        Icon = "zap",
        Author = "7zk",
        Folder = "7zkHub",
        Size = UDim2.fromOffset(580, 430),
        Transparent = true,
        Theme = "Dark",
        SideBarWidth = 190,
        HideSearchBar = true,
        NewElements = true,
        OpenButton = {
            Enabled = true,
            Title = "7zkHub",
            Draggable = true,
            OnlyMobile = false,
            CornerRadius = UDim.new(0, 14),
            StrokeThickness = 2
        }
    })

    -- ══════════════════════════════════════════════
    --  SECCIONES Y TABS
    -- ══════════════════════════════════════════════
    local SecHome = Window:Section({ Title = "HOME", Opened = true })
    local SecReach = Window:Section({ Title = "REACH", Opened = true })
    local SecReact = Window:Section({ Title = "REACT", Opened = true })
    local SecHelpers = Window:Section({ Title = "HELPERS", Opened = true })
    local SecExtras = Window:Section({ Title = "EXTRAS", Opened = true })

    local TabHome = SecHome:Tab({ Title = "Home", Icon = "home" })
    local TabReach = SecReach:Tab({ Title = "Reach", Icon = "target" })
    local TabReact = SecReact:Tab({ Title = "React", Icon = "zap" })
    local TabHelpers = SecHelpers:Tab({ Title = "Helpers", Icon = "shield" })
    local TabExtras = SecExtras:Tab({ Title = "Extras", Icon = "settings" })

    -- ══════════════════════════════════════════════
    --  TAB: HOME
    -- ══════════════════════════════════════════════
    TabHome:Section({ Title = "7zkHub" })
    TabHome:Paragraph({ Title = "Made by", Desc = "7zk Team" })
    TabHome:Paragraph({ Title = "Discord", Desc = "discord.gg/7zkHub" })
    TabHome:Paragraph({ Title = "Changelog", Desc = "• All features from yo.lua\n• Reach, Reacts, Air Helper, Moss, etc.\n• UI from Shard Hub" })

    -- ══════════════════════════════════════════════
    --  MÉTODOS DE YO.LUA (Callbacks)
    -- ══════════════════════════════════════════════
    local function __BuildCallbacks()
        local Callbacks = {}

        -- ─── Helpers ──────────────────────────────────
        local function getTPSBall()
            local tpsSystem = Workspace:FindFirstChild("TPSSystem")
            if not tpsSystem then return nil end
            return tpsSystem:FindFirstChild("TPS")
        end

        local function getCharacter()
            local character = lp.Character
            if not character or not character.Parent then return nil end
            return character
        end

        local function getPreferredFoot()
            local folder = Lighting:FindFirstChild(lp.Name)
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
            if not fti then return false end
            fti(kickPart, tpsBall, 0)
            fti(kickPart, tpsBall, 1)
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

        -- ─── REACTS ──────────────────────────────────
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

        -- ─── REACH ──────────────────────────────────
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
            size = clamp(size, 0.1, 100)

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

        -- ─── LEG REACH ──────────────────────────────
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

        lp.CharacterAdded:Connect(function(character)
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

        -- ─── AIR DRIBBLE ─────────────────────────────
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

        -- ─── MOSS ────────────────────────────────────
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

                local now = clock()
                if now - mossLastFire < 0.15 then return end
                mossLastFire = now

                local feFolder = Workspace:FindFirstChild("FE")
                local system = feFolder and feFolder:FindFirstChild("System")
                local remote = system and system:FindFirstChild("Header")

                if remote then
                    pcall(function()
                        remote:FireServer(lp.UserId, ball, "Rock'n'roll Star", "NeverFearTruth", "power=95/100")
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

        -- ─── ZZZZ ────────────────────────────────────
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

        -- ─── BALL PREDICTION ─────────────────────────
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

        -- ─── IMPACT DISTANCE ─────────────────────────
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

        -- ─── AUTO INF ────────────────────────────────
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

        -- ─── Mobile Auto Inf ─────────────────────────
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

        -- ─── AVATAR STEAL ────────────────────────────
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
                character = lp.CharacterAdded:Wait()
            end

            pcall(function()
                local userId = Players:GetUserIdFromNameAsync(targetName)
                if userId then
                    v8CopyAvatar(userId, character)
                end
            end)
        end

        -- ─── FLING ───────────────────────────────────
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
                end
            end)
        end

        -- ─── PING REDUCER ────────────────────────────
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

        -- ─── DARK ABYSS ──────────────────────────────
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

        -- ─── OVERRIDE TEXTURE ────────────────────────
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

        -- ─── DISABLE PLAYER SHADOWS ──────────────────
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

        -- ─── DISABLE POST FX ─────────────────────────
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

        -- ─── SKY CHANGERS ────────────────────────────
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

        return Callbacks
    end

    -- ─── Crear callbacks ────────────────────────────
    local Callbacks = __BuildCallbacks()

    -- ══════════════════════════════════════════════
    --  TAB: REACH
    -- ══════════════════════════════════════════════
    TabReach:Section({ Title = "Ball Reach" })
    TabReach:Toggle({
        Title = "Enable Reach",
        Desc = "Activates ball reach hitbox",
        Value = false,
        Callback = function(v)
            if v then
                Callbacks.SetReachSize("1")
            else
                if getgenv().DisableReach then getgenv().DisableReach() end
            end
        end
    })

    TabReach:Slider({
        Title = "Reach Size",
        Min = 1,
        Max = 50,
        Default = 5,
        Callback = function(v)
            Callbacks.SetReachSize(tostring(v))
        end
    })

    TabReach:Input({
        Title = "Reach Transparency",
        Placeholder = "0=visible, 1=invisible",
        Callback = function(v)
            Callbacks.SetReachTransparency(v)
        end
    })

    TabReach:Dropdown({
        Title = "Reach Color",
        Values = {"Red","Green","Blue","Yellow","Purple","Pink","Cyan","Orange","White","Black"},
        Value = "Red",
        Callback = function(v)
            Callbacks.SetReachColor(v)
        end
    })

    TabReach:Section({ Title = "Leg Reach" })
    TabReach:Input({
        Title = "Leg Reach Range",
        Placeholder = "Enter number (0 to disable)",
        Callback = function(v)
            Callbacks.LegReach(v)
        end
    })

    TabReach:Section({ Title = "Configs" })
    TabReach:Button({
        Title = "Best Config Reach GK",
        Callback = Callbacks.ReachConfigGoalkeeper
    })
    TabReach:Button({
        Title = "Best Config Reach Attack",
        Callback = Callbacks.ReachConfigAttack
    })
    TabReach:Button({
        Title = "Restore Legs",
        Callback = Callbacks.RestoreLegs
    })

    -- ══════════════════════════════════════════════
    --  TAB: REACT
    -- ══════════════════════════════════════════════
    TabReact:Section({ Title = "Reacts" })
    TabReact:Button({ Title = "7zk React", Callback = Callbacks.React97mzu })
    TabReact:Button({ Title = "0_Mauro React", Callback = Callbacks.ReactMauro })
    TabReact:Button({ Title = "Suit React", Callback = Callbacks.ReactSuit })
    TabReact:Button({ Title = "0_lyn React", Callback = Callbacks.ReactLyn })

    TabReact:Section({ Title = "Action Reacts" })
    TabReact:Button({ Title = "Dribble React", Callback = Callbacks.ReactDribble })
    TabReact:Button({ Title = "Kick React", Callback = Callbacks.ReactKick })
    TabReact:Button({ Title = "Shoot React", Callback = Callbacks.ReactShoot })
    TabReact:Button({ Title = "Flick React", Callback = Callbacks.ReactFlick })

    TabReact:Section({ Title = "React OP" })
    TabReact:Button({ Title = "Alz React", Callback = Callbacks.ReactAlz })
    TabReact:Button({ Title = "Abz React", Callback = Callbacks.ReactAbz })
    TabReact:Button({ Title = "zAnk React", Callback = Callbacks.ReactZank })
    TabReact:Button({ Title = "Tmbuzzz React", Callback = Callbacks.ReactTmbuzzz })

    TabReact:Section({ Title = "Ball Control" })
    TabReact:Slider({
        Title = "Ball Velocity",
        Min = 0,
        Max = 100,
        Default = 85,
        Callback = function(v)
            Callbacks.BallVelocity(v)
        end
    })
    TabReact:Button({ Title = "Attack React", Callback = Callbacks.ReactAttack })
    TabReact:Button({ Title = "GoalKeeper React", Callback = Callbacks.ReactGoalkeeper })
    TabReact:Button({ Title = "MidField React", Callback = Callbacks.ReactMidfield })

    -- ══════════════════════════════════════════════
    --  TAB: HELPERS
    -- ══════════════════════════════════════════════
    TabHelpers:Section({ Title = "Helpers" })
    TabHelpers:Toggle({
        Title = "ZZZZ Helper",
        Desc = "Flat invisible part under ball",
        Value = false,
        Callback = Callbacks.ZZZZHelper
    })

    TabHelpers:Section({ Title = "Air Dribble Helper" })
    TabHelpers:Toggle({
        Title = "Enable Air Dribble",
        Desc = "Creates platform under ball",
        Value = false,
        Callback = Callbacks.AirDribbleToggle
    })
    TabHelpers:Input({
        Title = "Air Dribble Size",
        Placeholder = "Size of platform",
        Callback = Callbacks.AirDribbleSize
    })
    TabHelpers:Input({
        Title = "Air Dribble Transparency",
        Placeholder = "0=visible, 1=invisible",
        Callback = Callbacks.AirDribbleTransparency
    })

    TabHelpers:Section({ Title = "Moss React" })
    TabHelpers:Toggle({
        Title = "Moss React [bxw] 25%",
        Value = false,
        Callback = Callbacks.MossBxw
    })
    TabHelpers:Toggle({
        Title = "Moss React [Mateo] 15%",
        Value = false,
        Callback = Callbacks.MossZy81o
    })

    TabHelpers:Section({ Title = "Prediction & Stats" })
    TabHelpers:Toggle({
        Title = "Ball Prediction",
        Desc = "Shows predicted trajectory",
        Value = false,
        Callback = Callbacks.BallPrediction
    })
    TabHelpers:Toggle({
        Title = "Impact Distance",
        Desc = "Shows impact point",
        Value = false,
        Callback = Callbacks.ImpactDistance
    })

    TabHelpers:Section({ Title = "Auto Inf" })
    TabHelpers:Button({
        Title = "Auto Inf Fast Mobile",
        Callback = Callbacks.AutoInfMobile
    })
    TabHelpers:Button({
        Title = "Auto Inf Fast PC Keyboard: [C]",
        Callback = Callbacks.AutoInfPC
    })

    -- ══════════════════════════════════════════════
    --  TAB: EXTRAS
    -- ══════════════════════════════════════════════
    TabExtras:Section({ Title = "Avatar & Visuals" })
    TabExtras:Input({
        Title = "Avatar Steal",
        Placeholder = "Enter username to copy avatar",
        Callback = Callbacks.AvatarSteal
    })

    TabExtras:Section({ Title = "Trolls" })
    TabExtras:Toggle({
        Title = "Fling",
        Desc = "Fling players/ball (BETA)",
        Value = false,
        Callback = Callbacks.Fling
    })

    TabExtras:Section({ Title = "Optimizations" })
    TabExtras:Button({ Title = "Ping Reducer", Callback = Callbacks.PingReducer })
    TabExtras:Button({ Title = "Dark Abyss", Callback = Callbacks.DarkAbyss })
    TabExtras:Toggle({
        Title = "Override Texture",
        Value = false,
        Callback = Callbacks.OverrideTexture
    })
    TabExtras:Toggle({
        Title = "Disable Player Shadows",
        Value = false,
        Callback = Callbacks.DisablePlayerShadows
    })
    TabExtras:Toggle({
        Title = "Disable Post-FX",
        Value = false,
        Callback = Callbacks.DisablePostFX
    })

    TabExtras:Section({ Title = "Sky Changers" })
    TabExtras:Button({ Title = "Aurora Sky", Callback = Callbacks.AuroraSky })
    TabExtras:Button({ Title = "Full Night Sky", Callback = Callbacks.FullNightSky })
    TabExtras:Button({ Title = "Sakura Pink Sky", Callback = Callbacks.SakuraPinkSky })

    -- ══════════════════════════════════════════════
    --  STARTUP NOTIFY
    -- ══════════════════════════════════════════════
    ShardUI:Notify({
        Title = "7zkHub Loaded",
        Content = "Key: 7zk | All features from yo.lua integrated",
        Duration = 5
    })
end

-- ══════════════════════════════════════════════
--  START
-- ══════════════════════════════════════════════
BuildPatriotKeySystem(Build7zkHub)
