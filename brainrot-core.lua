local basePos = Vector3.new(0, 10, 0)

local ScreenGui = Instance.new("ScreenGui", game.CoreGui)
local btn = Instance.new("TextButton", ScreenGui)

btn.Size = UDim2.new(0, 200, 0, 50)
btn.Position = UDim2.new(0, 20, 0, 20)
btn.Text = "🏠 Kembali ke Base"
btn.BackgroundColor3 = Color3.fromRGB(50, 50, 255)
btn.TextColor3 = Color3.new(1, 1, 1)
btn.Font = Enum.Font.GothamBold
btn.TextSize = 18
btn.BorderSizePixel = 0

btn.MouseButton1Click:Connect(function()
    local player = game.Players.LocalPlayer
    if player and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
        player.Character.HumanoidRootPart.CFrame = CFrame.new(basePos)
    end
end)

print("Script Brainrot aktif! Tombol teleport muncul.")
