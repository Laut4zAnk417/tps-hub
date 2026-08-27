local function BuildRecoveredKeySystem(onAccepted)
    local TweenService = game:GetService("TweenService")
    local CoreGui = game:GetService("CoreGui")
    local Players = game:GetService("Players")
    local LocalPlayer = Players.LocalPlayer
    local thumbnail = Players:GetUserThumbnailAsync(LocalPlayer.UserId, Enum.ThumbnailType.HeadShot, Enum.ThumbnailSize.Size150x150)
    local guiParent = gethui and gethui() or CoreGui

    local function removeNamedChildren(parent)
        if not parent then return end
        for _, child in pairs(parent:GetChildren()) do
            if child.Name == "RiseScriptKeySystem" then child:Destroy() end
        end
    end
    removeNamedChildren(guiParent)
    if guiParent ~= CoreGui then removeNamedChildren(CoreGui) end
    local playerGui = LocalPlayer:FindFirstChild("PlayerGui")
    if playerGui then removeNamedChildren(playerGui) end

    local function tweenObject(object, properties, duration)
        for property, value in pairs(properties) do
            TweenService:Create(object, TweenInfo.new(duration or 0.2, Enum.EasingStyle.Linear), {[property] = value}):Play()
        end
    end

    local ScreenGui = Instance.new("ScreenGui")
    ScreenGui.Name = "RiseScriptKeySystem"
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
    local MainStroke = Instance.new("UIStroke", MainFrame); MainStroke.Color = Color3.fromRGB(40,40,50); MainStroke.Thickness=1
    local MainCorner = Instance.new("UICorner", MainFrame); MainCorner.CornerRadius = UDim.new(0,12)

    local Header = Instance.new("Frame", MainFrame); Header.Name="Header"; Header.Size=UDim2.new(1,0,0,70); Header.BackgroundTransparency=1; Header.ZIndex=5
    local AvatarHolder = Instance.new("Frame", Header); AvatarHolder.Size=UDim2.new(0,50,0,50); AvatarHolder.Position=UDim2.new(0,20,0,15); AvatarHolder.BackgroundColor3=Color3.fromRGB(30,30,35)
    local AvatarCorner = Instance.new("UICorner", AvatarHolder); AvatarCorner.CornerRadius=UDim.new(1,0)
    local AvatarImage = Instance.new("ImageLabel", AvatarHolder); AvatarImage.Size=UDim2.new(1,0,1,0); AvatarImage.Image=thumbnail; AvatarImage.BackgroundTransparency=1; AvatarImage.ScaleType=Enum.ScaleType.Fit
    local AvatarImageCorner = Instance.new("UICorner", AvatarImage); AvatarImageCorner.CornerRadius=UDim.new(1,0)
    local WelcomeText = Instance.new("TextLabel", Header); WelcomeText.Size=UDim2.new(1,-85,1,-15); WelcomeText.Position=UDim2.new(0,85,0,15); WelcomeText.BackgroundTransparency=1; WelcomeText.Text="Welcome, <font color='#ff4a4a'>"..LocalPlayer.DisplayName.."</font>\n<font size='14' color='#888888'>tuputamadre</font>"; WelcomeText.RichText=true; WelcomeText.TextColor3=Color3.fromRGB(255,255,255); WelcomeText.TextSize=20; WelcomeText.Font=Enum.Font.GothamBold; WelcomeText.TextXAlignment=Enum.TextXAlignment.Left
    local InputSection = Instance.new("Frame", MainFrame); InputSection.Size=UDim2.new(1,-40,0,100); InputSection.Position=UDim2.new(0,20,0,80); InputSection.BackgroundTransparency=1; InputSection.ZIndex=5
    local KeyInput = Instance.new("TextBox", InputSection); KeyInput.Size=UDim2.new(1,0,0,42); KeyInput.Position=UDim2.new(0,0,0,0); KeyInput.BackgroundColor3=Color3.fromRGB(26,26,32); KeyInput.PlaceholderText="Enter Key Here . . ."; KeyInput.PlaceholderColor3=Color3.fromRGB(100,100,120); KeyInput.Text=""; KeyInput.TextColor3=Color3.fromRGB(255,255,255); KeyInput.TextSize=14; KeyInput.Font=Enum.Font.Gotham; KeyInput.TextXAlignment=Enum.TextXAlignment.Left; KeyInput.ClearTextOnFocus=false
    local InputPadding = Instance.new("UIPadding", KeyInput); InputPadding.PaddingLeft=UDim.new(0,14)
    local InputCorner = Instance.new("UICorner", KeyInput); InputCorner.CornerRadius=UDim.new(0,8)
    local InputStroke = Instance.new("UIStroke", KeyInput); InputStroke.Color=Color3.fromRGB(45,45,55); InputStroke.Thickness=1
    local GetKeyBtn = Instance.new("TextButton", InputSection); GetKeyBtn.Size=UDim2.new(0.48,0,0,42); GetKeyBtn.Position=UDim2.new(0,0,0,52); GetKeyBtn.BackgroundColor3=Color3.fromRGB(255,60,60); GetKeyBtn.Text="Get Key"; GetKeyBtn.TextColor3=Color3.fromRGB(255,255,255); GetKeyBtn.TextSize=14; GetKeyBtn.Font=Enum.Font.GothamBold; GetKeyBtn.AutoButtonColor=false
    local GetKeyCorner = Instance.new("UICorner", GetKeyBtn); GetKeyCorner.CornerRadius=UDim.new(0,8)
    local CheckKeyBtn = Instance.new("TextButton", InputSection); CheckKeyBtn.Size=UDim2.new(0.48,0,0,42); CheckKeyBtn.Position=UDim2.new(0.52,0,0,52); CheckKeyBtn.BackgroundColor3=Color3.fromRGB(32,32,40); CheckKeyBtn.Text="Check Key"; CheckKeyBtn.TextColor3=Color3.fromRGB(255,255,255); CheckKeyBtn.TextSize=14; CheckKeyBtn.Font=Enum.Font.GothamBold; CheckKeyBtn.AutoButtonColor=false
    local CheckKeyCorner = Instance.new("UICorner", CheckKeyBtn); CheckKeyCorner.CornerRadius=UDim.new(0,8)
    local CheckKeyStroke = Instance.new("UIStroke", CheckKeyBtn); CheckKeyStroke.Color=Color3.fromRGB(50,50,65); CheckKeyStroke.Thickness=1
    local Footer = Instance.new("TextLabel", MainFrame); Footer.Size=UDim2.new(1,0,0,25); Footer.Position=UDim2.new(0,0,1,-30); Footer.BackgroundTransparency=1; Footer.Text="Need <font color='#ff4a4a'>support</font>? Join our Discord!"; Footer.RichText=true; Footer.TextColor3=Color3.fromRGB(140,140,160); Footer.TextSize=12; Footer.Font=Enum.Font.Gotham; Footer.ZIndex=5
    local StatusLabel = Instance.new("TextLabel", MainFrame); StatusLabel.Size=UDim2.new(1,0,0,20); StatusLabel.Position=UDim2.new(0,0,0,185); StatusLabel.BackgroundTransparency=1; StatusLabel.Text=""; StatusLabel.TextSize=13; StatusLabel.Font=Enum.Font.GothamMedium; StatusLabel.TextTransparency=1; StatusLabel.ZIndex=5

    GetKeyBtn.MouseEnter:Connect(function() tweenObject(GetKeyBtn, {BackgroundColor3 = Color3.fromRGB(230,45,45)},0.1) end)
    GetKeyBtn.MouseLeave:Connect(function() tweenObject(GetKeyBtn, {BackgroundColor3 = Color3.fromRGB(255,60,60)},0.1) end)
    CheckKeyBtn.MouseEnter:Connect(function() tweenObject(CheckKeyBtn, {BackgroundColor3 = Color3.fromRGB(42,42,52)},0.1) end)
    CheckKeyBtn.MouseLeave:Connect(function() tweenObject(CheckKeyBtn, {BackgroundColor3 = Color3.fromRGB(32,32,40)},0.1) end)

    GetKeyBtn.MouseButton1Click:Connect(function()
        if setclipboard then
            setclipboard("https://discord.gg/HENwv7w2C")
            StatusLabel.Text = "Discord Link Copied!"
            StatusLabel.TextColor3 = Color3.fromRGB(100,255,120)
            StatusLabel.TextTransparency = 0
            task.wait(2)
            tweenObject(StatusLabel, {TextTransparency = 1}, 0.5)
        end
    end)

    CheckKeyBtn.MouseButton1Click:Connect(function()
        if KeyInput.Text == "higepro" then
            StatusLabel.Text = "Successfully!"
            StatusLabel.TextColor3 = Color3.fromRGB(100,255,120)
            StatusLabel.TextTransparency = 0.3
            task.wait(1.2)
            ScreenGui:Destroy()
            if not LocalPlayer.Character then LocalPlayer.CharacterAdded:Wait() end
            onAccepted()
            return
        end
        StatusLabel.Text = "Invalid Key!"
        StatusLabel.TextColor3 = Color3.fromRGB(255,100,100)
        StatusLabel.TextTransparency = 0.2
        task.wait(2)
        tweenObject(StatusLabel, {TextTransparency = 1}, 0.5)
    end)

    return ScreenGui
end

