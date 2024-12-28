-- Получаем необходимые объекты
local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local gui = player:WaitForChild("PlayerGui")

-- Создаем кнопку в GUI
local button = Instance.new("TextButton")
button.Size = UDim2.new(0, 200, 0, 50)
button.Position = UDim2.new(0.5, -100, 0.8, 0)
button.Text = "Поднять правую руку"
button.Parent = gui

-- Получаем части тела персонажа (плечо и рука)
local rightShoulder = character:WaitForChild("RightShoulder")
local rightArm = character:WaitForChild("RightArm")

-- Переменная для отслеживания состояния руки
local isArmRaised = false

-- Функция для поворота руки
local function rotateRightArm()
    if rightShoulder and rightArm then
        local currentCFrame = rightShoulder.C0  -- Текущее положение плеча

        if isArmRaised then
            -- Если рука поднята, сбрасываем её в исходное положение
            local resetCFrame = CFrame.new(0, 0, 0)  -- Исходное положение
            rightShoulder.C0 = currentCFrame * resetCFrame
            button.Text = "Поднять правую руку"  -- Меняем текст кнопки
        else
            -- Если рука не поднята, поднимем её на 45 градусов
            local rotationCFrame = CFrame.Angles(0, math.rad(45), 0)  -- Поворот на 45 градусов по оси Y
            rightShoulder.C0 = currentCFrame * rotationCFrame
            button.Text = "Опустить правую руку"  -- Меняем текст кнопки
        end

        -- Переключаем состояние руки
        isArmRaised = not isArmRaised
    end
end

-- Привязываем обработчик к кнопке
button.MouseButton1Click:Connect(rotateRightArm)
