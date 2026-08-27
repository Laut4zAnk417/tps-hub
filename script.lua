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
    local Players = game:GetService("Players")
    local TweenService = game:GetService("TweenService")
    local UserInputService = game:GetService("UserInputService")
    local CoreGui = game:GetService("CoreGui")
    local RunService = game:GetService("RunService")
    local MarketplaceService = game:GetService("MarketplaceService")
    local Lighting = game:GetService("Lighting")
    local TextService = game:GetService("TextService")
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

    local _execName = "unknown"
    pcall(function()
        if identifyexecutor then _execName = identifyexecutor():lower()
        elseif getexecutorname then _execName = getexecutorname():lower() end
    end)
    local _isXenoOrSolara = (_execName:find("xeno") or _execName:find("solara")) or (typeof(XENO) ~= "nil") or (typeof(SYN) ~= "nil" and typeof(SYN.request) ~= "nil" and _execName:find("solara")) or false
    _isXenoOrSolara = _isXenoOrSolara == true

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

    local ToggleGui = Instance.new("ScreenGui", coreGuiParentWorked and CoreGui or PlayerGui); ToggleGui.Name="97mzuToggleButton"; ToggleGui.ResetOnSpawn=false
    local ToggleButton = Instance.new("TextButton", ToggleGui); ToggleButton.Size=UDim2.fromOffset(45,46); ToggleButton.Position=UDim2.new(0,20,0.5,-20); ToggleButton.BackgroundColor3=Color3.fromRGB(25,25,25); ToggleButton.BackgroundTransparency=1; ToggleButton.Text=""; ToggleButton.TextColor3=Theme.TextWhite; ToggleButton.Font=Enum.Font.GothamBold; ToggleButton.TextSize=15; ToggleButton.ZIndex=2; addCorner(ToggleButton,45)
    local ToggleImage = Instance.new("ImageLabel", ToggleButton); ToggleImage.Size=UDim2.fromScale(1,1); ToggleImage.BackgroundTransparency=1; ToggleImage.Image="rbxassetid://137299848204352"; ToggleImage.ZIndex=1; addCorner(ToggleImage,45)
    ToggleButton.MouseButton1Click:Connect(function() MainFrame.Visible = not MainFrame.Visible end)

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

    local PageList = Instance.new("ScrollingFrame", MainFrame); PageList.Size=UDim2.new(0,150,1,-86); PageList.Position=UDim2.new(0,0,0,36); PageList.BackgroundColor3=Theme.Sidebar; PageList.BorderSizePixel=0; PageList.ScrollBarThickness=2; PageList.ScrollBarImageColor3=Theme.Accent; PageList.CanvasSize=UDim2.new(0,0,0,0); PageList.AutomaticCanvasSize=Enum.AutomaticSize.Y; PageList.Visible=false
    local pageListLayout=Instance.new("UIListLayout", PageList); pageListLayout.Padding=UDim.new(0,2); pageListLayout.SortOrder=Enum.SortOrder.LayoutOrder
    local pageListPadding=Instance.new("UIPadding", PageList); pageListPadding.PaddingTop=UDim.new(0,6); pageListPadding.PaddingRight=UDim.new(0,4)

    local PagesContainer = Instance.new("Frame", MainFrame); PagesContainer.Size=UDim2.new(1,-150,1,-86); PagesContainer.Position=UDim2.new(0,150,0,36); PagesContainer.BackgroundTransparency=1; PagesContainer.Visible=false
    local NonTabsContainer = Instance.new("Frame", MainFrame); NonTabsContainer.Size=UDim2.new(1,0,1,-86); NonTabsContainer.Position=UDim2.new(0,0,0,36); NonTabsContainer.BackgroundTransparency=1; NonTabsContainer.Visible=true

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

    local SettingsLeft, SettingsPanel = CreateNonTabPanel()
    local aboutCard=Instance.new("Frame", SettingsLeft); aboutCard.Size=UDim2.new(1,0,0,75); aboutCard.BackgroundColor3=Theme.CardBG; addCorner(aboutCard,6)
    local aboutTitle=Instance.new("TextLabel", aboutCard); aboutTitle.Size=UDim2.new(1,-20,1,0); aboutTitle.Position=UDim2.new(0,10,0,-28); aboutTitle.BackgroundTransparency=1; aboutTitle.Text="About"; aboutTitle.TextColor3=Theme.TextWhite; aboutTitle.Font=Theme.Font; aboutTitle.TextSize=12; aboutTitle.TextXAlignment=Enum.TextXAlignment.Left; aboutTitle.TextYAlignment=Enum.TextYAlignment.Center
    local aboutBody=Instance.new("TextLabel", aboutCard); aboutBody.Size=UDim2.new(1,-20,1,0); aboutBody.Position=UDim2.new(0,10,0,0); aboutBody.BackgroundTransparency=1; aboutBody.Text="\nCRACKED TPS Hub\nMobile & PC\nReacts, Auto Inf, Avatar Steal"; aboutBody.TextColor3=Theme.Accent; aboutBody.Font=Theme.Font; aboutBody.TextSize=11; aboutBody.TextXAlignment=Enum.TextXAlignment.Left; aboutBody.TextYAlignment=Enum.TextYAlignment.Center

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
                        local bounds=TextService:GetTextSize(desc.Text, desc.TextSize, desc.Font, Vector2.new(availableWidth,10000))
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
                        local bounds=TextService:GetTextSize(description,9,Enum.Font.Gotham,Vector2.new(content.AbsoluteSize.X-16,1000))
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

    -- === GAME LOGIC ===
    local function getTPSBall()
        local tpsSystem = workspace:FindFirstChild("TPSSystem")
        if not tpsSystem then return nil end
        return tpsSystem:FindFirstChild("TPS")
    end

    local function getBall()
        local sys = workspace:FindFirstChild("TPSSystem")
        return (sys and sys:FindFirstChild("TPS")) or workspace:FindFirstChild("Ball")
    end

    -- Reacts (solo los que NO usan setfflag)
    local function applyTPSVelocity(minX, maxX, minY, maxY, minZ, maxZ)
        local tpsBall = getTPSBall()
        if not tpsBall then return end
        tpsBall.Velocity = Vector3.new(math.random(minX, maxX), math.random(minY, maxY), math.random(minZ, maxZ))
    end

    local function applyTPSSize(size)
        local tpsBall = getTPSBall()
        if not tpsBall then return end
        tpsBall.Size = Vector3.new(size, size, size)
    end

    local function setReplicationLag(value)
        pcall(function()
            settings():GetService("NetworkSettings").IncomingReplicationLag = value
        end)
    end

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
    Callbacks.BallVelocity = function(value)
        local tpsBall = getTPSBall()
        if not tpsBall then return end
        tpsBall.Velocity = Vector3.new(value, value, value)
    end
    Callbacks.SetReachSize = function(text)
        local size = tonumber(text)
        if not size or size <= 0 then return end
        if getgenv().Reach and getgenv().ReachConnection then
            getgenv().Reach.Size = size
            getgenv().Reach.Distance = size
            return
        end
        getgenv().Reach = {Enabled = true, Size = size, Transparency = 0.5, Distance = size, Color = Color3.fromRGB(255,67,76)}
        local follow = workspace:FindFirstChild("BallFollowPart") or Instance.new("Part")
        follow.Name = "BallFollowPart"
        follow.Shape = Enum.PartType.Ball
        follow.Size = Vector3.new(2.25,2.25,2.25)
        follow.Anchored = true
        follow.CanCollide = true
        follow.CanTouch = false
        follow.CanQuery = false
        follow.Transparency = 0.5
        follow.Material = Enum.Material.ForceField
        follow.Color = Color3.fromRGB(255,67,76)
        follow.Parent = workspace
        if getgenv().ReachConnection then getgenv().ReachConnection:Disconnect() end
        getgenv().ReachConnection = RunService.RenderStepped:Connect(function()
            local reach = getgenv().Reach
            if not reach then return end
            local char = lp.Character
            local root = char and char:FindFirstChild("HumanoidRootPart")
            local tpsBall = getTPSBall()
            if not root or not tpsBall then follow.CFrame = CFrame.new(0,-1000,0); return end
            if (tpsBall.Position - root.Position).Magnitude <= reach.Size then
                local pf = Lighting:FindFirstChild(lp.Name)
                pf = pf and pf:FindFirstChild("PreferredFoot")
                local ln
                local hum = char:FindFirstChild("Humanoid")
                if hum and hum.RigType == Enum.HumanoidRigType.R6 then
                    ln = pf and ((pf.Value == 1) and "Right Leg" or "Left Leg") or "Right Leg"
                else
                    ln = pf and ((pf.Value == 1) and "RightLowerLeg" or "LeftLowerLeg") or "RightLowerLeg"
                end
                local leg = char:FindFirstChild(ln)
                if leg then fti(tpsBall, leg, 0); fti(tpsBall, leg, 1) end
                fti(tpsBall, root, 0); fti(tpsBall, root, 1)
                follow.CFrame = tpsBall.CFrame
            else
                follow.CFrame = CFrame.new(0,-1000,0)
            end
        end)
        getgenv().DisableReach = function()
            if getgenv().ReachConnection then getgenv().ReachConnection:Disconnect(); getgenv().ReachConnection = nil end
            if follow and follow.Parent then follow:Destroy() end
            getgenv().Reach = nil
        end
    end

    -- Auto Inf: Ball Stick
    local stickEnabled = false
    local stickLoop = nil
    local stickBtn = nil

    local function stickGetBall()
        local tps = workspace:FindFirstChild("TPSSystem")
        return (tps and tps:FindFirstChild("TPS")) or workspace:FindFirstChild("Ball")
    end

    local function stickStart()
        if stickLoop then stickLoop:Disconnect() end
        stickEnabled = true
        stickLoop = RunService.Heartbeat:Connect(function()
            local char = lp.Character
            local hrp = char and char:FindFirstChild("HumanoidRootPart")
            local ball = stickGetBall()
            if not (hrp and ball) then return end
            hrp.AssemblyLinearVelocity = V3zero
            local camLook = Camera.CFrame.LookVector
            hrp.CFrame = CFrame.new(ball.Position + V3(0,3.1,0), ball.Position + V3(camLook.X,3.1,camLook.Z))
        end)
    end

    local function stickStop()
        stickEnabled = false
        if stickLoop then stickLoop:Disconnect(); stickLoop = nil end
        local char = lp.Character
        if char and char:FindFirstChild("HumanoidRootPart") then
            char.HumanoidRootPart.Anchored = false
        end
    end

    -- Auto Inf: ZZZ Helper
    local zzzEnabled = false
    local zzzSize = 9
    local zzzPart = nil
    local zzzConn = nil

    local function cleanupZZZ()
        if zzzConn then zzzConn:Disconnect(); zzzConn = nil end
        if zzzPart then zzzPart:Destroy(); zzzPart = nil end
    end

    local function setupZZZ()
        cleanupZZZ()
        if not zzzEnabled then return end
        local part = Instance.new("Part")
        part.Name = "ZZZHelperPart"
        part.Size = Vector3.new(zzzSize, 0.001, zzzSize)
        part.Anchored = true
        part.Transparency = 1
        part.BrickColor = BrickColor.new("Bright red")
        part.Parent = workspace
        zzzPart = part
        local tpsSystem = workspace:FindFirstChild("TPSSystem")
        local tpsTarget = tpsSystem and tpsSystem:FindFirstChild("TPS")
        zzzConn = RunService.RenderStepped:Connect(function()
            if not tpsTarget or not tpsTarget.Parent then
                tpsSystem = workspace:FindFirstChild("TPSSystem")
                tpsTarget = tpsSystem and tpsSystem:FindFirstChild("TPS")
            end
            if tpsTarget and zzzPart then
                zzzPart.Position = tpsTarget.Position - Vector3.new(0,1,0)
            end
        end)
    end

    -- Avatar Steal (de yo.lua)
    local function v8CopyAvatar(userId, character)
        if not character then return end
        local humanoid = character:FindFirstChildOfClass("Humanoid")
        if not humanoid then return end

        -- Stop animations
        local animator = humanoid:FindFirstChildOfClass("Animator")
        if animator then
            for _, track in ipairs(animator:GetPlayingAnimationTracks()) do
                track:Stop()
            end
        end

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

        -- Remove old accessories
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

        -- Copy appearance objects
        for _, object in ipairs(appearanceModel:GetDescendants()) do
            pcall(function()
                if object:IsA("Shirt") or object:IsA("Pants") or object:IsA("BodyColors") or object:IsA("CharacterMesh") then
                    object:Clone().Parent = character
                end
                if object:IsA("Accessory") then
                    humanoid:AddAccessory(object:Clone())
                end
            end)
        end

        -- Copy face
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
        local character = lp.Character
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

    -- Build Tabs
    local ExtrasPage = CreatePage("Extras", "Reacts, Auto Inf, Avatar Steal")
    local ExtrasL = ExtrasPage:AddSection("left", "Auto Inf & Avatar")
    local ExtrasR = ExtrasPage:AddSection("right", "Reacts")

    -- Auto Inf: Ball Stick
    ExtrasL:AddToggle("Ball Stick (Auto Inf)", false, function(Value)
        if Value then stickStart() else stickStop() end
    end)

    -- Auto Inf: ZZZ Helper
    ExtrasL:AddToggle("ZZZ Helper", false, function(v)
        zzzEnabled = v
        setupZZZ()
    end)
    ExtrasL:AddSlider("ZZZ Size", 0, 100, 9, function(val)
        zzzSize = val
        if zzzEnabled and zzzPart then
            zzzPart.Size = Vector3.new(zzzSize, 0.001, zzzSize)
        end
    end)

    -- Avatar Steal
    ExtrasL:AddTextbox("Avatar Steal", "Enter username", "", function(text)
        Callbacks.AvatarSteal(text)
    end)

    -- Reacts
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
    CreateSmallButton(ServerContent, "Hop Server (New)", function()
        local HttpService = game:GetService("HttpService")
        local TeleportService = game:GetService("TeleportService")
        local player = game:GetService("Players").LocalPlayer
        local servers = {}
        local cursor = ""
        repeat
            local page
            local ok = pcall(function()
                local url = "https://games.roblox.com/v1/games/"..tostring(game.PlaceId).."/servers/Public?sortOrder=Asc&limit=100"..(cursor~="" and ("&cursor="..cursor) or "")
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
            TeleportService:TeleportToPlaceInstance(game.PlaceId, server.id, player)
        else
            TeleportService:Teleport(game.PlaceId, player)
        end
    end)

    CreateSmallButton(ServerContent, "Hop Server (Old)", function()
        local HttpService = game:GetService("HttpService")
        local TeleportService = game:GetService("TeleportService")
        local player = game:GetService("Players").LocalPlayer
        local servers = {}
        local cursor = ""
        repeat
            local page
            local ok = pcall(function()
                local url = "https://games.roblox.com/v1/games/"..tostring(game.PlaceId).."/servers/Public?sortOrder=Desc&limit=100"..(cursor~="" and ("&cursor="..cursor) or "")
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
            TeleportService:TeleportToPlaceInstance(game.PlaceId, server.id, player)
        else
            TeleportService:Teleport(game.PlaceId, player)
        end
    end)

    CreateSmallButton(ServerContent, "Rejoin Server", function()
        game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId, game.JobId, game:GetService("Players").LocalPlayer)
    end)

    CreateSmallButton(JobContent, "Join JobId", function()
        local jobId = JobIdBox.Text
        if jobId ~= "" then
            game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId, jobId, game:GetService("Players").LocalPlayer)
        end
    end)

    CreateSmallButton(JobContent, "Copy JobId", function()
        if setclipboard then setclipboard(game.JobId) end
    end)

    SwitchTopTab("Profile", ProfileButton, ProfileIcon)
end

BuildRecoveredKeySystem(BuildRecoveredMainHub)
