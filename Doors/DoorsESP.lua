loadstring(game:HttpGet("https://raw.githubusercontent.com/OminousVibes-Exploit/Scripts/main/doors/main.lua"))()

local Keybind = Enum.KeyCode.H
local CanSkipRoom_50 = true
local CanAutoUnlockDoors = true

do
local UIS = game:GetService("UserInputService")
local CF = CFrame.new
local LatestRoom = game:GetService("ReplicatedStorage").GameData.LatestRoom

UIS.InputBegan:Connect(function(input, typing)
    if typing then return end
    if input.KeyCode == Keybind then
        pcall(function()
            local key = false
            local CurrentDoor = workspace.CurrentRooms[tostring(game:GetService("ReplicatedStorage").GameData.LatestRoom.Value)]:WaitForChild("Door")
            for i,object in ipairs(CurrentDoor.Parent:GetDescendants()) do
                if object.Name == "KeyObtain" then
                    key = object
                end
            end
            if LatestRoom.Value == 50 and CanSkipRoom_50 == true then
                CurrentDoor = workspace.CurrentRooms[tostring(LatestRoom.Value + 1)]:WaitForChild("Door")
                game.Players.LocalPlayer.Character:PivotTo(CF(CurrentDoor.Door.Position))
            else
                if key and CanAutoUnlockDoors == true then
                    game.Players.LocalPlayer.Character:PivotTo(CF(key.Hitbox.Position))
                    task.wait(.3)
                    fireproximityprompt(key.ModulePrompt)
                    task.wait(.3)
                    game.Players.LocalPlayer.Character:PivotTo(CF(CurrentDoor.Door.Position))
					task.wait(.3)
                    fireproximityprompt(CurrentDoor.Lock.UnlockPrompt)
                end
                game.Players.LocalPlayer.Character:PivotTo(CF(CurrentDoor.Door.Position))
            end
            task.wait(.5)
            CurrentDoor.ClientOpen:FireServer()
        end)
    end
end)
end
