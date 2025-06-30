-- GUI Mengambang VOIZZ BLOD
local player = game.Players.LocalPlayer

local gui = Instance.new("ScreenGui", game.CoreGui)
gui.Name = "VoizzBlodGUI"

local frame = Instance.new("Frame", gui)
frame.Size = UDim2.new(0, 230, 0, 270)
frame.Position = UDim2.new(0, 10, 0.4, 0)
frame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
frame.BorderSizePixel = 0
frame.BackgroundTransparency = 0.1

local title = Instance.new("TextLabel", frame)
title.Text = "💀 VOIZZ BLOD 💀"
title.Size = UDim2.new(1, 0, 0, 30)
title.BackgroundTransparency = 1
title.TextColor3 = Color3.fromRGB(255, 0, 0)
title.Font = Enum.Font.GothamBold
title.TextSize = 20

-- Fungsi bikin tombol ON/OFF
local function makeToggle(name, posY)
    local state = false
    local btn = Instance.new("TextButton", frame)
    btn.Text = name .. " [OFF]"
    btn.Size = UDim2.new(1, -20, 0, 30)
    btn.Position = UDim2.new(0, 10, 0, posY)
    btn.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
    btn.TextColor3 = Color3.new(1, 1, 1)
    btn.Font = Enum.Font.Gotham
    btn.TextSize = 16
    btn.BorderSizePixel = 0

    btn.MouseButton1Click:Connect(function()
        state = not state
        btn.Text = name .. (state and " [ON]" or " [OFF]")
        -- Tambahkan fungsi masing-masing toggle di sini
        if name == "vps base orang" then
            print("Base orang aktif: ", state)
        elseif name == "vps timer base" then
            print("Timer base aktif: ", state)
        elseif name == "vps player" then
            print("Player aktif: ", state)
        elseif name == "tembus tembok" then
            if player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
                player.Character.HumanoidRootPart.CanCollide = not state
            end
        end
    end)
end

-- Buat semua toggle
makeToggle("vps base orang", 40)
makeToggle("vps timer base", 80)
makeToggle("vps player", 120)
makeToggle("tembus tembok", 160)

-- Tombol teleport ke tengah
local teleBtn = Instance.new("TextButton", frame)
teleBtn.Text = "Teleport ke Tengah"
teleBtn.Size = UDim2.new(1, -20, 0, 30)
teleBtn.Position = UDim2.new(0, 10, 0, 210)
teleBtn.BackgroundColor3 = Color3.fromRGB(70, 70, 255)
teleBtn.TextColor3 = Color3.new(1, 1, 1)
teleBtn.Font = Enum.Font.GothamBold
teleBtn.TextSize = 16
teleBtn.BorderSizePixel = 0

teleBtn.MouseButton1Click:Connect(function()
    if player and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
        player.Character.HumanoidRootPart.CFrame = CFrame.new(0, 10, 0) -- ubah posisi tengah sesuai game
    end
end)
