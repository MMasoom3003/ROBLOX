local player = game:GetService("Players").LocalPlayer
local UIS = game:GetService("UserInputService")
local Mouse = player:GetMouse()

local function tp(newpos)
    if player.Character ~= nil and player.Character:FindFirstChild("HumanoidRootPart") ~= nil then
        local opos = player.Character.HumanoidRootPart
        local deb = true
        
        local mt = getrawmetatable(game)
        setreadonly(mt, false)
        local old = mt.__index
        
        mt.__index = newcclosure(function(self, key)
            if self == "HumanoidRootPart" and self.Parent == player.Character and key == "CFrame" and deb then
                return opos
            end
            return old(self, key)
        end)
        
        player.Character.HumanoidRootPart.CFrame = CFrame.new(newpos)
        deb = false
    end
end

UIS.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 and UIS:IsKeyDown(Enum.KeyCode.LeftControl) then
        tp(Mouse.Hit.p + Vector3.new(0, 3, 0))
    end
end)