local function BuildRecoveredMainHub()
    -- === SERVICES ===
    local Players = game:GetService("Players")
    local TweenService = game:GetService("TweenService")
    local UserInputService = game:GetService("UserInputService")
    local CoreGui = game:GetService("CoreGui")
    local RunService = game:GetService("RunService")
    local MarketplaceService = game:GetService("MarketplaceService")
    local Lighting = game:GetService("Lighting")
    local LocalPlayer = Players.LocalPlayer
    local PlayerGui = LocalPlayer:WaitForChild("PlayerGui")
    local lp = LocalPlayer
    local Camera = workspace.CurrentCamera
    local fti = firetouchinterest
    local abs = math.abs
    local clamp = math.clamp
    local sqrt = math.sqrt
    local clock = os.clock
    local V3 = Vector3.new
    local V3zero = Vector3.zero

    -- === EXECUTOR DETECTION ===
    local _execName = "unknown"
    pcall(function()
        if identifyexecutor then _execName = identifyexecutor():lower()
        elseif getexecutorname then _execName = getexecutorname():lower() end
    end)
    local _isXenoOrSolara = (_execName:find("xeno") or _execName:find("solara")) or (typeof(XENO) ~= "nil") or (typeof(SYN) ~= "nil" and typeof(SYN.request) ~= "nil" and _execName:find("solara")) or false
    _isXenoOrSolara = _isXenoOrSolara == true

    -- === THEME ===
    local Theme = {
        Background = Color3.fromRGB(24,24,24),
        Sidebar = Color3.fromRGB(18,18,18),
        CardBG = Color3.fromRGB(32,32,32),
        CardStroke = Color3.fromRGB(45,45,45),
        Accent = Color3.fromRGB(0,230,138),
        TextWhite = Color3.fromRGB(255,255,255),
        TextMuted = Color3.fromRGB(120,120,125),
        RedText = Color3.fromRGB(255,75,75),
        Font = Enum.Font.GothamBold,
    }

    local function addCorner(parent, radius) local c=Instance.new("UICorner",parent); c.CornerRadius=UDim.new(0,radius); return c end
    local function addStroke(parent, color, thickness) local s=Instance.new("UIStroke",parent); s.Color=color; if thickness then s.Thickness=thickness end; return s end

    local function destroyOldHub()
        local oldHub = CoreGui:FindFirstChild("97mzuHubUI"); if oldHub then oldHub:Destroy() end
        local oldToggle = CoreGui:FindFirstChild("97mzuToggleButton"); if oldToggle then oldToggle:Destroy() end
    end
    pcall(destroyOldHub)
    local oldPlayerGuiHub = PlayerGui:FindFirstChild("97mzuHubUI"); if oldPlayerGuiHub then oldPlayerGuiHub:Destroy() end

    local HubGui = Instance.new("ScreenGui"); HubGui.Name="97mzuHubUI"; HubGui.ResetOnSpawn=false
    local coreGuiParentWorked = pcall(function() HubGui.Parent=CoreGui end)
    if not coreGuiParentWorked then HubGui.Parent=PlayerGui end

    local MainFrame = Instance.new("Frame", HubGui); MainFrame.Size=UDim2.new(0,580,0,380); MainFrame.Position=UDim2.new(0.5,-290,0.5,-190); MainFrame.BackgroundColor3=Theme.Background; MainFrame.BorderSizePixel=0; MainFrame.ClipsDescendants=true

    -- Toggle Button
    local ToggleGui = Instance.new("ScreenGui", coreGuiParentWorked and CoreGui or PlayerGui); ToggleGui.Name="97mzuToggleButton"; ToggleGui.ResetOnSpawn=false
    local ToggleButton = Instance.new("TextButton", ToggleGui); ToggleButton.Size=UDim2.fromOffset(45,46); ToggleButton.Position=UDim2.new(0,20,0.5,-20); ToggleButton.BackgroundColor3=Color3.fromRGB(25,25,25); ToggleButton.BackgroundTransparency=1; ToggleButton.Text=""; ToggleButton.TextColor3=Theme.TextWhite; ToggleButton.Font=Enum.Font.GothamBold; ToggleButton.TextSize=15; ToggleButton.ZIndex=2; addCorner(ToggleButton,45)
    local ToggleImage = Instance.new("ImageLabel", ToggleButton); ToggleImage.Size=UDim2.fromScale(1,1); ToggleImage.BackgroundTransparency=1; ToggleImage.Image="rbxassetid://137299848204352"; ToggleImage.ZIndex=1; addCorner(ToggleImage,45)
    ToggleButton.MouseButton1Click:Connect(function() MainFrame.Visible = not MainFrame.Visible end)

    -- Dragging for toggle
    do
        local dragging=false; local dragStart; local startPosition
        ToggleButton.InputBegan:Connect(function(input)
            if input.UserInputType==Enum.UserInputType.MouseButton1 or input.UserInputType==Enum.UserInputType.Touch then
                dragging=true; dragStart=input.Position; startPosition=ToggleButton.Position
            end
        end)
        ToggleButton.InputEnded:Connect(function(input)
            if input.UserInputType==Enum.UserInputType.MouseButton1 or input.UserInputType==Enum.UserInputType.Touch then dragging=false end
        end)
        UserInputService.InputChanged:Connect(function(input)
            if not dragging then return end
            if input.UserInputType~=Enum.UserInputType.MouseMovement and input.UserInputType~=Enum.UserInputType.Touch then return end
            local delta=input.Position-dragStart
            ToggleButton.Position=UDim2.new(startPosition.X.Scale, startPosition.X.Offset+delta.X, startPosition.Y.Scale, startPosition.Y.Offset+delta.Y)
        end)
    end

    -- TopBar + dragging
    local TopBar = Instance.new("Frame", MainFrame); TopBar.Size=UDim2.new(1,0,0,36); TopBar.BackgroundColor3=Theme.Background; TopBar.BorderSizePixel=0
    do
        local dragging=false; local dragStart; local startPosition; local dragInput
        TopBar.InputBegan:Connect(function(input)
            if input.UserInputType==Enum.UserInputType.MouseButton1 or input.UserInputType==Enum.UserInputType.Touch then
                dragging=true; dragStart=input.Position; startPosition=MainFrame.Position
            end
        end)
        TopBar.InputEnded:Connect(function(input)
            if input.UserInputType==Enum.UserInputType.MouseButton1 or input.UserInputType==Enum.UserInputType.Touch then dragging=false end
        end)
        UserInputService.InputChanged:Connect(function(input)
            if input.UserInputType==Enum.UserInputType.MouseMovement or input.UserInputType==Enum.UserInputType.Touch then dragInput=input end
        end)
        RunService.RenderStepped:Connect(function()
            if not dragging or not dragInput or not dragStart or not startPosition then return end
            local delta=dragInput.Position-dragStart
            MainFrame.Position=UDim2.new(startPosition.X.Scale, startPosition.X.Offset+delta.X, startPosition.Y.Scale, startPosition.Y.Offset+delta.Y)
        end)
    end

    local Logo = Instance.new("ImageLabel", TopBar); Logo.Size=UDim2.new(0,25,0,25); Logo.Position=UDim2.new(0,10,0.5,-11); Logo.BackgroundTransparency=1; Logo.Image="rbxassetid://137299848204352"; addCorner(Logo,5)
    local HubTitle = Instance.new("TextLabel", TopBar); HubTitle.Size=UDim2.new(0,150,1,0); HubTitle.Position=UDim2.new(0,40,0,0); HubTitle.BackgroundTransparency=1; HubTitle.Text="CRACKED TPS"; HubTitle.TextColor3=Theme.TextWhite; HubTitle.Font=Enum.Font.GothamBold; HubTitle.TextSize=16; HubTitle.TextXAlignment=Enum.TextXAlignment.Left
    local CloseButton = Instance.new("TextButton", TopBar); CloseButton.Size=UDim2.new(0,24,0,24); CloseButton.Position=UDim2.new(1,-30,0.5,-12); CloseButton.BackgroundColor3=Color3.fromRGB(35,35,35); CloseButton.BackgroundTransparency=1; CloseButton.Text="X"; CloseButton.TextColor3=Theme.TextWhite; CloseButton.Font=Enum.Font.GothamBold; CloseButton.TextSize=12; addCorner(CloseButton,6)
    CloseButton.MouseButton1Click:Connect(function() if ToggleGui then ToggleGui:Destroy() end; HubGui:Destroy() end)

    -- PageList (Tabs)
    local PageList = Instance.new("ScrollingFrame", MainFrame); PageList.Size=UDim2.new(0,150,1,-86); PageList.Position=UDim2.new(0,0,0,36); PageList.BackgroundColor3=Theme.Sidebar; PageList.BorderSizePixel=0; PageList.ScrollBarThickness=2; PageList.ScrollBarImageColor3=Theme.Accent; PageList.CanvasSize=UDim2.new(0,0,0,0); PageList.AutomaticCanvasSize=Enum.AutomaticSize.Y; PageList.Visible=false
    local pageListLayout=Instance.new("UIListLayout", PageList); pageListLayout.Padding=UDim.new(0,2); pageListLayout.SortOrder=Enum.SortOrder.LayoutOrder
    local pageListPadding=Instance.new("UIPadding", PageList); pageListPadding.PaddingTop=UDim.new(0,6); pageListPadding.PaddingRight=UDim.new(0,4)

    local PagesContainer = Instance.new("Frame", MainFrame); PagesContainer.Size=UDim2.new(1,-150,1,-86); PagesContainer.Position=UDim2.new(0,150,0,36); PagesContainer.BackgroundTransparency=1; PagesContainer.Visible=false
    local NonTabsContainer = Instance.new("Frame", MainFrame); NonTabsContainer.Size=UDim2.new(1,0,1,-86); NonTabsContainer.Position=UDim2.new(0,0,0,36); NonTabsContainer.BackgroundTransparency=1; NonTabsContainer.Visible=true

    -- NonTab panels: Profile, Game, Settings (no tabs)
    local function CreateNonTabPanel()
        local panel=Instance.new("Frame", NonTabsContainer); panel.Size=UDim2.new(1,0,1,0); panel.BackgroundTransparency=1; panel.Visible=false
        local firstColumn=Instance.new("ScrollingFrame", panel); firstColumn.Size=UDim2.new(1,-12,1,-10); firstColumn.Position=UDim2.new(0,6,0,5); firstColumn.BackgroundTransparency=1; firstColumn.ScrollBarThickness=2; firstColumn.ScrollBarImageColor3=Theme.Accent; firstColumn.CanvasSize=UDim2.new(0,0,0,0); firstColumn.AutomaticCanvasSize=Enum.AutomaticSize.Y
        local list=Instance.new("UIListLayout", firstColumn); list.Padding=UDim.new(0,8)
        return firstColumn, panel
    end

    local function CreateCard(parent, titleText, height)
        local card=Instance.new("Frame", parent); card.Size=UDim2.new(1,0,0,height); card.BackgroundColor3=Theme.CardBG; card.BorderSizePixel=0; addCorner(card,6); addStroke(card,Theme.CardStroke)
        local title=Instance.new("TextLabel", card); title.Size=UDim2.new(1,-16,0,26); title.Position=UDim2.new(0,8,0,4); title.BackgroundTransparency=1; title.Text=titleText; title.TextColor3=Theme.TextWhite; title.Font=Enum.Font.GothamBold; title.TextSize=10; title.TextXAlignment=Enum.TextXAlignment.Left
        local content=Instance.new("Frame", card); content.Size=UDim2.new(1,0,1,-30); content.Position=UDim2.new(0,0,0,30); content.BackgroundTransparency=1
        local list=Instance.new("UIListLayout", content); list.Padding=UDim.new(0,6); list.HorizontalAlignment=Enum.HorizontalAlignment.Center
        local pad=Instance.new("UIPadding", content); pad.PaddingLeft=UDim.new(0,8); pad.PaddingRight=UDim.new(0,8); pad.PaddingBottom=UDim.new(0,8)
        return content
    end

    local function CreateSmallButton(parent, text, callback)
        local button=Instance.new("TextButton", parent); button.Size=UDim2.new(1,0,0,24); button.BackgroundColor3=Color3.fromRGB(22,22,26); button.AutoButtonColor=false; button.Text=text; button.TextColor3=Theme.TextWhite; button.Font=Theme.Font; button.TextSize=9; addCorner(button,4); addStroke(button,Theme.CardStroke)
        button.MouseButton1Click:Connect(callback)
        return button
    end

    local function createRightColumn(panel)
        local right=Instance.new("ScrollingFrame", panel); right.Size=UDim2.new(0.5,-8,1,-10); right.Position=UDim2.new(0.5,2,0,5); right.BackgroundTransparency=1; right.ScrollBarThickness=2; right.ScrollBarImageColor3=Theme.Accent; right.CanvasSize=UDim2.new(0,0,0,0); right.AutomaticCanvasSize=Enum.AutomaticSize.Y
        local layout=Instance.new("UIListLayout", right); layout.Padding=UDim.new(0,8)
        return right
    end

    -- Profile Panel
    local ProfileLeft, ProfilePanel = CreateNonTabPanel(); ProfilePanel.Visible=true; ProfileLeft.Size=UDim2.new(0.5,-8,1,-10)
    local ProfileRight = createRightColumn(ProfilePanel)
    local profileCard=Instance.new("Frame", ProfileLeft); profileCard.Size=UDim2.new(1,0,0,155); profileCard.BackgroundColor3=Theme.CardBG; profileCard.BorderSizePixel=0; addCorner(profileCard,6); addStroke(profileCard,Theme.CardStroke)
    local AvatarImage=Instance.new("ImageLabel", profileCard); AvatarImage.Size=UDim2.new(0,90,0,90); AvatarImage.Position=UDim2.new(0.5,-45,0,15); AvatarImage.BackgroundTransparency=1; AvatarImage.Image="https://www.roblox.com/headshot-thumbnail/image?userId="..tostring(LocalPlayer.UserId).."&width=420&height=420&format=png"; addCorner(AvatarImage,45)
    local PlayerNameLabel=Instance.new("TextLabel", profileCard); PlayerNameLabel.Size=UDim2.new(1,-20,0,18); PlayerNameLabel.Position=UDim2.new(0,10,0,115); PlayerNameLabel.BackgroundTransparency=1; PlayerNameLabel.Text=LocalPlayer.Name; PlayerNameLabel.TextColor3=Theme.TextWhite; PlayerNameLabel.Font=Enum.Font.GothamBold; PlayerNameLabel.TextSize=11; PlayerNameLabel.TextXAlignment=Enum.TextXAlignment.Center
    local DisplayNameLabel=Instance.new("TextLabel", profileCard); DisplayNameLabel.Size=UDim2.new(1,-20,0,16); DisplayNameLabel.Position=UDim2.new(0,10,0,133); DisplayNameLabel.BackgroundTransparency=1; DisplayNameLabel.Text="@"..LocalPlayer.DisplayName; DisplayNameLabel.TextColor3=Theme.TextMuted; DisplayNameLabel.Font=Theme.Font; DisplayNameLabel.TextSize=9; DisplayNameLabel.TextXAlignment=Enum.TextXAlignment.Center
    local infoCard=Instance.new("Frame", ProfileRight); infoCard.Size=UDim2.new(1,0,0,55); infoCard.BackgroundColor3=Theme.CardBG; infoCard.BorderSizePixel=0; addCorner(infoCard,6); addStroke(infoCard,Theme.CardStroke)
    local infoTitle=Instance.new("TextLabel", infoCard); infoTitle.Size=UDim2.new(1,-16,0,45); infoTitle.Position=UDim2.new(0,8,0,-7); infoTitle.BackgroundTransparency=1; infoTitle.Text="Information"; infoTitle.TextColor3=Theme.TextWhite; infoTitle.Font=Theme.Font; infoTitle.TextSize=10; infoTitle.TextWrapped=true; infoTitle.TextXAlignment=Enum.TextXAlignment.Left
    local infoBody=Instance.new("TextLabel", infoCard); infoBody.Size=UDim2.new(1,-16,0,45); infoBody.Position=UDim2.new(0,8,0,5); infoBody.BackgroundTransparency=1; infoBody.Text="\nKey: higepro\ntuputamadre"; infoBody.TextColor3=Theme.TextMuted; infoBody.Font=Theme.Font; infoBody.TextSize=10; infoBody.TextWrapped=true; infoBody.TextXAlignment=Enum.TextXAlignment.Left
    local licenseCard=Instance.new("Frame", ProfileRight); licenseCard.Size=UDim2.new(1,0,0,65); licenseCard.BackgroundColor3=Theme.CardBG; licenseCard.BorderSizePixel=0; addCorner(licenseCard,6); addStroke(licenseCard,Theme.CardStroke)
    local licenseTitle=Instance.new("TextLabel", licenseCard); licenseTitle.Size=UDim2.new(1,-16,0,20); licenseTitle.Position=UDim2.new(0,8,0,5); licenseTitle.BackgroundTransparency=1; licenseTitle.Text="License"; licenseTitle.TextColor3=Theme.TextWhite; licenseTitle.Font=Theme.Font; licenseTitle.TextSize=10; licenseTitle.TextWrapped=true; licenseTitle.TextXAlignment=Enum.TextXAlignment.Left
    local licenseBody=Instance.new("TextLabel", licenseCard); licenseBody.Size=UDim2.new(1,-16,0,55); licenseBody.Position=UDim2.new(0,8,0,5); licenseBody.BackgroundTransparency=1; licenseBody.Text="CRACKED"; licenseBody.TextColor3=Theme.TextMuted; licenseBody.Font=Theme.Font; licenseBody.TextSize=10; licenseBody.TextWrapped=true; licenseBody.TextXAlignment=Enum.TextXAlignment.Left

    -- Game Panel
    local GameLeft, GamePanel = CreateNonTabPanel(); GameLeft.Size=UDim2.new(0.5,-8,1,-10)
    local GameRight = createRightColumn(GamePanel)
    local gameCard=Instance.new("Frame", GameLeft); gameCard.Size=UDim2.new(1,0,0,185); gameCard.BackgroundColor3=Theme.CardBG; gameCard.BorderSizePixel=0; addCorner(gameCard,6); addStroke(gameCard,Theme.CardStroke)
    local GameImage=Instance.new("ImageLabel", gameCard); GameImage.Size=UDim2.new(0,90,0,90); GameImage.Position=UDim2.new(0.5,-45,0,32); GameImage.BackgroundTransparency=1; addCorner(GameImage,8)
    local gameInfo; local gotGameInfo=pcall(function() gameInfo=MarketplaceService:GetProductInfo(game.PlaceId) end)
    if gotGameInfo and gameInfo and gameInfo.IconImageAssetId then GameImage.Image="rbxassetid://"..tostring(gameInfo.IconImageAssetId) else GameImage.Image="rbxassetid://6023426915" end
    local gameName=(gotGameInfo and gameInfo and gameInfo.Name) or "Unknown place"
    local creatorName=(gotGameInfo and gameInfo and gameInfo.Creator and gameInfo.Creator.Name) or "Unknown"
    local GameInfoLabel=Instance.new("TextLabel", gameCard); GameInfoLabel.Size=UDim2.new(1,-16,0,50); GameInfoLabel.Position=UDim2.new(0,8,0,128); GameInfoLabel.BackgroundTransparency=1; GameInfoLabel.Text=gameName.."\n(By: "..creatorName..")\n(ID: "..tostring(game.PlaceId)..")\n#v-1.94"; GameInfoLabel.TextColor3=Theme.TextMuted; GameInfoLabel.Font=Theme.Font; GameInfoLabel.TextSize=9; GameInfoLabel.TextWrapped=true; GameInfoLabel.TextXAlignment=Enum.TextXAlignment.Center
    local ServerContent = CreateCard(GameRight, "Server", 116)
    local JobContent = CreateCard(GameRight, "JobId", 116)
    local JobIdBox=Instance.new("TextBox", JobContent); JobIdBox.Size=UDim2.new(1,0,0,24); JobIdBox.BackgroundColor3=Color3.fromRGB(22,22,26); JobIdBox.PlaceholderText="Paste Jobid here..."; JobIdBox.PlaceholderColor3=Theme.TextMuted; JobIdBox.Text=""; JobIdBox.TextColor3=Theme.TextWhite; JobIdBox.Font=Theme.Font; JobIdBox.TextSize=9; JobIdBox.ClearTextOnFocus=false; addCorner(JobIdBox,4); addStroke(JobIdBox,Theme.CardStroke)

    -- Settings Panel
    local SettingsLeft, SettingsPanel = CreateNonTabPanel()
    local aboutCard=Instance.new("Frame", SettingsLeft); aboutCard.Size=UDim2.new(1,0,0,75); aboutCard.BackgroundColor3=Theme.CardBG; addCorner(aboutCard,6)
    local aboutTitle=Instance.new("TextLabel", aboutCard); aboutTitle.Size=UDim2.new(1,-20,1,0); aboutTitle.Position=UDim2.new(0,10,0,-28); aboutTitle.BackgroundTransparency=1; aboutTitle.Text="About"; aboutTitle.TextColor3=Theme.TextWhite; aboutTitle.Font=Theme.Font; aboutTitle.TextSize=12; aboutTitle.TextXAlignment=Enum.TextXAlignment.Left; aboutTitle.TextYAlignment=Enum.TextYAlignment.Center
    local aboutBody=Instance.new("TextLabel", aboutCard); aboutBody.Size=UDim2.new(1,-20,1,0); aboutBody.Position=UDim2.new(0,10,0,0); aboutBody.BackgroundTransparency=1; aboutBody.Text="\nCRACKED TPS Hub\nMobile & PC\nReach, Moss, Xeno, Extras"; aboutBody.TextColor3=Theme.Accent; aboutBody.Font=Theme.Font; aboutBody.TextSize=11; aboutBody.TextXAlignment=Enum.TextXAlignment.Left; aboutBody.TextYAlignment=Enum.TextYAlignment.Center

    -- Bottom Bar Tabs
    local BottomBar=Instance.new("Frame", MainFrame); BottomBar.Size=UDim2.new(1,0,0,50); BottomBar.Position=UDim2.new(0,0,1,-50); BottomBar.BackgroundColor3=Theme.Sidebar; BottomBar.BorderSizePixel=0
    local Divider=Instance.new("Frame", BottomBar); Divider.Size=UDim2.new(1,0,0,1); Divider.BackgroundColor3=Theme.CardStroke; Divider.BorderSizePixel=0
    local TopTabsHolder=Instance.new("Frame", BottomBar); TopTabsHolder.Size=UDim2.new(0,221,1,0); TopTabsHolder.Position=UDim2.new(0.5,-110,0,0); TopTabsHolder.BackgroundTransparency=1
    local navLayout=Instance.new("UIListLayout", TopTabsHolder); navLayout.FillDirection=Enum.FillDirection.Horizontal; navLayout.HorizontalAlignment=Enum.HorizontalAlignment.Center; navLayout.VerticalAlignment=Enum.VerticalAlignment.Center; navLayout.SortOrder=Enum.SortOrder.LayoutOrder; navLayout.Padding=UDim.new(0,15)

    local function CreateTopTab(iconAsset, selected)
        local button=Instance.new("TextButton", TopTabsHolder); button.Size=UDim2.new(0,44,0,32); button.BackgroundTransparency=selected and 0 or 1; button.BackgroundColor3=Theme.Accent; button.Text=""; button.AutoButtonColor=false; addCorner(button,6)
        local icon=Instance.new("ImageLabel", button); icon.Size=UDim2.new(0,18,0,18); icon.Position=UDim2.new(0.5,-9,0.5,-9); icon.BackgroundTransparency=1; icon.Image=iconAsset; icon.ImageColor3=selected and Color3.fromRGB(16,16,18) or Theme.TextMuted
        return button, icon
    end
    local ProfileButton, ProfileIcon = CreateTopTab("rbxassetid://81899856845503", true)
    local GameButton, GameIcon = CreateTopTab("rbxassetid://126601646824958", false)
    local TabsButton, TabsIcon = CreateTopTab("rbxassetid://96448232078753", false)
    local SettingsButton, SettingsIcon = CreateTopTab("rbxassetid://101463883805422", false)
    local allTopButtons={ProfileButton,GameButton,TabsButton,SettingsButton}
    local allTopIcons={ProfileIcon,GameIcon,TabsIcon,SettingsIcon}

    local function SwitchTopTab(tabName, selectedButton, selectedIcon)
        for _,button in ipairs(allTopButtons) do TweenService:Create(button, TweenInfo.new(0.2), {BackgroundTransparency=1}):Play() end
        for _,icon in ipairs(allTopIcons) do TweenService:Create(icon, TweenInfo.new(0.2), {ImageColor3=Theme.TextMuted}):Play() end
        TweenService:Create(selectedButton, TweenInfo.new(0.2), {BackgroundTransparency=0}):Play()
        TweenService:Create(selectedIcon, TweenInfo.new(0.2), {ImageColor3=Color3.fromRGB(16,16,18)}):Play()
        PageList.Visible = (tabName=="Tabs")
        PagesContainer.Visible = (tabName=="Tabs")
        NonTabsContainer.Visible = (tabName~="Tabs")
        ProfilePanel.Visible = (tabName=="Profile")
        GamePanel.Visible = (tabName=="Game")
        SettingsPanel.Visible = (tabName=="Settings")
    end
    ProfileButton.MouseButton1Click:Connect(function() SwitchTopTab("Profile", ProfileButton, ProfileIcon) end)
    GameButton.MouseButton1Click:Connect(function() SwitchTopTab("Game", GameButton, GameIcon) end)
    TabsButton.MouseButton1Click:Connect(function() SwitchTopTab("Tabs", TabsButton, TabsIcon) end)
    SettingsButton.MouseButton1Click:Connect(function() SwitchTopTab("Settings", SettingsButton, SettingsIcon) end)

    -- === UI Library for Tabs ===
    local function MakePageFactory(pageList, pageContainer)
        local selectedPage
        local function CreatePage(titleText, subtitleText)
            local selector=Instance.new("TextButton", pageList); selector.Size=UDim2.new(1,0,0,40); selector.BackgroundTransparency=1; selector.Text=""; selector.AutoButtonColor=false
            local indicator=Instance.new("Frame", selector); indicator.Size=UDim2.new(0,3,0,22); indicator.Position=UDim2.new(0,0,0.5,-11); indicator.BackgroundColor3=Theme.Accent; indicator.BackgroundTransparency=1; addCorner(indicator,1,0)
            local title=Instance.new("TextLabel", selector); title.Size=UDim2.new(1,-12,0,18); title.Position=UDim2.new(0,12,0,4); title.BackgroundTransparency=1; title.Text=titleText; title.TextColor3=Theme.TextMuted; title.Font=Enum.Font.GothamBold; title.TextSize=11; title.TextXAlignment=Enum.TextXAlignment.Left
            local subtitle=Instance.new("TextLabel", selector); subtitle.Size=UDim2.new(1,-12,0,14); subtitle.Position=UDim2.new(0,12,0,21); subtitle.BackgroundTransparency=1; subtitle.Text=subtitleText or ""; subtitle.TextColor3=Theme.TextMuted; subtitle.Font=Enum.Font.Gotham; subtitle.TextSize=11; subtitle.TextXAlignment=Enum.TextXAlignment.Left
            local page=Instance.new("Frame", pageContainer); page.Size=UDim2.new(1,0,1,0); page.BackgroundTransparency=1; page.Visible=false
            local left=Instance.new("ScrollingFrame", page); left.Size=UDim2.new(0.5,-8,1,-10); left.Position=UDim2.new(0,6,0,5); left.BackgroundTransparency=1; left.ScrollBarThickness=2; left.ScrollBarImageColor3=Theme.Accent; left.CanvasSize=UDim2.new(0,0,0,0); left.AutomaticCanvasSize=Enum.AutomaticSize.Y
            local leftLayout=Instance.new("UIListLayout", left); leftLayout.Padding=UDim.new(0,8)
            local right=Instance.new("ScrollingFrame", page); right.Size=UDim2.new(0.5,-8,1,-10); right.Position=UDim2.new(0.5,2,0,5); right.BackgroundTransparency=1; right.ScrollBarThickness=2; right.ScrollBarImageColor3=Theme.Accent; right.CanvasSize=UDim2.new(0,0,0,0); right.AutomaticCanvasSize=Enum.AutomaticSize.Y
            local rightLayout=Instance.new("UIListLayout", right); rightLayout.Padding=UDim.new(0,8)
            local descriptor={Button=selector,Indicator=indicator,MainText=title,Page=page}
            local function selectPage()
                if selectedPage and selectedPage.Button~=selector then
                    TweenService:Create(selectedPage.Indicator, TweenInfo.new(0.2), {BackgroundTransparency=1}):Play()
                    TweenService:Create(selectedPage.MainText, TweenInfo.new(0.2), {TextColor3=Theme.TextMuted}):Play()
                    selectedPage.Page.Visible=false
                elseif selectedPage and selectedPage.Button==selector then return end
                selectedPage=descriptor
                TweenService:Create(indicator, TweenInfo.new(0.2), {BackgroundTransparency=0}):Play()
                TweenService:Create(title, TweenInfo.new(0.2), {TextColor3=Theme.TextWhite}):Play()
                page.Visible=true
            end
            selector.MouseButton1Click:Connect(selectPage)
            if not selectedPage then indicator.BackgroundTransparency=0; title.TextColor3=Theme.TextWhite; page.Visible=true; selectedPage=descriptor end
            local pageApi={}
            function pageApi:AddSection(side, sectionTitle)
                local column=(side=="right") and right or left
                local card=Instance.new("Frame", column); card.Size=UDim2.new(1,0,0,30); card.BackgroundColor3=Theme.CardBG; card.BorderSizePixel=0; addCorner(card,6); addStroke(card,Theme.CardStroke)
                local sectionTitleLabel=Instance.new("TextLabel", card); sectionTitleLabel.Size=UDim2.new(1,-16,0,26); sectionTitleLabel.Position=UDim2.new(0,8,0,2); sectionTitleLabel.BackgroundTransparency=1; sectionTitleLabel.Text=sectionTitle; sectionTitleLabel.TextColor3=Theme.TextWhite; sectionTitleLabel.Font=Enum.Font.GothamBold; sectionTitleLabel.TextSize=13; sectionTitleLabel.TextXAlignment=Enum.TextXAlignment.Left
                local content=Instance.new("Frame", card); content.Size=UDim2.new(1,0,1,-28); content.Position=UDim2.new(0,0,0,28); content.BackgroundTransparency=1
                local layout=Instance.new("UIListLayout", content); layout.Padding=UDim.new(0,6)
                local padding=Instance.new("UIPadding", content); padding.PaddingLeft=UDim.new(0,8); padding.PaddingRight=UDim.new(0,8); padding.PaddingBottom=UDim.new(0,8)
                local function resizeSection()
                    card.Size=UDim2.new(1,0,0,layout.AbsoluteContentSize.Y+36)
                end
                layout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(resizeSection)
                local section={}
                function section:AddToggle(toggleTitle, default, callback)
                    local state=default or false
                    local row=Instance.new("TextButton", content); row.Size=UDim2.new(1,0,0,26); row.BackgroundTransparency=1; row.Text=""; row.AutoButtonColor=false
                    local box=Instance.new("Frame", row); box.Size=UDim2.new(0,16,0,16); box.Position=UDim2.new(0,0,0.5,-8); box.BackgroundColor3=state and Theme.Accent or Color3.fromRGB(38,38,48); addCorner(box,4)
                    local check=Instance.new("ImageLabel", box); check.Size=UDim2.new(0,10,0,10); check.Position=UDim2.new(0.5,-5,0.5,-5); check.BackgroundTransparency=1; check.Image="rbxassetid://83827110621355"; check.ImageColor3=Color3.fromRGB(35,35,35); check.ImageTransparency=state and 0 or 1
                    local label=Instance.new("TextLabel", row); label.Size=UDim2.new(1,-26,1,0); label.Position=UDim2.new(0,18,0,0); label.BackgroundTransparency=1; label.Text=toggleTitle; label.TextColor3=Theme.TextWhite; label.Font=Theme.Font; label.TextSize=11; label.TextXAlignment=Enum.TextXAlignment.Left; label.TextYAlignment=Enum.TextYAlignment.Center
                    row.MouseButton1Click:Connect(function()
                        state=not state
                        local newColor=state and Theme.Accent or Color3.fromRGB(38,38,48)
                        local imageTransparency=state and 0 or 1
                        TweenService:Create(box, TweenInfo.new(0.15), {BackgroundColor3=newColor}):Play()
                        TweenService:Create(check, TweenInfo.new(0), {ImageTransparency=imageTransparency}):Play()
                        if callback then pcall(callback,state) end
                    end)
                    return row
                end
                function section:AddLabel(text)
                    local label=Instance.new("TextLabel", content); label.Size=UDim2.new(1,0,0,18); label.BackgroundTransparency=1; label.RichText=true; label.Text=text; label.TextColor3=Theme.TextMuted; label.Font=Theme.Font; label.TextSize=12; label.TextXAlignment=Enum.TextXAlignment.Left; return label
                end
                function section:AddButton(buttonTitle, description, callback)
                    local hasDescription = type(description)=="string" and description~=""
                    if not hasDescription then callback=description end
                    local height = hasDescription and 35 or 32
                    local button=Instance.new("TextButton", content); button.Size=UDim2.new(1,0,0,height); button.BackgroundColor3=Color3.fromRGB(22,22,26); button.AutoButtonColor=false; button.Text=""; button.ClipsDescendants=true; addCorner(button,5); addStroke(button,Theme.CardStroke)
                    local title=Instance.new("TextLabel", button); title.Size=UDim2.new(1,0,0,hasDescription and 16 or height); title.Position=UDim2.new(0,0,0,hasDescription and 4 or 0); title.BackgroundTransparency=1; title.Text=buttonTitle; title.TextColor3=Theme.TextWhite; title.Font=Theme.Font; title.TextSize=11; title.TextXAlignment=Enum.TextXAlignment.Center
                    if hasDescription then
                        local desc=Instance.new("TextLabel", button); desc.Size=UDim2.new(1,0,0,14); desc.Position=UDim2.new(0,0,0,22); desc.BackgroundTransparency=1; desc.Text=description; desc.TextColor3=Theme.TextMuted; desc.Font=Enum.Font.Gotham; desc.TextSize=9; desc.TextXAlignment=Enum.TextXAlignment.Center
                    end
                    button.MouseButton1Click:Connect(function()
                        TweenService:Create(button, TweenInfo.new(0.08, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {Size=UDim2.new(1,-4,0,height-3), Position=UDim2.new(0,2,0,1.5)}):Play()
                        task.wait(0.12)
                        TweenService:Create(button, TweenInfo.new(0.15, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {Size=UDim2.new(1,0,0,height), Position=UDim2.new(0,0,0,0)}):Play()
                        if callback then pcall(callback) end
                    end)
                    return button
                end
                function section:AddParagraph(icon, paragraphTitle, description)
                    local paragraph=Instance.new("Frame", content); paragraph.BackgroundColor3=Color3.fromRGB(27,27,27); paragraph.BorderSizePixel=0; addCorner(paragraph,8); addStroke(paragraph,Theme.CardStroke,1)
                    local pad=Instance.new("UIPadding", paragraph); pad.PaddingTop=UDim.new(0,10); pad.PaddingBottom=UDim.new(0,10); pad.PaddingLeft=UDim.new(0,10); pad.PaddingRight=UDim.new(0,10)
                    local image=Instance.new("ImageLabel", paragraph); image.Size=UDim2.new(0,20,0,20); image.Position=UDim2.new(0,0,0,0); image.BackgroundTransparency=1; image.Image=icon and icon~="" and icon or "rbxassetid://6031763426"; image.ImageColor3=Theme.TextWhite
                    local title=Instance.new("TextLabel", paragraph); title.Size=UDim2.new(1,-28,0,20); title.Position=UDim2.new(0,25,0,0); title.BackgroundTransparency=1; title.Text=paragraphTitle or "Title"; title.TextColor3=Theme.TextWhite; title.Font=Enum.Font.GothamBold; title.TextSize=13; title.TextXAlignment=Enum.TextXAlignment.Left; title.TextYAlignment=Enum.TextYAlignment.Center
                    local desc=Instance.new("TextLabel", paragraph); desc.Size=UDim2.new(1,-28,0,0); desc.Position=UDim2.new(0,10,0,21); desc.BackgroundTransparency=1; desc.Text=description or "Description..."; desc.TextColor3=Theme.TextMuted; desc.Font=Theme.Font; desc.TextSize=11; desc.RichText=true; desc.TextWrapped=true; desc.TextXAlignment=Enum.TextXAlignment.Left; desc.TextYAlignment=Enum.TextYAlignment.Top
                    local function updateSize()
                        local availableWidth=math.max(100, paragraph.AbsoluteSize.X-48)
                        local bounds=game:GetService("TextService"):GetTextSize(desc.Text, desc.TextSize, desc.Font, Vector2.new(availableWidth,10000))
                        desc.Size=UDim2.new(1,-28,0,bounds.Y)
                        paragraph.Size=UDim2.new(1,0,0,34+bounds.Y+10)
                    end
                    paragraph:GetPropertyChangedSignal("AbsoluteSize"):Connect(updateSize)
                    desc:GetPropertyChangedSignal("Text"):Connect(updateSize)
                    task.defer(updateSize)
                    return paragraph
                end
                function section:AddSlider(sliderTitle, minValue, maxValue, defaultValue, callback)
                    local value=defaultValue or minValue
                    local dragging=false
                    local holder=Instance.new("Frame", content); holder.Size=UDim2.new(1,0,0,36); holder.BackgroundTransparency=1
                    local title=Instance.new("TextLabel", holder); title.Size=UDim2.new(1,-40,0,16); title.BackgroundTransparency=1; title.Text=sliderTitle; title.TextColor3=Theme.TextWhite; title.Font=Theme.Font; title.TextSize=11; title.TextXAlignment=Enum.TextXAlignment.Left; title.TextYAlignment=Enum.TextYAlignment.Center
                    local valueLabel=Instance.new("TextLabel", holder); valueLabel.Size=UDim2.new(0,40,0,16); valueLabel.Position=UDim2.new(1,-40,0,0); valueLabel.BackgroundTransparency=1; valueLabel.Text=tostring(value); valueLabel.TextColor3=Theme.TextMuted; valueLabel.Font=Theme.Font; valueLabel.TextSize=11; valueLabel.TextXAlignment=Enum.TextXAlignment.Right; valueLabel.TextYAlignment=Enum.TextYAlignment.Center
                    local bar=Instance.new("Frame", holder); bar.Size=UDim2.new(1,0,0,6); bar.Position=UDim2.new(0,0,0,20); bar.BackgroundColor3=Color3.fromRGB(22,22,26); addCorner(bar,1,0)
                    local fill=Instance.new("Frame", bar); fill.Size=UDim2.new((value-minValue)/(maxValue-minValue),0,1,0); fill.BackgroundColor3=Theme.Accent; addCorner(fill,1,0)
                    local knob=Instance.new("Frame", fill); knob.Size=UDim2.new(0,10,0,16); knob.AnchorPoint=Vector2.new(0.5,0.5); knob.Position=UDim2.new(1,0,0.5,0); knob.BackgroundColor3=Color3.fromRGB(255,255,255); addCorner(knob,4)
                    local function update(input)
                        local alpha=math.clamp((input.Position.X-bar.AbsolutePosition.X)/bar.AbsoluteSize.X,0,1)
                        value=math.floor(minValue+(maxValue-minValue)*alpha)
                        fill.Size=UDim2.new(alpha,0,1,0)
                        valueLabel.Text=tostring(value)
                        if callback then pcall(callback,value) end
                    end
                    bar.InputBegan:Connect(function(input)
                        if input.UserInputType==Enum.UserInputType.MouseButton1 or input.UserInputType==Enum.UserInputType.Touch then
                            dragging=true; update(input)
                        end
                    end)
                    UserInputService.InputChanged:Connect(function(input)
                        if not dragging then return end
                        if input.UserInputType==Enum.UserInputType.MouseMovement or input.UserInputType==Enum.UserInputType.Touch then update(input) end
                    end)
                    UserInputService.InputEnded:Connect(function(input)
                        if input.UserInputType==Enum.UserInputType.MouseButton1 or input.UserInputType==Enum.UserInputType.Touch then dragging=false end
                    end)
                    return holder
                end
                function section:AddTextbox(inputTitle, description, placeholder, callback)
                    local holder=Instance.new("Frame", content); holder.BackgroundTransparency=1
                    local y=0
                    local title=Instance.new("TextLabel", holder); title.Size=UDim2.new(1,0,0,16); title.Position=UDim2.new(0,0,0,y); title.BackgroundTransparency=1; title.Text=inputTitle or "Input Title"; title.TextColor3=Theme.TextWhite; title.Font=Enum.Font.GothamBold; title.TextSize=11; title.TextXAlignment=Enum.TextXAlignment.Left
                    y=y+16
                    local hasDescription=description and description~=""
                    if hasDescription then
                        local desc=Instance.new("TextLabel", holder); desc.Size=UDim2.new(1,0,0,0); desc.Position=UDim2.new(0,0,0,y+2); desc.BackgroundTransparency=1; desc.Text=description; desc.TextColor3=Theme.TextMuted; desc.Font=Enum.Font.Gotham; desc.TextSize=10; desc.TextWrapped=true; desc.TextXAlignment=Enum.TextXAlignment.Left; desc.TextYAlignment=Enum.TextYAlignment.Top
                        local bounds=game:GetService("TextService"):GetTextSize(description,9,Enum.Font.Gotham,Vector2.new(content.AbsoluteSize.X-16,1000))
                        desc.Size=UDim2.new(1,0,0,bounds.Y)
                        y=y+bounds.Y+6
                    end
                    local inputFrame=Instance.new("Frame", holder); inputFrame.Size=UDim2.new(1,0,0,28); inputFrame.Position=UDim2.new(0,0,0,y); inputFrame.BackgroundColor3=Color3.fromRGB(22,22,26); inputFrame.BorderSizePixel=0; addCorner(inputFrame,5)
                    local inputStroke=addStroke(inputFrame,Theme.CardStroke,1)
                    local box=Instance.new("TextBox", inputFrame); box.Size=UDim2.new(1,-16,1,0); box.Position=UDim2.new(0,8,0,0); box.BackgroundTransparency=1; box.PlaceholderText=placeholder or "Type here..."; box.PlaceholderColor3=Theme.TextMuted; box.Text=""; box.TextColor3=Theme.TextWhite; box.Font=Enum.Font.Gotham; box.TextSize=10; box.ClearTextOnFocus=false; box.TextXAlignment=Enum.TextXAlignment.Left
                    y=y+32; holder.Size=UDim2.new(1,0,0,y)
                    box.Focused:Connect(function() TweenService:Create(inputStroke,TweenInfo.new(0.2),{Color=Theme.Accent}):Play() end)
                    box.FocusLost:Connect(function(enterPressed)
                        TweenService:Create(inputStroke,TweenInfo.new(0.2),{Color=Theme.CardStroke}):Play()
                        if callback then pcall(callback,box.Text,enterPressed) end
                    end)
                    return holder
                end
                function section:AddDropdown(dropdownTitle, description, options, default, callback)
                    local hasDescription=type(description)=="string" and description~=""
                    if not hasDescription then callback=default; default=options; options=description end
                    options=options or {}
                    local selected=default or options[1] or ""
                    local opened=false
                    local closedHeight=hasDescription and 46 or 34
                    local holder=Instance.new("Frame", content); holder.Size=UDim2.new(1,0,0,closedHeight); holder.BackgroundColor3=Color3.fromRGB(22,22,26); holder.ClipsDescendants=true; addCorner(holder,5); addStroke(holder,Theme.CardStroke)
                    local header=Instance.new("TextButton", holder); header.Size=UDim2.new(1,0,0,closedHeight); header.BackgroundTransparency=1; header.Text=""
                    local label=Instance.new("TextLabel", header); label.Size=UDim2.new(1,0,0,hasDescription and 18 or closedHeight); label.Position=UDim2.new(0,0,0,hasDescription and 4 or 0); label.BackgroundTransparency=1; label.TextColor3=Theme.TextWhite; label.Font=Theme.Font; label.TextSize=11; label.TextXAlignment=Enum.TextXAlignment.Left
                    if hasDescription then
                        local desc=Instance.new("TextLabel", header); desc.Size=UDim2.new(1,0,0,14); desc.Position=UDim2.new(0,0,0,24); desc.BackgroundTransparency=1; desc.Text="  "..description; desc.TextColor3=Theme.TextMuted; desc.Font=Enum.Font.Gotham; desc.TextSize=9; desc.TextXAlignment=Enum.TextXAlignment.Left
                    end
                    local function updateLabel() label.Text="  "..dropdownTitle..": "..tostring(selected)..(opened and " ⇩" or " ⇧") end
                    updateLabel()
                    local optionsFrame=Instance.new("Frame", holder); optionsFrame.Size=UDim2.new(1,0,0,#options*26); optionsFrame.Position=UDim2.new(0,0,0,closedHeight); optionsFrame.BackgroundTransparency=1
                    local optionLayout=Instance.new("UIListLayout", optionsFrame)
                    for _,option in ipairs(options) do
                        local optionButton=Instance.new("TextButton", optionsFrame); optionButton.Size=UDim2.new(1,0,0,26); optionButton.BackgroundTransparency=1; optionButton.Text="  "..tostring(option); optionButton.TextColor3=Theme.TextMuted; optionButton.Font=Theme.Font; optionButton.TextSize=10; optionButton.TextXAlignment=Enum.TextXAlignment.Left
                        optionButton.MouseButton1Click:Connect(function()
                            selected=option; opened=false; updateLabel()
                            TweenService:Create(holder,TweenInfo.new(0.2),{Size=UDim2.new(1,0,0,closedHeight)}):Play()
                            if callback then pcall(callback,selected) end
                        end)
                    end
                    header.MouseButton1Click:Connect(function()
                        opened=not opened; updateLabel()
                        local height=opened and (closedHeight+#options*26) or closedHeight
                        TweenService:Create(holder,TweenInfo.new(0.2),{Size=UDim2.new(1,0,0,height)}):Play()
                    end)
                    return holder
                end
                return section
            end
            return pageApi
        end
        return CreatePage
    end
    local UILib = {MakePageFactory = MakePageFactory}
    local CreatePage = UILib.MakePageFactory(PageList, PagesContainer)

    -- === GAME LOGIC (from punishmenttps) ===
    local _m1_ch, _m1_hrp, _m1_h
    local _m1_ping, _m1_pingT = 0.05, 0
    local function refreshM1(char)
        _m1_ch=char; _m1_hrp=char and char:FindFirstChild("HumanoidRootPart"); _m1_h=char and char:FindFirstChild("Humanoid")
    end
    refreshM1(lp.Character)
    lp.CharacterAdded:Connect(function(char) task.wait(); refreshM1(char); char.ChildAdded:Connect(function() refreshM1(char) end) end)

    -- Method 1
    local m1_enabled=false; local m1_size=5; local m1_conn=nil
    local function connectM1()
        if m1_conn then m1_conn:Disconnect() end
        m1_conn=RunService.PreSimulation:Connect(function()
            if not (_m1_ch and _m1_hrp and _m1_h) then return end
            local t=workspace:FindFirstChild("TPSSystem"); t=t and t:FindFirstChild("TPS"); if not t then return end
            local now=clock()
            if now-_m1_pingT>=2 then _m1_pingT=now; _m1_ping=clamp(lp:GetNetworkPing(),0.016,0.20) end
            local ahead=_m1_ping+1/60; local predPos=t.Position+t.AssemblyLinearVelocity*ahead
            if (_m1_hrp.Position-predPos).Magnitude>m1_size then return end
            local pf=game.Lighting:FindFirstChild(lp.Name); pf=pf and pf:FindFirstChild("PreferredFoot"); if not pf then return end
            local ln; if _m1_h.RigType==Enum.HumanoidRigType.R6 then ln=(pf.Value==1) and "Right Leg" or "Left Leg" else ln=(pf.Value==1) and "RightLowerLeg" or "LeftLowerLeg" end
            local l=_m1_ch:FindFirstChild(ln); if l then fti(l,t,0); fti(l,t,1) end
        end)
    end

    -- Kersai
    local kr_enabled=false; local kr_size=10; local kr_conn=nil; local kr_ping=0.05; local kr_pingT=0; local kr_volley=true; local kr_groundOk=false
    local function connectKersai()
        if kr_conn then kr_conn:Disconnect() end
        kr_conn=RunService.PreSimulation:Connect(function()
            if not (_m1_ch and _m1_hrp and _m1_h) then return end
            local t=workspace:FindFirstChild("TPSSystem"); t=t and t:FindFirstChild("TPS"); if not t then return end
            local now=clock()
            if now-kr_pingT>=2 then kr_pingT=now; kr_ping=clamp(lp:GetNetworkPing(),0.016,0.20) end
            local ahead=kr_ping+1/60; local ballPos=t.Position; local ballVel=t.AssemblyLinearVelocity; local rootPos=_m1_hrp.Position; local rootVelY=_m1_hrp.AssemblyLinearVelocity.Y
            local predPos=ballPos+ballVel*ahead; local dist=(predPos-rootPos).Magnitude; if dist>kr_size then return end
            local isAirborne=_m1_h.FloorMaterial==Enum.Material.Air; local isRising=rootVelY>2; local ballAbove=ballPos.Y>rootPos.Y+0.5; local ballDown=ballVel.Y<-3
            local shouldFire=(isRising) or (kr_volley and ballAbove and ballDown) or (kr_volley and isAirborne and ballAbove) or (kr_groundOk)
            if not shouldFire then return end
            local pf=game.Lighting:FindFirstChild(lp.Name); pf=pf and pf:FindFirstChild("PreferredFoot")
            local ln; if _m1_h.RigType==Enum.HumanoidRigType.R6 then ln=pf and ((pf.Value==1) and "Right Leg" or "Left Leg") or "Right Leg" else ln=pf and ((pf.Value==1) and "RightLowerLeg" or "LeftLowerLeg") or "RightLowerLeg" end
            local leg=_m1_ch:FindFirstChild(ln); if leg then fti(t,leg,0); fti(t,leg,1) end
            fti(t,_m1_hrp,0); fti(t,_m1_hrp,1)
        end)
    end

    -- Method 2 (Box reach)
    local reachSize=V3(5,5,5); local legReachEnabled=false; local reachConn=nil; local reachConn2=nil; local transparency2=0.7; local reachBoxHidden=false
    local reachPart=Instance.new("Part"); reachPart.Anchored=true; reachPart.CanCollide=false; reachPart.Transparency=transparency2; reachPart.Color=Color3.fromRGB(0,85,255); reachPart.Name="ReachPart"; reachPart.Parent=workspace
    local _root,_hum,_rleg,_lleg,_hasRleg,_hasLleg
    local function refreshChar2(char)
        if not char then return end; _root=char:FindFirstChild("HumanoidRootPart"); _hum=char:FindFirstChild("Humanoid"); _rleg=char:FindFirstChild("RightLowerLeg") or char:FindFirstChild("Right Leg"); _lleg=char:FindFirstChild("LeftLowerLeg") or char:FindFirstChild("Left Leg"); _hasRleg=_rleg~=nil; _hasLleg=_lleg~=nil
    end
    refreshChar2(lp.Character); lp.CharacterAdded:Connect(function(c) task.wait(); refreshChar2(c); c.ChildAdded:Connect(function() refreshChar2(c) end) end)
    local _cachedBall=nil
    local function getBall()
        if _cachedBall and _cachedBall.Parent then return _cachedBall end
        local sys=workspace:FindFirstChild("TPSSystem"); _cachedBall=(sys and sys:FindFirstChild("TPS")) or workspace:FindFirstChild("Ball"); return _cachedBall
    end
    local function fireLeg(ball)
        if _root then fti(ball,_root,0); fti(ball,_root,1) end
        if _hasRleg then fti(ball,_rleg,0); fti(ball,_rleg,1) end
        if _hasLleg then fti(ball,_lleg,0); fti(ball,_lleg,1) end
    end
    local BUF_MAX=8; local POS_BUF={}; for i=1,BUF_MAX do POS_BUF[i]={t=0,pos=V3zero,vel=V3zero} end; local POS_HEAD=0; local POS_LEN=0
    local function recordBall(ball) POS_HEAD=(POS_HEAD%BUF_MAX)+1; local s=POS_BUF[POS_HEAD]; s.t=clock(); s.pos=ball.Position; s.vel=ball.AssemblyLinearVelocity; if POS_LEN<BUF_MAX then POS_LEN=POS_LEN+1 end end
    local function getFrame(offset) return POS_BUF[((POS_HEAD-offset-1)%BUF_MAX)+1] end
    local function smartPredict(ball,ahead)
        if POS_LEN<2 then if not ball then return V3zero,V3zero end; return ball.Position+ball.AssemblyLinearVelocity*ahead, ball.AssemblyLinearVelocity end
        local s2=getFrame(0); local s1=getFrame(1); local dt=s2.t-s1.t; if dt<=0 then dt=0.016 end
        local vpx=(s2.pos.X-s1.pos.X)/dt; local vpy=(s2.pos.Y-s1.pos.Y)/dt; local vpz=(s2.pos.Z-s1.pos.Z)/dt
        local vrx=s2.vel.X; local vry=s2.vel.Y; local vrz=s2.vel.Z
        local ddx=vrx-vpx; local ddy=vry-vpy; local ddz=vrz-vpz
        local kb=clamp((ddx*ddx+ddy*ddy+ddz*ddz)/(35*35),0,1)
        local blx=vpx*(1-kb)+vrx*kb; local bly=vpy*(1-kb)+vry*kb; local blz=vpz*(1-kb)+vrz*kb
        local ax,ay,az=0,0,0
        if POS_LEN>=3 then
            local s0=getFrame(2); local dt0=s1.t-s0.t; if dt0>0 then
                local v0x=(s1.pos.X-s0.pos.X)/dt0; local v0y=(s1.pos.Y-s0.pos.Y)/dt0; local v0z=(s1.pos.Z-s0.pos.Z)/dt0
                local amax=120; ax=clamp((vpx-v0x)/dt,-amax,amax); ay=clamp((vpy-v0y)/dt,-amax,amax); az=clamp((vpz-v0z)/dt,-amax,amax)
            end
        end
        local gravY=-9.8*ahead*ahead*(1-kb); local t=clamp(ahead,0.016,0.25); local half=0.5*t*t
        return V3(s2.pos.X+blx*t+ax*half, s2.pos.Y+bly*t+ay*half+gravY, s2.pos.Z+blz*t+az*half), V3(blx,bly,blz)
    end
    local _cachedPing=0.05; local _lastPingT=0; local HIGH_PING_MS=0.10; local GRAV_HLF_SQ=-9.8*0.5*(1/60)*(1/60); local INSIDE_THRESH=5
    local function doReach2Fire()
        if not _root or not _hum then return end
        local ball=getBall(); if not ball then return end
        local now=clock()
        if now-_lastPingT>=2 then _lastPingT=now; _cachedPing=clamp(lp:GetNetworkPing(),0.016,0.25) end
        local ballPos=ball.Position; local rootPos=_root.Position
        local qdx=ballPos.X-rootPos.X; local qdz=ballPos.Z-rootPos.Z
        if abs(qdx)>32 or abs(qdz)>32 then return end
        recordBall(ball)
        local qdy=ballPos.Y-rootPos.Y; local rawDist=sqrt(qdx*qdx+qdy*qdy+qdz*qdz)
        local ahead=_cachedPing+1/60
        local predPos,predVel        if _cachedPing>=HIGH_PING_MS or rawDist>=7 then predPos,predVel=smartPredict(ball,ahead) else predPos=ballPos; predVel=ball.AssemblyLinearVelocity end
        local pvx=predVel.X; local pvy=predVel.Y; local pvz=predVel.Z
        local farPos=V3(predPos.X+pvx*(1/60), predPos.Y+pvy*(1/60)+GRAV_HLF_SQ, predPos.Z+pvz*(1/60))
        local rx=reachSize.X/2; local ry=reachSize.Y/2; local rz=reachSize.Z/2
        local dx=predPos.X-rootPos.X; local dy=predPos.Y-rootPos.Y; local dz=predPos.Z-rootPos.Z
        local fdx=farPos.X-rootPos.X; local fdy=farPos.Y-rootPos.Y; local fdz=farPos.Z-rootPos.Z
        if rawDist<INSIDE_THRESH then fireLeg(ball) end
        if (abs(dx)<=rx and abs(dy)<=ry and abs(dz)<=rz) or (abs(fdx)<=rx and abs(fdy)<=ry and abs(fdz)<=rz) then fireLeg(ball) end
        if not reachBoxHidden then reachPart.CFrame=_root.CFrame end
    end
    local function startReach2()
        if reachConn then reachConn:Disconnect() end; if reachConn2 then reachConn2:Disconnect() end
        reachPart.Size=reachSize
        reachConn=RunService.PreSimulation:Connect(doReach2Fire)
        reachConn2=RunService.Stepped:Connect(doReach2Fire)
    end
    local function stopReach2()
        if reachConn then reachConn:Disconnect(); reachConn=nil end; if reachConn2 then reachConn2:Disconnect(); reachConn2=nil end
        reachPart.CFrame=CFrame.new(0,-9999,0)
    end

    -- Moss (Head Reach)
    local _mossActive=false; local _mossConn=nil
    local function makeFlags(tt_idle, tt_hit, interp, HX, HZ, HY)
        if _mossConn then _mossConn:Disconnect(); _mossConn=nil end
        local _mf_head,_mf_ball,headContact=nil,nil,false
        local _mf_ping,_mf_pingT=0.05,0
        local function strip(k) return k:gsub("^DFInt",""):gsub("^DFFlag",""):gsub("FString",""):gsub("FLog",""):gsub("^FFlag",""):gsub("^DFint",""):gsub("^FInt","") end
        local function writeTT(val)
            if not setfflag then return end
            pcall(function()
                local ck=strip("DFIntTargetTimeDelayFacctorTenths")
                if getfflag(ck)~=nil then setfflag(ck,val)
                elseif getfflag("DFIntTargetTimeDelayFacctorTenths")~=nil then setfflag("DFIntTargetTimeDelayFacctorTenths",val) end
            end)
        end
        local function writeInterp(val)
            if not setfflag then return end
            pcall(function()
                local ck=strip("FIntInterpolationMaxDelayMSec")
                if getfflag(ck)~=nil then setfflag(ck,val)
                elseif getfflag("FIntInterpolationMaxDelayMSec")~=nil then setfflag("FIntInterpolationMaxDelayMSec",val) end
            end)
        end
        task.spawn(function()
            while true do writeTT(tt_idle); writeInterp(interp); task.wait(20) end
        end)
        local function refreshMF(char) if not char then return end; _mf_head=char:FindFirstChild("Head") end
        refreshMF(lp.Character)
        lp.CharacterAdded:Connect(function(c) task.wait(); refreshMF(c); c.ChildAdded:Connect(function() refreshMF(c) end) end)
        local function getMFBall() if _mf_ball and _mf_ball.Parent then return _mf_ball end; local sys=workspace:FindFirstChild("TPSSystem"); _mf_ball=(sys and sys:FindFirstChild("TPS")) or workspace:FindFirstChild("Ball"); return _mf_ball end
        _mossConn=RunService.PreSimulation:Connect(function()
            if not _mossActive then return end
            if not _mf_head then return end
            local ball=getMFBall(); if not ball then return end
            local bp=ball.Position; local hp=_mf_head.Position
            local now=clock()
            if now-_mf_pingT>=2 then _mf_pingT=now; _mf_ping=clamp(lp:GetNetworkPing(),0.016,0.15) end
            local ahead=_mf_ping+1/60; local bv=ball.AssemblyLinearVelocity
            local predX=bp.X+bv.X*ahead; local predY=bp.Y+bv.Y*ahead; local predZ=bp.Z+bv.Z*ahead
            local dx=predX-hp.X; local dy=predY-hp.Y; local dz=predZ-hp.Z
            if dx>=-HX and dx<=HX and dz>=-HZ and dz<=HZ and dy>=1.0 and dy<=HY then
                fti(ball,_mf_head,0); fti(ball,_mf_head,1)
                if not headContact then headContact=true; writeTT(tt_hit) end
            else
                if headContact then headContact=false; writeTT(tt_idle) end
            end
        end)
    end

    -- Xeno Reach
    local xenoEnabled=false; local xenoSelectedLeg="Right Leg"; local xenoBoxSize=V3(10,10,10); local xenoConn=nil; local _xLastUpdate=0; local XUPDATE_DELAY=0.05
    local xenoVisualBox=Instance.new("Part"); xenoVisualBox.Anchored=true; xenoVisualBox.CanCollide=false; xenoVisualBox.Transparency=0.5; xenoVisualBox.Material=Enum.Material.Neon; xenoVisualBox.Color=Color3.fromRGB(255,0,0); xenoVisualBox.Size=xenoBoxSize; xenoVisualBox.CFrame=CFrame.new(0,-9999,0); xenoVisualBox.Parent=workspace
    local function xenoUpdateLegPref()
        local folder=game:GetService("Lighting"):FindFirstChild(lp.Name)
        if folder then local pref=folder:FindFirstChild("PreferredFoot"); if pref and pref:IsA("IntValue") then xenoSelectedLeg=(pref.Value==1) and "Right Leg" or "Left Leg" end end
    end
    local function xenoMakeFakeLegs(character)
        for _,v in character:GetDescendants() do if v:IsA("Motor6D") and v.Name:find("Fake") then v:Destroy() end end
        local torso=character:FindFirstChild("Torso"); if not torso then return end
        local rightLeg=character:FindFirstChild("Right Leg"); local leftLeg=character:FindFirstChild("Left Leg")
        if rightLeg then rightLeg.Transparency=1; rightLeg.Massless=true end; if leftLeg then leftLeg.Transparency=1; leftLeg.Massless=true end
        local lM=Instance.new("Part"); lM.Name="Left Leg"; lM.Size=V3(1,2,1); lM.Color=leftLeg and leftLeg.Color or Color3.fromRGB(200,200,200); lM.CanCollide=false; lM.Locked=true; lM.Parent=character
        local hL=Instance.new("Motor6D"); hL.Name="Fake Left Hip"; hL.Part0=torso; hL.Part1=lM; hL.C0=CFrame.new(-1,-1,0)*CFrame.Angles(0,math.rad(-90),0); hL.C1=CFrame.new(-0.5,1,0)*CFrame.Angles(0,math.rad(-90),0); hL.Parent=torso
        local rM=Instance.new("Part"); rM.Name="Right Leg"; rM.Size=V3(1,2,1); rM.Color=rightLeg and rightLeg.Color or Color3.fromRGB(200,200,200); rM.CanCollide=false; rM.Locked=true; rM.Parent=character
        local hR=Instance.new("Motor6D"); hR.Name="Fake Right Hip"; hR.Part0=torso; hR.Part1=rM; hR.C0=CFrame.new(1,-1,0)*CFrame.Angles(0,math.rad(90),0); hR.C1=CFrame.new(0.5,1,0)*CFrame.Angles(0,math.rad(90),0); hR.Parent=torso
    end

    -- Xeno Moss
    local _xmossActive=false; local _xmossConn=nil
    local function makeXenoMoss(BOX_X, BOX_Y, BOX_Z)
        if _xmossConn then _xmossConn:Disconnect(); _xmossConn=nil end
        if not _xmossActive then return end
        local BOX_Y_OFFSET=1.5
        local function isBoxTouching(pCF,pSz,tCF,tSz)
            local pMin=pCF.Position-pSz/2; local pMax=pCF.Position+pSz/2
            local tMin=tCF.Position-tSz/2; local tMax=tCF.Position+tSz/2
            return (pMin.X<=tMax.X and pMax.X>=tMin.X) and (pMin.Y<=tMax.Y and pMax.Y>=tMin.Y) and (pMin.Z<=tMax.Z and pMax.Z>=tMin.Z)
        end
        local headerAnim=Instance.new("Animation"); headerAnim.AnimationId="rbxassetid://301501585"
        local currentTrack=nil
        local function playHeaderAnim()
            local char=lp.Character; if not char then return end
            local hum=char:FindFirstChildOfClass("Humanoid"); if not hum then return end
            if currentTrack and currentTrack.IsPlaying then return end
            pcall(function() currentTrack=hum:LoadAnimation(headerAnim); currentTrack:Play() end)
        end
        local function fireKick()
            local tpsSys=workspace:FindFirstChild("TPSSystem"); local TPS=tpsSys and tpsSys:FindFirstChild("TPS"); if not TPS then return end
            local FE=workspace:FindFirstChild("FE"); local remote=FE and FE:FindFirstChild("System") and FE.System:FindFirstChild("Header"); if not remote then return end
            remote:FireServer(lp.UserId, TPS, "Rock'n'roll Star", "NeverFearTruth", "power=95/100")
        end
        local mossWasInside=false; local mossCooldown=false
        _xmossConn=RunService.Heartbeat:Connect(function()
            if not _xmossActive then return end
            local char=lp.Character; if not char then return end
            local head=char:FindFirstChild("Head"); if not head then return end
            local hrp=char:FindFirstChild("HumanoidRootPart"); if not hrp then return end
            local raisedCF=head.CFrame*CFrame.new(0,BOX_Y_OFFSET,0); local boxSz=V3(BOX_X,BOX_Y,BOX_Z)
            local targets={}
            local bf=workspace:FindFirstChild("Balls"); if bf then for _,b in bf:GetChildren() do if b:IsA("BasePart") then table.insert(targets,b) end end end
            local ts=workspace:FindFirstChild("TPSSystem"); if ts then for _,p in ts:GetChildren() do if p:IsA("BasePart") or p.Name=="TPS" then table.insert(targets,p) end end end
            local inside=false
            for _,target in targets do
                local predPos=target.Position+target.Velocity*0.001; local predCF=CFrame.new(predPos)*target.CFrame.Rotation
                if target.Position.Y>=hrp.Position.Y+1 then
                    if isBoxTouching(raisedCF,boxSz,predCF,target.Size) then inside=true; break end
                end
            end
            if inside and not mossWasInside and not mossCooldown then
                mossCooldown=true; playHeaderAnim(); fireKick()
                task.delay(0.3, function() mossCooldown=false end)
            end
            mossWasInside=inside
        end)
    end

    -- Extras (from punishmenttps)
    local extSg=Instance.new("ScreenGui"); extSg.Name="PunExtras"; extSg.ResetOnSpawn=false; extSg.Parent=CoreGui
    local function makeExtBtn(text,xPos,yPos,w,h)
        local btn=Instance.new("TextButton",extSg); btn.Size=UDim2.new(0,w or 115,0,h or 50); btn.Position=UDim2.new(0,xPos,0.5,yPos); btn.BackgroundColor3=Color3.fromRGB(10,10,10); btn.TextColor3=Color3.fromRGB(255,255,255); btn.Font=Enum.Font.GothamBlack; btn.TextSize=14; btn.Text=text; btn.Visible=false; Instance.new("UICorner",btn).CornerRadius=UDim.new(0.2,0); return btn
    end
    local shootBtn=makeExtBtn("blatant shot",15,-120,115,50)
    local stickBtn=makeExtBtn("STICK\nOFF",15,-57,115,115); stickBtn.TextSize=18

    -- Instant Shoot
    local shootEnabled=false; local shootConn=nil
    local ball_IS=workspace:FindFirstChild("TPSSystem") and workspace.TPSSystem:FindFirstChild("TPS") or workspace:FindFirstChild("Ball")
    local kickRemote_IS=workspace:FindFirstChild("FE") and workspace.FE:FindFirstChild("System") and workspace.FE.System:FindFirstChild("Kick")
    local lastFire=0
    local function getShootArgs() return { lp.UserId, ball_IS, 70, V3(400000,350,400000), false, true, 0, "Rock'n'roll Star", "NeverFearTruth", "power=95/100" } end

    -- Ball Stick
    local stickEnabled=false; local stickLoop=nil
    local function stickGetBall() local tps=workspace:FindFirstChild("TPSSystem"); return (tps and tps:FindFirstChild("TPS")) or workspace:FindFirstChild("Ball") end
    local function stickStart()
        if stickLoop then stickLoop:Disconnect() end; stickEnabled=true; stickBtn.Text="STICK\nON"; stickBtn.BackgroundColor3=Color3.fromRGB(0,200,80)
        stickLoop=RunService.Heartbeat:Connect(function()
            local char=lp.Character; local hrp=char and char:FindFirstChild("HumanoidRootPart"); local ball=stickGetBall(); if not (hrp and ball) then return end
            hrp.AssemblyLinearVelocity=V3zero; local camLook=Camera.CFrame.LookVector
            hrp.CFrame=CFrame.new(ball.Position+V3(0,3.1,0), ball.Position+V3(camLook.X,3.1,camLook.Z))
        end)
    end
    local function stickStop() stickEnabled=false; stickBtn.Text="STICK\nOFF"; stickBtn.BackgroundColor3=Color3.fromRGB(10,10,10); if stickLoop then stickLoop:Disconnect(); stickLoop=nil end; local char=lp.Character; if char and char:FindFirstChild("HumanoidRootPart") then char.HumanoidRootPart.Anchored=false end end
    stickBtn.MouseButton1Click:Connect(function() if stickEnabled then stickStop() else stickStart() end end)

    -- ZZZ Helper
    local zzzEnabled=false; local zzzSize=9; local zzzPart=nil; local zzzConn=nil
    local function cleanupZZZ() if zzzConn then zzzConn:Disconnect(); zzzConn=nil end; if zzzPart then zzzPart:Destroy(); zzzPart=nil end end
    local function setupZZZ()
        cleanupZZZ(); if not zzzEnabled then return end
        local part=Instance.new("Part"); part.Name="ZZZHelperPart"; part.Size=Vector3.new(zzzSize,0.001,zzzSize); part.Anchored=true; part.Transparency=1; part.BrickColor=BrickColor.new("Bright red"); part.Parent=workspace; zzzPart=part
        local tpsSystem=workspace:FindFirstChild("TPSSystem"); local tpsTarget=tpsSystem and tpsSystem:FindFirstChild("TPS")
        zzzConn=RunService.RenderStepped:Connect(function()
            if not tpsTarget or not tpsTarget.Parent then tpsSystem=workspace:FindFirstChild("TPSSystem"); tpsTarget=tpsSystem and tpsSystem:FindFirstChild("TPS") end
            if tpsTarget and zzzPart then zzzPart.Position=tpsTarget.Position-Vector3.new(0,1,0) end
        end)
    end

    -- Air Dribble Helper (from yo.lua callbacks)
    local airDribbleEnabled=false; local airDribbleSize=9; local airDribbleTransparency=1; local airDribbleMarker=nil; local airDribbleConnection=nil; local airDribbleHumanoid=nil
    local function destroyAirDribbleHelper()
        if airDribbleConnection then airDribbleConnection:Disconnect(); airDribbleConnection=nil end
        if airDribbleMarker then if airDribbleMarker.Parent then pcall(function() airDribbleMarker:Destroy() end) end; airDribbleMarker=nil end
        airDribbleHumanoid=nil
    end
    local function createAirDribbleHelper()
        destroyAirDribbleHelper(); if not airDribbleEnabled then return end
        local marker=Instance.new("Part"); marker.Name="AirDribbleHelper"; marker.Size=Vector3.new(airDribbleSize,1,airDribbleSize); marker.Anchored=true; marker.CanCollide=false; marker.CanTouch=false; marker.CanQuery=false; marker.Transparency=airDribbleTransparency; marker.Material=Enum.Material.Neon; marker.Color=Color3.fromRGB(128,128,128); marker.Parent=workspace; airDribbleMarker=marker
        airDribbleConnection=RunService.Heartbeat:Connect(function()
            if not airDribbleEnabled then return end
            if not airDribbleMarker or not airDribbleMarker.Parent then createAirDribbleHelper(); return end
            local tpsBall=getBall(); local char=lp.Character
            if not tpsBall or not tpsBall.Parent then airDribbleMarker.CFrame=CFrame.new(0,-1000,0); airDribbleMarker.CanCollide=false; airDribbleMarker.CanTouch=false; airDribbleMarker.CanQuery=false; return end
            local humanoid=airDribbleHumanoid; if not humanoid or not humanoid.Parent then humanoid=char and char:FindFirstChildOfClass("Humanoid"); airDribbleHumanoid=humanoid end
            local airborne=false; if airDribbleHumanoid then local state=airDribbleHumanoid:GetState(); airborne=(state==Enum.HumanoidStateType.Jumping or state==Enum.HumanoidStateType.Freefall) end
            airDribbleMarker.CFrame=CFrame.new(tpsBall.Position.X,tpsBall.Position.Y-1.2,tpsBall.Position.Z)
            airDribbleMarker.CanCollide=airborne; airDribbleMarker.CanTouch=airborne; airDribbleMarker.CanQuery=airborne
        end)
    end

    -- Ball Prediction (from yo.lua)
    local v8PredictionConnection; local v8PredictionFolder; local v8PredictionBeam; local v8PredictionStart; local v8PredictionEnd; local v8PredictionMarker; local v8PredictionBall
    local function v8CreatePredictionFX()
        local folder=Instance.new("Folder"); folder.Name="BallPredictionFX"; folder.Parent=workspace
        local startAttachment=Instance.new("Attachment"); startAttachment.Name="PredictStart"
        local endPart=Instance.new("Part"); endPart.Name="PredictEndPart"; endPart.Size=Vector3.new(0.1,0.1,0.1); endPart.Transparency=1; endPart.Anchored=true; endPart.CanCollide=false; endPart.Parent=folder
        local endAttachment=Instance.new("Attachment"); endAttachment.Name="PredictEnd"; endAttachment.Parent=endPart
        local beam=Instance.new("Beam"); beam.Attachment0=startAttachment; beam.Attachment1=endAttachment; beam.Width0=0.4; beam.Width1=0.4; beam.FaceCamera=true; beam.ZOffset=-0.1
        beam.Color=ColorSequence.new({ColorSequenceKeypoint.new(0,Color3.fromRGB(255,76,76)),ColorSequenceKeypoint.new(1,Color3.fromRGB(255,150,150))})
        beam.Transparency=NumberSequence.new({NumberSequenceKeypoint.new(0,0.1),NumberSequenceKeypoint.new(0.8,0.3),NumberSequenceKeypoint.new(1,1)})
        beam.Parent=folder
        local marker=Instance.new("Part"); marker.Shape=Enum.PartType.Ball; marker.Size=Vector3.new(0.8,0.8,0.8); marker.Color=Color3.fromRGB(255,76,76); marker.Material=Enum.Material.Neon; marker.Anchored=true; marker.CanCollide=false; marker.Transparency=0.2; marker.Parent=folder
        return folder, beam, startAttachment, endAttachment, marker
    end

    -- Impact Distance (from yo.lua)
    local v8ImpactFolder; local v8ImpactMarker; local v8ImpactConnection

    -- Leg Reach (from yo.lua)
    local legReachEnabledL=false; local legReachRange=10; local legReachConnectionL=nil; local legReachDisabledMotor=nil
    local function getLegAnchor(character) local humanoid=character:FindFirstChildOfClass("Humanoid"); if not humanoid then return nil end; if humanoid.RigType~=Enum.HumanoidRigType.R6 then return character:FindFirstChild("RightFoot") or character:FindFirstChild("RightLowerLeg") or character:FindFirstChild("RightUpperLeg") end; return character:FindFirstChild("Right Leg") end
    local function destroyLegReachFakes(character) if not character then return end; for _,object in ipairs(character:GetChildren()) do if object.Name=="Fake Right Leg" or object.Name=="Fake Left Leg" then object:Destroy() end end end
    local function stopLegReachL()
        if legReachConnectionL then legReachConnectionL:Disconnect(); legReachConnectionL=nil end
        if legReachDisabledMotor then pcall(function() legReachDisabledMotor.Enabled=true end); legReachDisabledMotor=nil end
        local character=lp.Character; if character then
            local humanoid=character:FindFirstChildOfClass("Humanoid")
            if humanoid and humanoid.RigType==Enum.HumanoidRigType.R6 then
                local rightLeg=character:FindFirstChild("Right Leg"); local leftLeg=character:FindFirstChild("Left Leg")
                if rightLeg then rightLeg.Transparency=0; rightLeg.Massless=false end; if leftLeg then leftLeg.Transparency=0; leftLeg.Massless=false end
            end
            destroyLegReachFakes(character)
        end
    end
    local function createLegReachFake(character, realLeg, side)
        local fake=Instance.new("Part"); fake.Name=side=="right" and "Fake Right Leg" or "Fake Left Leg"; fake.CanCollide=false; fake.Color=realLeg.Color; fake.Size=Vector3.new(1,2,1); fake.Locked=true; fake.Transparency=1; fake.Position=realLeg.Position; fake.Parent=character
        local attachment=Instance.new("Attachment"); attachment.Name=side=="right" and "RightFootAttachment" or "LeftFootAttachment"; attachment.Position=Vector3.new(0,-1,0); attachment.Parent=fake
        local motor=Instance.new("Motor6D"); motor.Name=side=="right" and "Fake Right Hip" or "Fake Left Hip"
        if side=="right" then motor.C0=CFrame.new(1,-1,0,0,0,1,0,1,0,-1,0,0); motor.C1=CFrame.new(0.5,1,0,0,0,1,0,1,0,-1,0,0)
        else motor.C0=CFrame.new(-1,-1,0,0,0,-1,0,1,0,1,0,0); motor.C1=CFrame.new(-0.5,1,0,0,0,-1,0,1,0,1,0,0) end
        motor.MaxVelocity=0.1; motor.Part0=character:FindFirstChild("Torso") or character:FindFirstChild("LowerTorso") or character:FindFirstChild("UpperTorso"); motor.Part1=fake; motor.Parent=motor.Part0
    end
    local function startLegReachL()
        if legReachConnectionL then legReachConnectionL:Disconnect(); legReachConnectionL=nil end
        local character=lp.Character; if not character then return end
        local humanoid=character:FindFirstChildOfClass("Humanoid"); local rootPart=character:FindFirstChild("HumanoidRootPart")
        if not humanoid or not rootPart then return end
        local anchor=getLegAnchor(character); if not anchor then return end
        legReachEnabledL=true
        if humanoid.RigType==Enum.HumanoidRigType.R6 then
            local rightLeg=character:FindFirstChild("Right Leg"); local leftLeg=character:FindFirstChild("Left Leg")
            if rightLeg then rightLeg.Transparency=1; rightLeg.Massless=true end; if leftLeg then leftLeg.Transparency=1; leftLeg.Massless=true end
            createLegReachFake(character,leftLeg or rightLeg,"left"); createLegReachFake(character,rightLeg or leftLeg,"right")
            local hip=character:FindFirstChild("Right Hip"); if hip then hip.Enabled=false; legReachDisabledMotor=hip end
        end
        legReachConnectionL=RunService.RenderStepped:Connect(function()
            local currentCharacter=lp.Character; if not currentCharacter then return end
            local currentRoot=currentCharacter:FindFirstChild("HumanoidRootPart"); local currentAnchor=getLegAnchor(currentCharacter); local tpsBall=getBall()
            if not currentRoot or not currentAnchor or not tpsBall then return end
            local offset=tpsBall.Position-currentRoot.Position; local distance=offset.Magnitude
            if distance>legReachRange then if distance>0 then currentAnchor.CFrame=CFrame.new(currentRoot.Position+offset.Unit*legReachRange) end else currentAnchor.CFrame=tpsBall.CFrame end
        end)
    end
    lp.CharacterAdded:Connect(function(character)
        if legReachConnectionL then legReachConnectionL:Disconnect(); legReachConnectionL=nil end; legReachDisabledMotor=nil
        character:WaitForChild("Humanoid"); character:WaitForChild("HumanoidRootPart"); task.wait(0.1)
        if legReachEnabledL and legReachRange>0 then startLegReachL() end
    end)

    -- Reacts (from yo.lua callbacks)
    local function getTPSBall() local tpsSystem=workspace:FindFirstChild("TPSSystem"); if not tpsSystem then return nil end; return tpsSystem:FindFirstChild("TPS") end
    local function applyTPSVelocity(minX,maxX,minY,maxY,minZ,maxZ)
        local tpsBall=getTPSBall(); if not tpsBall then return end; tpsBall.Velocity=Vector3.new(math.random(minX,maxX),math.random(minY,maxY),math.random(minZ,maxZ))
    end
    local function applyTPSSize(size) local tpsBall=getTPSBall(); if not tpsBall then return end; tpsBall.Size=Vector3.new(size,size,size) end
    local function setReplicationLag(value) settings():GetService("NetworkSettings").IncomingReplicationLag=value end

    local Callbacks = {}
    Callbacks.React97mzu = function() setReplicationLag(0.09); applyTPSSize(2.67); applyTPSVelocity(100,200,155,300,30,100) end
    Callbacks.ReactMauro = function() setReplicationLag(0.07); applyTPSSize(2.7); applyTPSVelocity(100,200,155,300,30,100) end
    Callbacks.ReactSuit = function() setReplicationLag(0.05); applyTPSSize(2.7); applyTPSVelocity(100,200,155,300,30,100) end
    Callbacks.ReactLyn = function() setReplicationLag(0.091); applyTPSSize(2.67); applyTPSVelocity(100,200,155,300,30,100) end
    Callbacks.ReactAttack = function() setReplicationLag(0.064); applyTPSSize(2.75); applyTPSVelocity(180,400,250,600,60,200) end
    Callbacks.ReactGoalkeeper = function() setReplicationLag(0.085); applyTPSSize(2.8); applyTPSVelocity(100,200,155,300,30,100) end
    Callbacks.ReactMidfield = function() setReplicationLag(0.054); applyTPSSize(2.7); applyTPSVelocity(100,200,155,300,30,100) end
    Callbacks.ReactDribble = function() applyTPSVelocity(100,200,155,300,30,100) end
    Callbacks.ReactKick = function() applyTPSVelocity(100,200,155,300,30,100) end
    Callbacks.ReactShoot = function() applyTPSVelocity(100,200,155,300,30,100) end
    Callbacks.ReactFlick = function() applyTPSVelocity(100,200,155,300,30,100) end
    Callbacks.ReactAlz = function() setReplicationLag(0.05); applyTPSSize(2.7); applyTPSVelocity(9000000000,9000000000,9000000000,9000000000,9000000000,9000000000) end
    Callbacks.ReactAbz = function() setReplicationLag(0.12); applyTPSSize(2.7); applyTPSVelocity(9000000000,9000000000,9000000000,9000000000,9000000000,9000000000) end
    Callbacks.ReactZank = function() setReplicationLag(0.04); applyTPSSize(2.75); applyTPSVelocity(180,400,250,600,60,200) end
    Callbacks.ReactTmbuzzz = function() setReplicationLag(0.005); applyTPSSize(3.2); applyTPSVelocity(600,1100,800,1400,300,700) end
    Callbacks.BallVelocity = function(value) local tpsBall=getTPSBall(); if not tpsBall then return end; tpsBall.Velocity=Vector3.new(value,value,value) end
    Callbacks.SetReachSize = function(text)
        local size=tonumber(text); if not size or size<=0 then return end
        if getgenv().Reach and getgenv().ReachConnection then getgenv().Reach.Size=size; getgenv().Reach.Distance=size; return end
        getgenv().Reach={Enabled=true,Size=size,Transparency=0.5,Distance=size,Color=Color3.fromRGB(255,67,76)}
        local follow=workspace:FindFirstChild("BallFollowPart") or Instance.new("Part"); follow.Name="BallFollowPart"; follow.Shape=Enum.PartType.Ball; follow.Size=Vector3.new(2.25,2.25,2.25); follow.Anchored=true; follow.CanCollide=true; follow.CanTouch=false; follow.CanQuery=false; follow.Transparency=0.5; follow.Material=Enum.Material.ForceField; follow.Color=Color3.fromRGB(255,67,76); follow.Parent=workspace
        if getgenv().ReachConnection then getgenv().ReachConnection:Disconnect() end
        getgenv().ReachConnection=RunService.RenderStepped:Connect(function()
            local reach=getgenv().Reach; if not reach then return end
            local char=lp.Character; local root=char and char:FindFirstChild("HumanoidRootPart"); local tpsBall=getTPSBall()
            if not root or not tpsBall then follow.CFrame=CFrame.new(0,-1000,0); return end
            if (tpsBall.Position-root.Position).Magnitude<=reach.Size then
                local pf=Lighting:FindFirstChild(lp.Name); pf=pf and pf:FindFirstChild("PreferredFoot"); local ln
                local hum=char:FindFirstChild("Humanoid"); if hum and hum.RigType==Enum.HumanoidRigType.R6 then ln=pf and ((pf.Value==1) and "Right Leg" or "Left Leg") or "Right Leg" else ln=pf and ((pf.Value==1) and "RightLowerLeg" or "LeftLowerLeg") or "RightLowerLeg" end
                local leg=char:FindFirstChild(ln); if leg then fti(tpsBall,leg,0); fti(tpsBall,leg,1) end
                fti(tpsBall,root,0); fti(tpsBall,root,1)
                follow.CFrame=tpsBall.CFrame
            else follow.CFrame=CFrame.new(0,-1000,0) end
        end)
        getgenv().DisableReach=function() if getgenv().ReachConnection then getgenv().ReachConnection:Disconnect(); getgenv().ReachConnection=nil end; if follow and follow.Parent then follow:Destroy() end; getgenv().Reach=nil end
    end

    -- Build Tabs (Reach, Moss, Xeno, XenoMoss, Extras)
    local ReachPage = CreatePage("Reach", "Reach Methods")
    local ReachLeft = ReachPage:AddSection("left", "Method 1 (not Xeno)")
    local ReachRight = ReachPage:AddSection("right", "Method 2 & Kersai")
    if _isXenoOrSolara then ReachLeft:AddLabel("WARNING: Xeno/Solara — use Xeno tab") end
    ReachLeft:AddToggle("Enable Reach M1", false, function(v) m1_enabled=v; if not v and m1_conn then m1_conn:Disconnect(); m1_conn=nil; return end; connectM1() end)
    ReachLeft:AddTextbox("Reach Size M1", "enter number", "5", function(v) m1_size=tonumber(v) or m1_size; if m1_enabled then connectM1() end end)
    ReachLeft:AddToggle("Enable Kersai Reach", false, function(v) kr_enabled=v; if not v and kr_conn then kr_conn:Disconnect(); kr_conn=nil; return end; connectKersai() end)
    ReachLeft:AddSlider("Kersai Radius", 3, 30, 12, function(v) kr_size=v; if kr_enabled then connectKersai() end end)
    ReachLeft:AddToggle("Downward Volley", true, function(v) kr_volley=v end)
    ReachLeft:AddToggle("Ground Mode", false, function(v) kr_groundOk=v end)
    ReachRight:AddToggle("Enable Reach M2 (Box)", false, function(v) legReachEnabled=v; if v then startReach2() else stopReach2() end end)
    ReachRight:AddSlider("Reach X", 1, 50, 5, function(v) reachSize=V3(v,reachSize.Y,reachSize.Z); reachPart.Size=reachSize; if legReachEnabled then startReach2() end end)
    ReachRight:AddSlider("Reach Y", 1, 50, 5, function(v) reachSize=V3(reachSize.X,v,reachSize.Z); reachPart.Size=reachSize; if legReachEnabled then startReach2() end end)
    ReachRight:AddSlider("Reach Z", 1, 50, 5, function(v) reachSize=V3(reachSize.X,reachSize.Y,v); reachPart.Size=reachSize; if legReachEnabled then startReach2() end end)
    ReachRight:AddTextbox("Sync XYZ", "set all axes", "5", function(v) local n=tonumber(v); if n then reachSize=V3(n,n,n); reachPart.Size=reachSize; if legReachEnabled then startReach2() end end end)
    ReachRight:AddToggle("Hide Box", false, function(v) reachBoxHidden=v; if v then reachPart.CFrame=CFrame.new(0,-9999,0); reachPart.Transparency=1 else reachPart.Transparency=transparency2 end end)

    local MossPage = CreatePage("Moss", "Head Reach")
    local MossLeft = MossPage:AddSection("left", "Moss Levels")
    if _isXenoOrSolara then MossLeft:AddLabel("WARNING: Xeno/Solara — use Xeno Moss tab") end
    MossLeft:AddToggle("Enable Moss", false, function(v) _mossActive=v; if not v and _mossConn then _mossConn:Disconnect(); _mossConn=nil end end)
    MossLeft:AddButton("Moss 15%", function() makeFlags("13","9","90",2.5,1.5,3.0) end)
    MossLeft:AddButton("Moss 25%", function() makeFlags("12","8","85",2.7,1.7,3.4) end)
    MossLeft:AddButton("Moss 50%", function() makeFlags("10","6","75",3.1,2.3,4.2) end)
    MossLeft:AddButton("Moss 75%", function() makeFlags("8","3","67",3.6,2.9,5.1) end)
    MossLeft:AddButton("Moss 100%", function() makeFlags("6","0","60",4.0,3.5,6.0) end)
    MossLeft:AddParagraph("rbxassetid://6031763426", "Info", "15% safest, 100% aggressive. Ping-aware.")

    local XenoPage = CreatePage("Xeno Reach", "Xeno/Solara Reach")
    local XenoL = XenoPage:AddSection("left", "Xeno Reach")
    XenoL:AddToggle("Enable Xeno Reach", false, function(Value)
        xenoEnabled=Value
        if xenoConn then xenoConn:Disconnect(); xenoConn=nil end
        if not Value then xenoVisualBox.CFrame=CFrame.new(0,-9999,0); return end
        xenoUpdateLegPref()
        local character=lp.Character or lp.CharacterAdded:Wait()
        local hrp=character:WaitForChild("HumanoidRootPart")
        local side=xenoSelectedLeg=="Right Leg" and "Right" or "Left"
        local hip=character:FindFirstChild(side.." Hip",true) or character:FindFirstChild(side.."Hip",true)
        if hip and hip:IsA("Motor6D") then hip:Destroy() end
        xenoMakeFakeLegs(character)
        local leg=character:FindFirstChild(xenoSelectedLeg) or character:FindFirstChild("RightLowerLeg") or character:FindFirstChild("LeftLowerLeg")
        _xLastUpdate=0
        xenoConn=RunService.RenderStepped:Connect(function()
            local now=tick(); if now-_xLastUpdate<XUPDATE_DELAY then return end; _xLastUpdate=now
            if not (xenoEnabled and hrp and leg) then return end
            xenoVisualBox.Size=xenoBoxSize; xenoVisualBox.CFrame=hrp.CFrame
            local ball=nil; local tpsSys=workspace:FindFirstChild("TPSSystem"); if tpsSys then ball=tpsSys:FindFirstChild("TPS") end
            if not ball then local bf=workspace:FindFirstChild("Balls"); if bf then ball=bf:FindFirstChildWhichIsA("BasePart") end end
            if not ball then return end
            local predictedPos=ball.Position+ball.Velocity*0.001; local diff=predictedPos-hrp.Position
            local halfX=xenoBoxSize.X*0.5; local halfY=xenoBoxSize.Y*0.5; local halfZ=xenoBoxSize.Z*0.5
            if abs(diff.X)<=halfX and abs(diff.Y)<=halfY and abs(diff.Z)<=halfZ then leg.CFrame=CFrame.new(predictedPos)*CFrame.new(0,-0.6,0) end
        end)
    end)
    XenoL:AddDropdown("Leg", {"Right Leg","Left Leg"}, "Right Leg", function(v) xenoSelectedLeg=v end)
    XenoL:AddSlider("Box X", 0, 30, 10, function(v) xenoBoxSize=V3(v,xenoBoxSize.Y,xenoBoxSize.Z); xenoVisualBox.Size=xenoBoxSize end)
    XenoL:AddSlider("Box Y", 0, 30, 10, function(v) xenoBoxSize=V3(xenoBoxSize.X,v,xenoBoxSize.Z); xenoVisualBox.Size=xenoBoxSize end)
    XenoL:AddSlider("Box Z", 0, 30, 10, function(v) xenoBoxSize=V3(xenoBoxSize.X,xenoBoxSize.Y,v); xenoVisualBox.Size=xenoBoxSize end)
    XenoL:AddTextbox("Box Transparency", "0=opaque,1=invisible", "0.5", function(v) xenoVisualBox.Transparency=tonumber(v) or 0.5 end)

    local XenoMossPage = CreatePage("Xeno Moss", "Xeno/Solara Moss")
    local XenoML = XenoMossPage:AddSection("left", "Xeno Moss")
    XenoML:AddToggle("Enable Xeno Moss", false, function(v) _xmossActive=v; if not v and _xmossConn then _xmossConn:Disconnect(); _xmossConn=nil end end)
    XenoML:AddButton("Xeno Moss 15%", function() makeXenoMoss(2.0,2.8,3.0) end)
    XenoML:AddButton("Xeno Moss 25%", function() makeXenoMoss(2.5,3.2,3.3) end)
    XenoML:AddButton("Xeno Moss 50%", function() makeXenoMoss(3.0,3.8,3.6) end)
    XenoML:AddButton("Xeno Moss 75%", function() makeXenoMoss(3.5,4.5,4.1) end)
    XenoML:AddButton("Xeno Moss 100%", function() makeXenoMoss(4.0,5.0,4.5) end)
    XenoML:AddParagraph("rbxassetid://6031763426", "Info", "Xeno/Solara only. Fires Header remote + heading animation.")

    local ExtrasPage = CreatePage("Extras", "Extra features")
    local ExtrasL = ExtrasPage:AddSection("left", "Helpers")
    local ExtrasR = ExtrasPage:AddSection("right", "Reacts & Ball")
    ExtrasL:AddToggle("ZZZ Helper", false, function(v) zzzEnabled=v; setupZZZ() end)
    ExtrasL:AddSlider("ZZZ Size", 0, 100, 9, function(val) zzzSize=val; if zzzEnabled and zzzPart then zzzPart.Size=Vector3.new(zzzSize,0.001,zzzSize) end end)
    ExtrasL:AddToggle("Air Dribble Helper", false, function(v) airDribbleEnabled=v; if v then createAirDribbleHelper() else destroyAirDribbleHelper() end end)
    ExtrasL:AddTextbox("Air Dribble Size", "platform size", "9", function(v) local val=tonumber(v); if val then airDribbleSize=val; if airDribbleMarker and airDribbleMarker.Parent then airDribbleMarker.Size=Vector3.new(val,1,val) end end end)
    ExtrasL:AddTextbox("Air Dribble Transparency", "0=opaque,1=invisible", "1", function(v) local val=tonumber(v); if val then airDribbleTransparency=val; if airDribbleMarker and airDribbleMarker.Parent then airDribbleMarker.Transparency=val end end end)
    ExtrasL:AddToggle("Instant Shoot", false, function(Value)
        shootEnabled=Value; shootBtn.Visible=Value
        if shootConn then shootConn:Disconnect(); shootConn=nil end
        if not Value then return end
        if not ball_IS or not kickRemote_IS then return end
        shootConn=RunService.PreSimulation:Connect(function()
            local char=lp.Character; if not char then return end
            local hrp=char:FindFirstChild("HumanoidRootPart"); if not hrp then return end
            local now=clock(); if (hrp.Position-ball_IS.Position).Magnitude<=10 and (now-lastFire)>=0 then lastFire=now; pcall(function() kickRemote_IS:FireServer(unpack(getShootArgs())) end) end
        end)
    end)
    shootBtn.MouseButton1Click:Connect(function() if not ball_IS or not kickRemote_IS then return end; pcall(function() kickRemote_IS:FireServer(unpack(getShootArgs())) end) end)
    ExtrasL:AddToggle("Ball Stick", false, function(Value) stickBtn.Visible=Value; if not Value then stickStop() end end)
    ExtrasL:AddToggle("Ball Prediction", false, function(enabled)
        if enabled then
            if v8PredictionConnection then return end
            v8PredictionFolder,v8PredictionBeam,v8PredictionStart,v8PredictionEnd,v8PredictionMarker=v8CreatePredictionFX()
            v8PredictionConnection=RunService.RenderStepped:Connect(function()
                local ball=getBall(); local active=ball and ball.AssemblyLinearVelocity.Magnitude>0.5
                if not active then v8PredictionFolder.Parent=nil; local oldParent=v8PredictionStart.Parent; if oldParent and oldParent:IsA("BasePart") and oldParent.Name=="Football" then v8PredictionStart.Parent=nil end; v8PredictionBall=nil; return end
                if ball~=v8PredictionBall then v8PredictionStart.Parent=ball; v8PredictionBall=ball end
                v8PredictionFolder.Parent=workspace; local position=ball.Position; local velocity=ball.AssemblyLinearVelocity; local gravity=Vector3.new(0,-workspace.Gravity,0)
                local predicted=position+velocity*1.2+(0.5*gravity)*1.44; local midpoint=position+(0.5*velocity)*1.2
                v8PredictionEnd.Parent.Position=predicted; v8PredictionBeam.CurveSize0=(midpoint-position).Magnitude*0.5; v8PredictionBeam.CurveSize1=(predicted-midpoint).Magnitude*0.5
                v8PredictionStart.WorldAxis=(midpoint-position).Unit; v8PredictionEnd.WorldAxis=(predicted-midpoint).Unit; v8PredictionMarker.Position=predicted
            end)
        else
            if v8PredictionConnection then v8PredictionConnection:Disconnect(); v8PredictionConnection=nil end
            if v8PredictionFolder then v8PredictionFolder:Destroy(); v8PredictionFolder=nil end
            v8PredictionBeam=nil; v8PredictionStart=nil; v8PredictionEnd=nil; v8PredictionMarker=nil; v8PredictionBall=nil
        end
    end)
    ExtrasL:AddToggle("Impact Distance", false, function(enabled)
        if enabled then
            v8ImpactFolder=Instance.new("Folder"); v8ImpactFolder.Name="ImpactDistanceFX"; v8ImpactFolder.Parent=workspace
            v8ImpactMarker=Instance.new("Part", v8ImpactFolder); v8ImpactMarker.Shape=Enum.PartType.Cylinder; v8ImpactMarker.Size=Vector3.new(0.1,4,4); v8ImpactMarker.Color=Color3.fromRGB(255,76,76); v8ImpactMarker.Material=Enum.Material.Neon; v8ImpactMarker.Anchored=true; v8ImpactMarker.CanCollide=false; v8ImpactMarker.Transparency=0.4; v8ImpactMarker.CFrame=CFrame.new()*CFrame.Angles(0,0,math.rad(90))
            v8ImpactConnection=RunService.RenderStepped:Connect(function()
                local ball=getBall(); if not ball or ball.AssemblyLinearVelocity.Magnitude<=0.5 then v8ImpactFolder.Parent=nil; return end
                v8ImpactFolder.Parent=workspace; local position=ball.Position; local velocity=ball.AssemblyLinearVelocity; local gravity=Vector3.new(0,-workspace.Gravity,0)
                local raycastParams=RaycastParams.new(); raycastParams.FilterType=Enum.RaycastFilterType.Exclude; raycastParams.FilterDescendantsInstances={ball,v8ImpactFolder}
                local impactPosition
                for t=0,3,0.05 do local p0=position+velocity*t+(0.5*gravity)*(t^2); local nextT=t+0.05; local p1=position+velocity*nextT+(0.5*gravity)*(nextT^2); local result=workspace:Raycast(p0,p1-p0,raycastParams); if result then impactPosition=result.Position; break end end
                if impactPosition then v8ImpactMarker.Transparency=0.4; v8ImpactMarker.CFrame=CFrame.new(impactPosition)*CFrame.Angles(0,0,math.rad(90)) else v8ImpactMarker.Transparency=1 end
            end)
        else
            if v8ImpactConnection then v8ImpactConnection:Disconnect(); v8ImpactConnection=nil end
            if v8ImpactFolder then v8ImpactFolder:Destroy(); v8ImpactFolder=nil end; v8ImpactMarker=nil
        end
    end)
    ExtrasL:AddTextbox("Leg Reach [R6/R15]", "teleports leg to ball", "", function(text)
        local trimmed=text:gsub("^%s*(.-)%s*$","%1"); local value=tonumber(trimmed)
        if trimmed=="" or not value or value<=0 then legReachEnabledL=false; legReachRange=10; stopLegReachL(); return end
        legReachRange=value; if not legReachConnectionL then startLegReachL() elseif not legReachEnabledL then startLegReachL() end
    end)

    -- Reacts buttons
    ExtrasR:AddButton("97mzu React", Callbacks.React97mzu)
    ExtrasR:AddButton("0_Mauro React", Callbacks.ReactMauro)
    ExtrasR:AddButton("Suit React", Callbacks.ReactSuit)
    ExtrasR:AddButton("0_lyn React", Callbacks.ReactLyn)
    ExtrasR:AddButton("Dribble React", Callbacks.ReactDribble)
    ExtrasR:AddButton("Kick React", Callbacks.ReactKick)
    ExtrasR:AddButton("Shoot React", Callbacks.ReactShoot)
    ExtrasR:AddButton("Flick React", Callbacks.ReactFlick)
    ExtrasR:AddButton("Alz React", Callbacks.ReactAlz)
    ExtrasR:AddButton("Abz React", Callbacks.ReactAbz)
    ExtrasR:AddButton("zAnk React", Callbacks.ReactZank)
    ExtrasR:AddButton("Tmbuzzz React", Callbacks.ReactTmbuzzz)
    ExtrasR:AddButton("Attack React", Callbacks.ReactAttack)
    ExtrasR:AddButton("GoalKepper React", Callbacks.ReactGoalkeeper)
    ExtrasR:AddButton("MidField React", Callbacks.ReactMidfield)
    ExtrasR:AddSlider("Ball Velocity", 0, 100, 85, Callbacks.BallVelocity)
    ExtrasR:AddTextbox("Set Reach Size", "enter size", "5", Callbacks.SetReachSize)

    -- Server buttons
    CreateSmallButton(ServerContent, "Hop Server (New)", function() local HttpService=game:GetService("HttpService"); local TeleportService=game:GetService("TeleportService"); local player=game:GetService("Players").LocalPlayer; local servers={}; local cursor=""; repeat local page; local ok=pcall(function() local url="https://games.roblox.com/v1/games/"..tostring(game.PlaceId).."/servers/Public?sortOrder=Asc&limit=100"..(cursor~="" and ("&cursor="..cursor) or ""); page=HttpService:JSONDecode(game:HttpGet(url)) end); if ok and page and page.data then for _,server in ipairs(page.data) do if server.id~=game.JobId and server.playing<server.maxPlayers then table.insert(servers,server) end end; cursor=page.nextPageCursor or "" else cursor="" end until cursor==""; if #servers>0 then local server=servers[math.random(1,math.min(3,#servers))]; TeleportService:TeleportToPlaceInstance(game.PlaceId,server.id,player) else TeleportService:Teleport(game.PlaceId,player) end end)
    CreateSmallButton(ServerContent, "Hop Server (Old)", function() local HttpService=game:GetService("HttpService"); local TeleportService=game:GetService("TeleportService"); local player=game:GetService("Players").LocalPlayer; local servers={}; local cursor=""; repeat local page; local ok=pcall(function() local url="https://games.roblox.com/v1/games/"..tostring(game.PlaceId).."/servers/Public?sortOrder=Desc&limit=100"..(cursor~="" and ("&cursor="..cursor) or ""); page=HttpService:JSONDecode(game:HttpGet(url)) end); if ok and page and page.data then for _,server in ipairs(page.data) do if server.id~=game.JobId and server.playing<server.maxPlayers then table.insert(servers,server) end end; cursor=page.nextPageCursor or "" else cursor="" end until cursor==""; if #servers>0 then local server=servers[math.random(1,math.min(3,#servers))]; TeleportService:TeleportToPlaceInstance(game.PlaceId,server.id,player) else TeleportService:Teleport(game.PlaceId,player) end end)
    CreateSmallButton(ServerContent, "Rejoin Server", function() game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId,game.JobId,game:GetService("Players").LocalPlayer) end)
    CreateSmallButton(JobContent, "Join JobId", function() local jobId=JobIdBox.Text; if jobId~="" then game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId,jobId,game:GetService("Players").LocalPlayer) end end)
    CreateSmallButton(JobContent, "Copy JobId", function() if setclipboard then setclipboard(game.JobId) end end)

    SwitchTopTab("Profile", ProfileButton, ProfileIcon)
end

BuildRecoveredKeySystem(BuildRecoveredMainHub)
