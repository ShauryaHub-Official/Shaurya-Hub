local ShauryaHub = Instance.new("ScreenGui")
local MainFrame = Instance.new("Frame")
local Title = Instance.new("TextLabel")
local Container = Instance.new("ScrollingFrame")
local Layout = Instance.new("UIListLayout")
local MinimizeBtn = Instance.new("TextButton")

ShauryaHub.Name = "ShauryaHub"
ShauryaHub.ResetOnSpawn = false
ShauryaHub.Parent = game:GetService("CoreGui")

MainFrame.Name = "MainFrame"
MainFrame.Parent = ShauryaHub
MainFrame.BackgroundColor3 = Color3.fromRGB(10, 10, 10)
MainFrame.Position = UDim2.new(0.35, 0, 0.3, 0)
MainFrame.Size = UDim2.new(0, 350, 0, 350)
MainFrame.Active = true
MainFrame.Draggable = true
MainFrame.Visible = true

Title.Name = "Title"
Title.Parent = MainFrame
Title.BackgroundColor3 = Color3.fromRGB(60, 0, 0)
Title.Size = UDim2.new(1, 0, 0, 40)
Title.Text = "SHAURYA HUB | OP MENU"
Title.TextColor3 = Color3.fromRGB(255, 50, 50)
Title.Font = Enum.Font.GothamBold
Title.TextSize = 18

Container.Parent = MainFrame
Container.BackgroundTransparency = 1
Container.Position = UDim2.new(0, 5, 0, 45)
Container.Size = UDim2.new(1, -10, 1, -55)
Container.CanvasSize = UDim2.new(0, 0, 2, 0)
Container.ScrollBarThickness = 3

Layout.Parent = Container
Layout.Padding = UDim.new(0, 8)

-- Minimize Button Logic
MinimizeBtn.Name = "MinimizeBtn"
MinimizeBtn.Parent = ShauryaHub
MinimizeBtn.BackgroundColor3 = Color3.fromRGB(80, 0, 0)
MinimizeBtn.Position = UDim2.new(0, 10, 0.5, 0)
MinimizeBtn.Size = UDim2.new(0, 40, 0, 40)
MinimizeBtn.Text = "S"
MinimizeBtn.TextColor3 = Color3.white
MinimizeBtn.Font = Enum.Font.GothamBold
MinimizeBtn.TextSize = 20
local btnCorner = Instance.new("UICorner")
btnCorner.CornerRadius = UDim.new(1, 0)
btnCorner.Parent = MinimizeBtn

MinimizeBtn.MouseButton1Click:Connect(function()
    MainFrame.Visible = not MainFrame.Visible
end)

local function AddButton(txt, func)
    local btn = Instance.new("TextButton")
    btn.Size = UDim2.new(1, -10, 0, 40)
    btn.Text = txt
    btn.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
    btn.TextColor3 = Color3.white
    btn.Font = Enum.Font.GothamSemibold
    btn.TextSize = 14
    btn.Parent = Container
    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, 6)
    corner.Parent = btn
    btn.MouseButton1Click:Connect(func)
end

-- [[ THE OPTIONS ]] --

AddButton("🛡️ GOD MODE", function()
    local lp = game.Players.LocalPlayer
    if lp.Character:FindFirstChild("Humanoid") then
        lp.Character.Humanoid.MaxHealth = math.huge
        lp.Character.Humanoid.Health = math.huge
    end
    lp.CharacterChildAdded:Connect(function(child)
        if child:IsA("Humanoid") then
            child.MaxHealth = math.huge
            child.Health = math.huge
        end
    end)
end)

AddButton("⚡ INSTANT INTERACT", function()
    game:GetService("ProximityPromptService").PromptButtonHoldBegan:Connect(function(prompt)
        prompt.HoldDuration = 0
        fireproximityprompt(prompt)
    end)
end)

AddButton("🚀 INFINITE JUMP", function()
    game:GetService("UserInputService").JumpRequest:Connect(function()
        game.Players.LocalPlayer.Character:FindFirstChildOfClass('Humanoid'):ChangeState("Jumping")
    end)
end)

AddButton("🏃 SPEED BLITZ", function()
    game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 100
end)

AddButton("👻 NOCLIP", function()
    game:GetService("RunService").Stepped:Connect(function()
        for _, v in pairs(game.Players.LocalPlayer.Character:GetDescendants()) do
            if v:IsA("BasePart") then v.CanCollide = false end
        end
    end)
end)

AddButton("👁️ ESP", function()
    for _, player in pairs(game.Players:GetChildren()) do
        if player ~= game.Players.LocalPlayer and player.Character then
            local highlight = Instance.new("Highlight")
            highlight.Parent = player.Character
            highlight.FillColor = Color3.fromRGB(255, 0, 0)
        end
    end)
end)

AddButton("❌ CLOSE HUB", function()
    ShauryaHub:Destroy()
end)
