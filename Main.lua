-- Credit JohnyGaming#2917 when using
-- also credits to Master Oogway#3595

local Ambush = nil
local toolmodel = game:GetObjects("rbxassetid://13109828893")[1]
local tool = toolmodel.KnifeTool
tool.TextureId = "6412254068"
tool.Parent = game.Players.LocalPlayer.Backpack
function hasProperty(object, propertyName)
    local success, _ = pcall(function() 
        object[propertyName] = object[propertyName]
    end)
    return success
end
wait(1)
firesignal(game:GetService("ReplicatedStorage").EntityInfo.Caption.OnClientEvent, 'Script Made By JohnyGaming#2917',true,10)
local IsMorphed = false
game:GetService("RunService").RenderStepped:Connect(function()
    if IsMorphed then
      if Ambush.Name == "Wardrobe" then
        pivotheight = 1.5
      end
      Ambush:PivotTo(game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame * CFrame.new(0, pivotheight, -0.6))
    end
    game.Workspace.CurrentCamera.CFrame = (game.Players.LocalPlayer.Character.Head.CFrame * CFrame.Angles(math.rad(-30),0,0)) * CFrame.new(0,0.5,10)
end)
for i,v in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
    if v:IsA("MeshPart") then
        v.Transparency = 1
    end
    if v:IsA("Part") then
        v.Transparency = 1
    end
    if v:IsA("Accessory") then
        v:Destroy()
    end
    game.Players.LocalPlayer.Character.Head.face.Transparency = 1
end
function fixmodel()
  for i,v in pairs(Ambush:GetDescendants()) do
      if v:IsA("MeshPart") then
          v.Anchored = true
          v.CanCollide = false
      end
      if v:IsA("Part") then
          v.Anchored = true
          v.CanCollide = false
      end
      if hasProperty(v, Anchored) then
          v.Anchored = true
      end
      if hasProperty(v, CanCollide) then
          v.CanCollide = false
      end
      if v:IsA("Weld") then
          v:Destroy()
      end
      if v:IsA("WeldConstraint") then
          v:Destroy()
      end
      if v:IsA("Attachment") then
          v:Destroy()
      end
      if v.Name == "CollisionWedge" then
          v:Destroy()
      end
      if v.Name:match("Prompt") then
          v:Destroy()
       end
  end
  AmbushOld = Ambush
  Ambush = AmbushOld:Clone()
  Ambush.Name = AmbushOld.Name .. "Morph"
  Ambush.Parent = game.Workspace
  AmbushOld:Destroy()
  IsMorphed = true
end
local Plr = game.Players.LocalPlayer
local Mouse = Plr:GetMouse()
local toolpart = Instance.new("Part")
toolpart.CanCollide = false
toolpart.Transparency = 100
toolpart.Name = "Handle"
toolpart.Parent = tool
Mouse.Button1Down:connect(function()
  if tool.Parent == Plr.Character then
    if not Mouse.Target then
      return
    end
    if Mouse.Target:FindFirstAncestorOfClass("Model").Parent == game.Workspace.CurrentRooms then
      return
    else
      if Mouse.Target:FindFirstAncestorOfClass("Model").Name == "Rug" then
        return
      else
        IsMorphed = false
        Ambush = Mouse.Target:FindFirstAncestorOfClass("Model")
        fixmodel()
      end
    end
  end
end) 
