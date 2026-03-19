local ShauryaHub = {
    [6161049307] = "https://raw.githubusercontent.com/Ratkinator/RatX/refs/heads/main/Pixel%20Blade.lua",
    [9266873836] = "https://raw.githubusercontent.com/Ratkinator/RatX/refs/heads/main/AFSE.lua",
    [9363735110] = "https://raw.githubusercontent.com/Ratkinator/RatX/refs/heads/main/Escape%20Tsunami%20for%20Brainrot.lua",
    [9497625867] = "https://raw.githubusercontent.com/Ratkinator/RatX/refs/heads/main/Escape%20logs%20for%20Brainrot.lua",
    [8967864843] = "https://raw.githubusercontent.com/Ratkinator/RatX/refs/heads/main/You%20vs%20Homer.lua",
    [9344307274] = "https://raw.githubusercontent.com/Ratkinator/RatX/refs/heads/main/Break%20a%20Lucky%20Block.lua",
    [9527851429] = "https://raw.githubusercontent.com/Ratkinator/RatX/refs/heads/main/Save%20brainrots%20from%20lava.lua",
    [9563386957] = "https://raw.githubusercontent.com/Ratkinator/RatX/refs/heads/main/Climb%20for%20brainrots.lua",
    [8144728961] = "https://raw.githubusercontent.com/Ratkinator/RatX/refs/heads/main/Abyss.lua",
    [9509842868] = "https://raw.githubusercontent.com/Ratkinator/RatX/refs/heads/main/Garden%20Horizons.lua",
}

-- [[ SHAURYA HUB GLOBAL FEATURES ]] --
local function EnableGlobalHacks()
    -- Infinite Jump
    game:GetService("UserInputService").JumpRequest:Connect(function()
        local player = game.Players.LocalPlayer
        if player.Character and player.Character:FindFirstChildOfClass("Humanoid") then
            player.Character:FindFirstChildOfClass("Humanoid"):ChangeState("Jumping")
        end
    end)
    print("Shaurya Hub: Infinite Jump Enabled globally!")
end

-- [[ LOADER LOGIC ]] --
local PlaceId = game.PlaceId

if ShauryaHub[PlaceId] then
    print("Shaurya Hub: Game Detected! Loading specific script...")
    EnableGlobalHacks()
    loadstring(game:HttpGet(ShauryaHub[PlaceId]))()
else
    print("Shaurya Hub: Game not in list, but Infinite Jump is ACTIVE!")
    EnableGlobalHacks()
end
