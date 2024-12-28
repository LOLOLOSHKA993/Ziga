-- Получаем игрока и его персонажа
local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()

-- Ждем загрузки персонажа
local humanoid = character:WaitForChild("Humanoid")

-- Получаем правую руку
local rightArm = character:WaitForChild("RightArm")

-- Устанавливаем новую позицию правой руки, чтобы поднять её на 45 градусов
rightArm.CFrame = rightArm.CFrame * CFrame.Angles(math.rad(45), 0, 0)
