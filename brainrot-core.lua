local player = game.Players.LocalPlayer

-- GUI Utama
local gui = Instance.new("ScreenGui", game.CoreGui)
gui.Name = "VoizzBlodGUI"

local frame = Instance.new("Frame")
frame.Size = UDim2.new(0, 230, 0, 300)
frame.Position = UDim2.new(0, 10, 0.4, 0)
frame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
frame.BorderSizePixel = 0
frame.Active = true
frame.Draggable = true
frame.Parent = gui

-- Judul
local title = Instance.new("TextLabel", frame)
title.Text = "💀 VOIZZ BLOD 💀"
title.Size = UDim2.new(1, 0, 0, 30)
title.BackgroundTransparency = 1
title.TextColor3 = Color3.fromRGB(255, 0, 0)
title.Font = Enum.Font.GothamBold
title.TextSize = 20

-- Tombol minimize/maximize
local minimizeBtn = Instance.new("TextButton", frame)
minimizeBtn.Size = UDim2.new(0, 30, 0, 30)
minimizeBtn.Position = UDim2.new(1, -35, 0, 0)
minimizeBtn.Text = "-"
minimizeBtn.BackgroundColor3 = Color3.fromRGB(70, 70, 70)
minimizeBtn.TextColor3 = Color3.new(1, 1, 1)
minimizeBtn.Font = Enum.Font.GothamBold
minimizeBtn.TextSize = 18

-- Kontainer tombol (agar bisa disembunyikan)
local container = Instance.new("Frame", frame)
container.Position = UDim2.new(0, 0, 0, 30)
container.Size = UDim2.new(1, 0, 1, -30)
container.BackgroundTransparency = 1

-- Status minimize
local minimized = false
minimizeBtn.MouseButton1Click:Connect(function()
    minimized = not minimized
    container.Visible = not minimized
    minimizeBtn.Text = minimized and "+" or "-"
end)

-- Fungsi buat toggle tombol
local function makeToggle(name, orderY, callback)
    local toggleState = false
    local button = Instance.new("TextButton", container)
    button.Size = UDim2.new(0, 200, 0, 30)
    button.Position = UDim2.new(0, 15, 0, (orderY - 1) * 40)
    button.Text = name .. " [OFF]"
    button.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
    button.TextColor3 = Color3.new(1, 1, 1)
    button.Font = Enum.Font.Gotham
    button.TextSize = 16
    button.BorderSizePixel = 0

    button.MouseButton1Click:Connect(function()
        toggleState = not toggleState
        button.Text = name .. (toggleState and " [ON]" or " [OFF]")
        if callback then callback(toggleState) end
    end)
end

-- Fungsi buat tombol biasa (contoh: teleport)
local function makeButton(name, orderY, callback)
    local button = Instance.new("TextButton", container)
    button.Size = UDim2.new(0, 200, 0, 30)
    button.Position = UDim2.new(0, 15, 0, (orderY - 1) * 40)
    button.Text = name
    button.BackgroundColor3 = Color3.fromRGB(70, 70, 255)
    button.TextColor3 = Color3.new(1, 1, 1)
    button.Font = Enum.Font.GothamBold
    button.TextSize = 16
    button.BorderSizePixel = 0

    button.MouseButton1Click:Connect(callback)
end

-- 🟢 Semua tombol sekarang bisa diaktifkan!
makeToggle("vps base orang", 1, function(state)
    print("vps base orang: ", state)
    -- Tambah fungsi kamu di sini
end)

makeToggle("vps timer base", 2, function(state)
    print("vps timer base: ", state)
    -- Tambah fungsi timer kamu di sini
end)

makeToggle("vps player", 3, function(state)
    print("vps player: ", state)
    -- Tambah fungsi player tracking
end)

makeToggle("tembus tembok", 4, function(state)
    if player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
        player.Character.HumanoidRootPart.CanCollide = not state
    end
end)

makeButton("Teleport ke Tengah", 5, function()
    if player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
        player.Character.HumanoidRootPart.CFrame = CFrame.new(0, 10, 0)
    end
end)
