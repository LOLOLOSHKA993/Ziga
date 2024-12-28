-- Получаем игрока и его персонажа
local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()

-- Ждем загрузки персонажа
local humanoid = character:WaitForChild("Humanoid")
local rightArm = character:WaitForChild("RightArm")

-- Функция для поднятия правой руки на 45 градусов
local function moveRightArm()
    -- Устанавливаем правильное положение правой руки с учетом 45 градусов
    rightArm.CFrame = rightArm.CFrame * CFrame.Angles(math.rad(45), 0, 0)
end

-- Подключаемся к Heartbeat, чтобы каждую секунду обновлять положение руки
game:GetService("RunService").Heartbeat:Connect(function()
    moveRightArm()
end)

-- Убедимся, что персонаж может двигаться
humanoid.WalkSpeed = 16  -- Стандартная скорость ходьбы
