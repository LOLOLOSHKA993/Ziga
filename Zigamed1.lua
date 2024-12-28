
local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()


local rightArm = character:WaitForChild("RightArm")


local rightArm.CFrame = rightArm.CFrame * CFrame.Angles(math.rad(45), 0, 0)
