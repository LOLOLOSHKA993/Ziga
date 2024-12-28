-- Основной скрипт
local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local backpack = player.Backpack
local rightShoulder = character:WaitForChild("RightShoulder")

-- Переменные
local isArmRaised = false
local heldTool = nil

-- Функция для изменения положения правой руки
local function rotateRightArm(raise)
    if rightShoulder then
        local currentCFrame = rightShoulder.C0  -- Текущее положение соединения плеча

        if raise then
            -- Поднять руку на 45 градусов
            local rotationCFrame = CFrame.Angles(0, math.rad(45), 0)  -- Поворот на 45 градусов по оси Y
            rightShoulder.C0 = currentCFrame * rotationCFrame
        else
            -- Вернуть руку в исходное положение
            local resetCFrame = CFrame.new(0, 0, 0)  -- Возвращаем в исходное положение
            rightShoulder.C0 = currentCFrame * resetCFrame
        end
    end
end

-- Обработчик для использования предмета
local function onToolEquipped(tool)
    heldTool = tool
    -- При взятии предмета в руку поднимаем правую руку
    rotateRightArm(true)
end

-- Обработчик для удаления предмета
local function onToolUnequipped(tool)
    if tool == heldTool then
        -- При убирании предмета опускаем правую руку
        rotateRightArm(false)
        heldTool = nil
    end
end

-- Добавление предмета в инвентарь
local function giveItemToPlayer()
    local tool = Instance.new("Tool")  -- Создаем новый инструмент
    tool.Name = "SampleTool"  -- Название предмета
    tool.RequiresHandle = true  -- Требует ручку
    tool.Parent = backpack  -- Добавляем в инвентарь игрока

    -- Создаем ручку для инструмента
    local handle = Instance.new("Part")
    handle.Name = "Handle"
    handle.Size = Vector3.new(1, 5, 1)
    handle.Position = character:WaitForChild("RightHand").Position
    handle.Parent = tool

    -- Привязка событий при экипировке и снятии предмета
    tool.Equipped:Connect(onToolEquipped)
    tool.Unequipped:Connect(onToolUnequipped)
end

-- Даем предмет игроку при старте игры
giveItemToPlayer()
