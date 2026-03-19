local ShauryaHub = Instance.new("ScreenGui")
local MainFrame = Instance.new("Frame")
local Title = Instance.new("TextLabel")
local Container = Instance.new("ScrollingFrame")
local Layout = Instance.new("UIListLayout")

ShauryaHub.Name = "ShauryaHub"
ShauryaHub.ResetOnSpawn = false
ShauryaHub.Parent = game:GetService("CoreGui")

MainFrame.Name = "MainFrame"
MainFrame.Parent = ShauryaHub
MainFrame.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
MainFrame.Position = UDim2.new(0.3, 0, 0.3, 0)
MainFrame.Size = UDim2.new(0, 300, 0, 250)
MainFrame.Active = true
MainFrame.Draggable = true

Title.Name = "Title"
Title.Parent = MainFrame
Title.BackgroundColor3 = Color3.fromRGB(100, 0, 0)
Title.Size = UDim2.new(1, 0, 0, 35)
Title.Text = "SHAURYA HUB | OP"
Title.TextColor3 = Color3.white
Title.Font = Enum.Font.GothamBold
Title.TextSize = 16

Container.Parent = MainFrame
Container.BackgroundTransparency = 1
Container.Position = UDim2.new(0, 5, 0, 40)
Container.Size = UDim2.new(1, -10, 1, -45)
Container.CanvasSize = UDim2.new(0, 0, 1.5, 0)

Layout.Parent = Container
Layout.Padding = UDim.new(0, 5)

local function NewButton(txt, func)
    local btn = Instance.new("TextButton")
    btn.Size = UDim2.new(1, -10, 0, 35)
    btn.Text = txt
    btn.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
    btn.TextColor3 = Color3.white
    btn.Font = Enum.Font.Gotham
    btn.Parent = Container
    btn.MouseButton1Click:Connect(func)
end

NewButton("🛡️ GOD MODE", function()
    game.Players.LocalPlayer.Character.Humanoid.MaxHealth = math.huge
    game.Players.LocalPlayer.Character.Humanoid.Health = math.huge
end)

NewButton("⚡ SPEED BLITZ", function()
    game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 100
end)

NewButton("🚀 INF JUMP", function()
    game:GetService("UserInputService").JumpRequest:Connect(function()
        game.Players.LocalPlayer.Character:FindFirstChildOfClass('Humanoid'):ChangeState("Jumping")
    end)
end)

NewButton("👆 INSTANT INTERACT", function()
    game:GetService("ProximityPromptService").PromptButtonHoldBegan:Connect(function(p)
        p.HoldDuration = 0
        if fireproximityprompt then fireproximityprompt(p) end
    end)
end)

NewButton("❌ CLOSE", function()
    ShauryaHub:Destroy()
end)
