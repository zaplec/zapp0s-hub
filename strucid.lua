local NotificationBindable = Instance.new("BindableFunction")
NotificationBindable.OnInvoke = callback

game.StarterGui:SetCore("SendNotification", {
    Title = "We Also Have A Arsenal GUI!";
    Text = "Magixz is nigger";
    Duration = "5";
    Callback = NotificationBindable;
})
wait(2)
local Network2 = game:GetService("ReplicatedStorage").Network.LookDir
local Hook2 
Hook2 = hookfunction(Network2.FireServer, newcclosure(function(...)
    local args = {...}
    local Banned = {5, 21, 23, 22, 1}
 if tostring(args[1]) == "LookDir" and table.find(Banned, args[2]) ~= nil then--Movement
            return
    end
    if tostring(args[2]) == "-nan(ind)" then--Should break anti-cheat as a backup if they detect
        return 
    end


    return Hook2(...)
end))
print('Bypassed Anti Cheat')


local Config = {
Visuals = {
BoxEsp = false,
CornerBoxEsp = false,
TracerEsp = false,
TracersOrigin = "Top", -- "Top", "Middle", "Bottom", or "Mouse"
NameEsp = false,
DistanceEsp = false,
SkeletonEsp = false,
EnemyColor = Color3.fromRGB(190, 190, 0),
TeamColor = Color3.fromRGB(0, 190, 0),
TeamCheck = true, -- Auto changes if gamemode is ffa
ItemEsp = false,
CrossairColor = Color3.fromRGB(225, 225, 225)
},
Aimbot = {
Aimbot = false,
TriggerBot = false,
Smoothness = 0.25,
AimBone = "Head",
RandomAimBone = true,
MouseTwoDown = false, -- Dont Touch
Silent = false,
VisCheck = false,
DrawFOV = false,
FOV = 200,
SnapLines = false,
RainbowGun = false
},
GunMods = {
Recoil = false,
Spread = false,
FireRate = false,
Wallbang = false
},
LocalPlayer = {
Nofatigue = false,
NoFD = false,
WS = 17,
JP = 50,
Fly = false,
FlySpeed = 100,
Rejoin = true
}
}

local Services = setmetatable({
LocalPlayer = game:GetService("Players").LocalPlayer,
Camera = workspace.CurrentCamera,
}, {
__index = function(self, idx)
return rawget(self, idx) or game:GetService(idx)
end
})

local Funcs = {}

function Funcs:IsAlive(player)
if player and player.Character and player.Character:FindFirstChild("Head") and workspace:FindFirstChild(player.Character.Name) and player ~= Services.LocalPlayer then
return true
end
end

function Funcs:Round(number)
return math.floor(tonumber(number) + 0.5)
end

function Funcs:DrawSquare()
local Box = Drawing.new("Square")
Box.Color = Color3.fromRGB(190, 190, 0)
Box.Thickness = 1.5
Box.Filled = false
Box.Transparency = 1
return Box
end

function Funcs:DrawQuad() -- Unused
local quad = Drawing.new("Quad")
quad.Color = Color3.fromRGB(190, 190, 0)
quad.Thickness = 1
quad.Filled = false
quad.Transparency = 1
return quad
end

function Funcs:DrawLine()
local line = Drawing.new("Line")
line.Color = Color3.new(190, 190, 0)
line.Thickness = 1
return line
end

function Funcs:DrawText()
local text = Drawing.new("Text")
text.Color = Color3.fromRGB(190, 190, 0)
text.Size = 20
text.Outline = true
text.Center = true
return text
end

local Mouse = Services.LocalPlayer:GetMouse()
local UserInputService = game:GetService("UserInputService")
local target = false
local mt = getrawmetatable(game)
local oldIndex = mt.__index
local oldNamecall = mt.__namecall
local newClose = newcclosure or function(f) return f end
if setreadonly then setreadonly(mt, false) else make_writeable(mt, true) end


local lib = loadstring(game:HttpGet("https://pastebin.com/VDcrS1jZ"))()
main = lib:Window()
Aimbot = main:Tab('Combat')
LPTab = main:Tab('LocalPlayer')
Esp = main:Tab('Visuals')
GunMods = main:Tab('Gun Mods')
Fun = main:Tab('Fun')


LPTab:Toggle('No Fall Damage',function(state)
  Config.LocalPlayer.NoFD = state  
end)

LPTab:Toggle('No Fatigue',function(state)
Config.LocalPlayer.Nofatigue = state
end)

LPTab:Toggle('Fly',function(state)
Config.LocalPlayer.Fly = state
end)


LPTab:Slider('WalkSpeed/FlySpeed', 17, 100, function(num)
Config.LocalPlayer.WS = num
end)

LPTab:Slider('JumpPower', 50, 100, function(num)
Config.LocalPlayer.JP = num
end)


   game:GetService("RunService").RenderStepped:Connect(function()


game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = Config.LocalPlayer.WS

game.Players.LocalPlayer.Character.Humanoid.JumpPower = Config.LocalPlayer.JP
end)

game:GetService('UserInputService').InputBegan:connect(function(key, gpe)
    if key.KeyCode == Enum.KeyCode.Space then
        Temp_Up = true
    end
    if key.KeyCode == Enum.KeyCode.LeftShift then
        Temp_Down = true
    end
end)
game:GetService('UserInputService').InputEnded:connect(function(key, gpe)
    if key.KeyCode == Enum.KeyCode.Space then
        Temp_Up = false
    end
    if key.KeyCode == Enum.KeyCode.LeftShift then
        Temp_Down = false
    end
end)
spawn(function()
    while true do
        wait()
        pcall(function()
            if Config.LocalPlayer.Fly == true then
                game:GetService("Workspace").Gravity = 0
                Me = game.Players.LocalPlayer.Character
                if Temp_Up == true then
                    Me.HumanoidRootPart.Velocity = Vector3.new(0,40,0)
                end
                if Temp_Down == true then
                    Me.HumanoidRootPart.Velocity = Vector3.new(0,-40,0)
                end
                if Temp_Down == false and Temp_Up == false then
                    if Me.HumanoidRootPart.Velocity.Y ~= 0 then
                        Me.HumanoidRootPart.Velocity = Vector3.new(0,0,0)
                    end
                end
            else
                game:GetService("Workspace").Gravity = 196.19999694824 
            end
        end)
    end
end)

if game.PlaceId == 2377868063 then

LPTab:Label('Capture The Flag Gamemode: ')
LPTab:Button('Capture Blue Flag',function()
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(game:GetService("Workspace").IgnoreThese.BlueFlag.Position)
wait(.2)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(game:GetService("Workspace").IgnoreThese.RedFlag.Position)
end)
LPTab:Button('Capture Red Flag',function()
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(game:GetService("Workspace").IgnoreThese.RedFlag.Position)
wait(.2)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(game:GetService("Workspace").IgnoreThese.BlueFlag.Position)
end)
end

game:GetService("RunService").Heartbeat:Connect(function()
if Config.LocalPlayer.Nofatigue == true then
game.Players.LocalPlayer.Character.Humanoid.JumpPower = 38
end
end)



Aimbot:Toggle('Silent Aim',function(state)
Config.Aimbot.Silent = state
end)



Aimbot:Dropdown(
"Aim Bone",{'Random','Head (Bannable)','Torso','Left Arm','Right Arm','Left Leg','Right Leg'}, 
function(selected)
if selected == "Random" then
  Config.Aimbot.RandomAimBone = true
elseif selected == "Head (Bannable!)" then
  Config.Aimbot.AimBone = "Head"
  Config.Aimbot.RandomAimBone = false
elseif selected == "Torso" then
  Config.Aimbot.AimBone = "UpperTorso"
  Config.Aimbot.RandomAimBone = false
elseif selected == "Left Arm" then
  Config.Aimbot.AimBone = "LeftLowerArm"
  Config.Aimbot.RandomAimBone = false
elseif selected == "Right Arm" then
  Config.Aimbot.AimBone = "RightLowerArm"
  Config.Aimbot.RandomAimBone = false
elseif selected == "Left Leg" then
  Config.Aimbot.AimBone = "LeftLowerLeg"
  Config.Aimbot.RandomAimBone = false
elseif selected == "Right Leg" then
  Config.Aimbot.AimBone = "RightLowerLeg"
  Config.Aimbot.RandomAimBone = false
end
end
)

Aimbot:Toggle('Draw FOV',function(state)
Config.Aimbot.DrawFOV = state
end)

Aimbot:Slider('FOV',0,1000,function(number)
Config.Aimbot.FOV = number
end)

Esp:Toggle('Boxes',function(state)
Config.Visuals.BoxEsp = state
end)

Esp:Toggle('Corner Boxes',function(state)
Config.Visuals.CornerBoxEsp = state
end)

Esp:Toggle('Skeleton',function(state)
Config.Visuals.SkeletonEsp = state
end)

Esp:Toggle('Tracers',function(state)
Config.Visuals.TracerEsp = state
end)

Fun:Toggle('Rainbow Guns',function(state)
Config.Visuals.RainbowGun = state
end)


Esp:Dropdown(
"Tracers Origin",{'Top','Middle','Bottom','Mouse'}, 
function(selected)
Config.Visuals.TracersOrigin = selected
end
)

Esp:Colorpicker("Team Esp Color",Color3.fromRGB(40, 127, 71), function(color)
Config.Visuals.TeamColor = color
end)

Esp:Colorpicker("Enemy Esp Color",Color3.fromRGB(205, 84, 75), function(color)
Config.Visuals.EnemyColor = color
end)

Esp:Colorpicker("Crossair",Color3.fromRGB(225,225,225), function(color)
Config.Visuals.CrossairColor = color
end)

   game:GetService("RunService").RenderStepped:Connect(function()
pcall(function()
for i,v in pairs(game:GetService("Players").LocalPlayer.PlayerGui.MainGui.CrossHairs:GetChildren()) do
    if v.ClassName == "Frame" then
        v.BackgroundColor3 = Config.Visuals.CrossairColor
        end
end
for i,v in pairs(game:GetService("Players").LocalPlayer.PlayerGui.MainGui.ShotgunCrossHairs:GetChildren()) do
    if v.ClassName == "Frame" or v.ClassName == "ImageLabel" then
        v.BackgroundColor3 = Config.Visuals.CrossairColor
        v.ImageColor3 = Config.Visuals.CrossairColor

        end
end

if Config.Visuals.ItemEsp and wait(.45) then
    pcall(function()
for i,v in pairs(game:GetService("Workspace").GroundWeapons:GetDescendants()) do
if v.ClassName == "Model" then
    for _,v2 in pairs(v:GetChildren()) do
        if v2.ClassName == "Part" then
local BillboardGui = Instance.new("BillboardGui")
local TextLabel = Instance.new("TextLabel")

BillboardGui.Parent = v2.Parent
BillboardGui.AlwaysOnTop = true
BillboardGui.LightInfluence = 1
BillboardGui.Size = UDim2.new(0, 10, 10, 10)
BillboardGui.StudsOffset = Vector3.new(0, 2, 0)

TextLabel.Parent = BillboardGui
TextLabel.BackgroundColor3 = Color3.new(1, 1, 1)
TextLabel.BackgroundTransparency = 1
TextLabel.Size = UDim2.new(5, 0, 1, 0)
TextLabel.Text = v2.Parent.Name
TextLabel.TextColor3 = Color3.fromRGB(17, 17, 17)
TextLabel.TextScaled = true
end
end
else
    v2.Parent("BillboardGui"):Destroy()
end
end
end)
end
end)
end)

    function Property(instance, property)
    local prop = instance[property]
end

for i, v in pairs(game:GetService("ReplicatedStorage").Weapons.Assets:GetChildren()) do
    for o, b in pairs(v:GetChildren()) do
        local Colorr = pcall(function() Property(b, "Color") end)
        if Colorr then
local RunService = game:GetService("RunService")
RunService.Heartbeat:Connect(function()
    if Config.Visuals.RainbowGun == true then
   b.Color = Color3.fromHSV(tick()%5/5,1,1)
                b.Material = "ForceField"
                b.Transparency = 0.5
end
            end)
        end
    end
end

function Property(instance, property)
    local prop = instance[property]
end





GunMods:Toggle('No Recoil',function(state)
Config.GunMods.Recoil = state
Funcs:UpdateGuns()
end)

GunMods:Toggle('No Spread',function(state)
Config.GunMods.Spread = state
Funcs:UpdateGuns()
end)

--GunMods:Toggle('FireRate',function(state)
--Config.GunMods.FireRate = state
--Funcs:UpdateGuns()
--end)

GunMods:Toggle('Wallbang (Cant be to far for ememy or no work)',function(state)
Config.GunMods.Wallbang = state
end)


-- Aimbot
function Funcs:GetTarget()
local nearestmagnitude = math.huge
local nearestenemy = nil
local vector = nil
for i,v in next, Services.Players:GetChildren() do
if Config.Visuals.TeamCheck then
  if v.Team ~= Services.LocalPlayer.Team and Funcs:IsAlive(v) then
    if v.Character and  v.Character:FindFirstChild("HumanoidRootPart") and v.Character:FindFirstChild("Humanoid") and v.Character.Humanoid.Health > 0 then
      local vector, onScreen = Services.Camera:WorldToScreenPoint(v.Character["HumanoidRootPart"].Position)
      if onScreen then
        local ray = Ray.new(
          Services.Camera.CFrame.p,
          (v.Character["UpperTorso"].Position-Services.Camera.CFrame.p).unit*500
        )
        local ignore = {
          Services.LocalPlayer.Character,
        }
        local magnitude = (Vector2.new(Mouse.X, Mouse.Y) - Vector2.new(vector.X, vector.Y)).magnitude
        if magnitude < nearestmagnitude and magnitude <= Config.Aimbot["FOV"] then
          nearestenemy = v
          nearestmagnitude = magnitude
        end
      end
    end
  end
else
  if v.Character and  v.Character:FindFirstChild("HumanoidRootPart") and v.Character:FindFirstChild("Humanoid") and v.Character.Humanoid.Health > 0  and Funcs:IsAlive(v) then
    local vector, onScreen = Services.Camera:WorldToScreenPoint(v.Character["HumanoidRootPart"].Position)
    if onScreen then
      local ray = Ray.new(
        Services.Camera.CFrame.p,
        (v.Character["UpperTorso"].Position-Services.Camera.CFrame.p).unit*500
      )
      local ignore = {
        Services.LocalPlayer.Character,
      }
      local magnitude = (Vector2.new(Mouse.X, Mouse.Y) - Vector2.new(vector.X, vector.Y)).magnitude
      if magnitude < nearestmagnitude and magnitude <= Config.Aimbot["FOV"] then
        nearestenemy = v
        nearestmagnitude = magnitude
      end
    end
  end
end
end
return nearestenemy
end

spawn(function()
while wait() do
pcall(function()
  TargetPlayer = Funcs:GetTarget()
  if TargetPlayer and Config.Aimbot.MouseTwoDown and Config.Aimbot.Aimbot then
    local niggasbone = game:GetService("Workspace").CurrentCamera:WorldToScreenPoint(TargetPlayer.Character[Config.Aimbot.AimBone].Position)
    local moveto = Vector2.new((niggasbone.X-Mouse.X)*Config.Aimbot.Smoothness,(niggasbone.Y-Mouse.Y)*Config.Aimbot.Smoothness)
    mousemoverel(moveto.X,moveto.Y)

  end
end)
end
end)

    local player = game:GetService("Players").LocalPlayer
   local Mouse = player:GetMouse()
   game:GetService("RunService").RenderStepped:Connect(function()
if Config.Aimbot.TriggerBot == true then
    if Mouse.Target.Parent:FindFirstChild("Humanoid") and Config.Aimbot.TriggerBot == true and Mouse.Target.Parent.Name ~= player.Name then
        mouse1press() wait() mouse1release()
        end
end
   end)



Mouse.Button2Down:Connect(function()
Config.Aimbot.MouseTwoDown = true
end)

Mouse.Button2Up:Connect(function()
Config.Aimbot.MouseTwoDown = false
end)



function Funcs:AddEsp(player)
local Box = Funcs:DrawSquare()
local Tracer = Funcs:DrawLine()
local Name = Funcs:DrawText()
local Distance = Funcs:DrawText()
local SnapLines = Funcs:DrawLine()
local HeadLowerTorso = Funcs:DrawLine()
local NeckLeftUpper = Funcs:DrawLine()
local LeftUpperLeftLower = Funcs:DrawLine()
local NeckRightUpper = Funcs:DrawLine()
local RightUpperLeftLower = Funcs:DrawLine()
local LowerTorsoLeftUpper = Funcs:DrawLine()
local LeftLowerLeftUpper = Funcs:DrawLine()
local LowerTorsoRightUpper = Funcs:DrawLine()
local RightLowerRightUpper = Funcs:DrawLine()
local bottomrightone = Funcs:DrawLine()
local bottomleftone = Funcs:DrawLine()
local toprightone = Funcs:DrawLine()
local topleftone = Funcs:DrawLine()
local toplefttwo = Funcs:DrawLine()
local bottomlefttwo = Funcs:DrawLine()
local toprighttwo = Funcs:DrawLine()
local bottomrighttwo = Funcs:DrawLine()
Services.RunService.Stepped:Connect(function()
if Config.Visuals.TeamCheck and player.Team == Services.LocalPlayer.Team then
  Box.Color = Config.Visuals.TeamColor
  Tracer.Color = Config.Visuals.TeamColor
  HeadLowerTorso.Color = Config.Visuals.TeamColor
  NeckLeftUpper.Color = Config.Visuals.TeamColor
  LeftUpperLeftLower.Color = Config.Visuals.TeamColor
  NeckRightUpper.Color = Config.Visuals.TeamColor
  RightUpperLeftLower.Color = Config.Visuals.TeamColor
  LowerTorsoLeftUpper.Color = Config.Visuals.TeamColor
  LeftLowerLeftUpper.Color = Config.Visuals.TeamColor
  LowerTorsoRightUpper.Color = Config.Visuals.TeamColor
  RightLowerRightUpper.Color = Config.Visuals.TeamColor
  bottomrightone.Color = Config.Visuals.TeamColor
  bottomleftone.Color = Config.Visuals.TeamColor
  toprightone.Color = Config.Visuals.TeamColor
  topleftone.Color = Config.Visuals.TeamColor
  toplefttwo.Color = Config.Visuals.TeamColor
  bottomlefttwo.Color = Config.Visuals.TeamColor
  toprighttwo.Color = Config.Visuals.TeamColor
  bottomrighttwo.Color = Config.Visuals.TeamColor
else
  Box.Color = Config.Visuals.EnemyColor
  Tracer.Color = Config.Visuals.EnemyColor
  HeadLowerTorso.Color = Config.Visuals.EnemyColor
  NeckLeftUpper.Color = Config.Visuals.EnemyColor
  LeftUpperLeftLower.Color = Config.Visuals.EnemyColor
  NeckRightUpper.Color = Config.Visuals.EnemyColor
  RightUpperLeftLower.Color = Config.Visuals.EnemyColor
  LowerTorsoLeftUpper.Color = Config.Visuals.EnemyColor
  LeftLowerLeftUpper.Color = Config.Visuals.EnemyColor
  LowerTorsoRightUpper.Color = Config.Visuals.EnemyColor
  RightLowerRightUpper.Color = Config.Visuals.EnemyColor
  bottomrightone.Color = Config.Visuals.EnemyColor
  bottomleftone.Color = Config.Visuals.EnemyColor
  toprightone.Color = Config.Visuals.EnemyColor
  topleftone.Color = Config.Visuals.EnemyColor
  toplefttwo.Color = Config.Visuals.EnemyColor
  bottomlefttwo.Color = Config.Visuals.EnemyColor
  toprighttwo.Color = Config.Visuals.EnemyColor
  bottomrighttwo.Color = Config.Visuals.EnemyColor
end
if Funcs:IsAlive(player) and player.Character:FindFirstChild("HumanoidRootPart") then
  local RootPosition, OnScreen = Services.Camera:WorldToViewportPoint(player.Character.HumanoidRootPart.Position)
  local HeadPosition = Services.Camera:WorldToViewportPoint(player.Character.Head.Position + Vector3.new(0, 0, 0)) -- can creat an offset if u want
  local LegPosition = Services.Camera:WorldToViewportPoint(player.Character.HumanoidRootPart.Position - Vector3.new(0, 5, 0))
  local length = RootPosition.Y - ((HeadPosition.Y - LegPosition.Y) / 2)
  local lengthx = RootPosition.X - ((HeadPosition.Y - LegPosition.Y) / 2)
  local size = HeadPosition.Y - LegPosition.Y
  if Config.Visuals.BoxEsp then
    Box.Visible = OnScreen
    Box.Size = Vector2.new(HeadPosition.Y - LegPosition.Y, HeadPosition.Y - LegPosition.Y)
    Box.Position = Vector2.new(RootPosition.X - ((HeadPosition.Y - LegPosition.Y) / 2), RootPosition.Y - ((HeadPosition.Y - LegPosition.Y) / 2))
  else
    Box.Visible = false
  end
  if Config.Visuals.CornerBoxEsp and Funcs:IsAlive(player) then
    bottomrightone.Visible = OnScreen
    bottomrightone.From = Vector2.new(RootPosition.X - ((HeadPosition.Y - LegPosition.Y) / 2), length)
    bottomrightone.To = Vector2.new(RootPosition.X - ((HeadPosition.Y - LegPosition.Y) / 2) + (size / 3), length)
    bottomleftone.Visible = OnScreen
    bottomleftone.From = Vector2.new((RootPosition.X - ((HeadPosition.Y - LegPosition.Y) / 2)) + size, length)
    bottomleftone.To = Vector2.new(RootPosition.X - ((HeadPosition.Y - LegPosition.Y) / 2) + ((size / 3) * 2), length)
    toprightone.Visible = OnScreen
    toprightone.From = Vector2.new(RootPosition.X - ((HeadPosition.Y - LegPosition.Y) / 2), length + size)
    toprightone.To = Vector2.new(RootPosition.X - ((HeadPosition.Y - LegPosition.Y) / 2) + (size / 3), length + size)
    topleftone.Visible = OnScreen
    topleftone.From = Vector2.new((RootPosition.X - ((HeadPosition.Y - LegPosition.Y) / 2)) + size, length + size)
    topleftone.To = Vector2.new(RootPosition.X - ((HeadPosition.Y - LegPosition.Y) / 2) + ((size / 3) * 2), length + size)
    toplefttwo.Visible = OnScreen
    toplefttwo.From = Vector2.new(lengthx, (RootPosition.Y - ((HeadPosition.Y - LegPosition.Y) / 2)) + size)
    toplefttwo.To = Vector2.new(lengthx, (RootPosition.Y - ((HeadPosition.Y - LegPosition.Y) / 2)) + ((size / 3) * 2))
    bottomlefttwo.Visible = OnScreen
    bottomlefttwo.From = Vector2.new(lengthx, (RootPosition.Y - (HeadPosition.Y - LegPosition.Y) / 2))
    bottomlefttwo.To = Vector2.new(lengthx, (RootPosition.Y - ((HeadPosition.Y - LegPosition.Y) / 2)) + (size / 3))
    toprighttwo.Visible = OnScreen
    toprighttwo.From = Vector2.new(lengthx + size, (RootPosition.Y - ((HeadPosition.Y - LegPosition.Y) / 2)) + size)
    toprighttwo.To = Vector2.new(lengthx + size, (RootPosition.Y - ((HeadPosition.Y - LegPosition.Y) / 2)) + ((size / 3) * 2))
    bottomrighttwo.Visible = OnScreen
    bottomrighttwo.From = Vector2.new(lengthx + size, (RootPosition.Y - (HeadPosition.Y - LegPosition.Y) / 2))
    bottomrighttwo.To = Vector2.new(lengthx + size, (RootPosition.Y - ((HeadPosition.Y - LegPosition.Y) / 2)) + (size / 3))
  else
    bottomrightone.Visible = false
    bottomleftone.Visible = false
    toprightone.Visible = false
    topleftone.Visible = false
    toplefttwo.Visible = false
    bottomlefttwo.Visible = false
    toprighttwo.Visible = false
    bottomrighttwo.Visible = false
  end
  if Config.Visuals.TracerEsp then
    Tracer.Visible = OnScreen
    if Config.Visuals.TracersOrigin == "Top" then
      Tracer.To = Vector2.new(Services.Camera.ViewportSize.X / 2, 0)
      Tracer.From = Vector2.new(Services.Camera:WorldToViewportPoint(player.Character.HumanoidRootPart.Position).X - 1, RootPosition.Y + (HeadPosition.Y - LegPosition.Y) / 2)
    elseif Config.Visuals.TracersOrigin == "Middle" then
      Tracer.To = Vector2.new(Services.Camera.ViewportSize.X / 2, Services.Camera.ViewportSize.Y / 2)
      Tracer.From = Vector2.new(Services.Camera:WorldToViewportPoint(player.Character.HumanoidRootPart.Position).X - 1, (RootPosition.Y + (HeadPosition.Y - LegPosition.Y) / 2) - ((HeadPosition.Y - LegPosition.Y) / 2))
    elseif Config.Visuals.TracersOrigin == "Bottom" then
      Tracer.To = Vector2.new(Services.Camera.ViewportSize.X / 2, 1000)
      Tracer.From = Vector2.new(Services.Camera:WorldToViewportPoint(player.Character.HumanoidRootPart.Position).X - 1, RootPosition.Y - (HeadPosition.Y - LegPosition.Y) / 2)
    elseif Config.Visuals.TracersOrigin == "Mouse" then
      Tracer.To = game:GetService('UserInputService'):GetMouseLocation();
      Tracer.From = Vector2.new(Services.Camera:WorldToViewportPoint(player.Character.HumanoidRootPart.Position).X - 1, (RootPosition.Y + (HeadPosition.Y - LegPosition.Y) / 2) - ((HeadPosition.Y - LegPosition.Y) / 2))
    end
  else
    Tracer.Visible = false
  end
  if Config.Visuals.SkeletonEsp then
    HeadLowerTorso.Visible = OnScreen
    HeadLowerTorso.From = Vector2.new(Services.Camera:WorldToViewportPoint(player.Character.Head.Position).X, Services.Camera:WorldToViewportPoint(player.Character.Head.Position).Y)
    HeadLowerTorso.To = Vector2.new(Services.Camera:WorldToViewportPoint(player.Character.LowerTorso.Position).X, Services.Camera:WorldToViewportPoint(player.Character.LowerTorso.Position).Y)
    NeckLeftUpper.Visible = OnScreen
    NeckLeftUpper.From = Vector2.new(Services.Camera:WorldToViewportPoint(player.Character.Head.Position).X, Services.Camera:WorldToViewportPoint(player.Character.Head.Position).Y + ((Services.Camera:WorldToViewportPoint(player.Character.UpperTorso.Position).Y - Services.Camera:WorldToViewportPoint(player.Character.Head.Position).Y) / 3))
    NeckLeftUpper.To = Vector2.new(Services.Camera:WorldToViewportPoint(player.Character.LeftUpperArm.Position).X, Services.Camera:WorldToViewportPoint(player.Character.LeftUpperArm.Position).Y)
    LeftUpperLeftLower.Visible = OnScreen
    LeftUpperLeftLower.From = Vector2.new(Services.Camera:WorldToViewportPoint(player.Character.LeftLowerArm.Position).X, Services.Camera:WorldToViewportPoint(player.Character.LeftLowerArm.Position).Y)
    LeftUpperLeftLower.To = Vector2.new(Services.Camera:WorldToViewportPoint(player.Character.LeftUpperArm.Position).X, Services.Camera:WorldToViewportPoint(player.Character.LeftUpperArm.Position).Y)
    NeckRightUpper.Visible = OnScreen
    NeckRightUpper.From = Vector2.new(Services.Camera:WorldToViewportPoint(player.Character.Head.Position).X, Services.Camera:WorldToViewportPoint(player.Character.Head.Position).Y + ((Services.Camera:WorldToViewportPoint(player.Character.UpperTorso.Position).Y - Services.Camera:WorldToViewportPoint(player.Character.Head.Position).Y) / 3))
    NeckRightUpper.To = Vector2.new(Services.Camera:WorldToViewportPoint(player.Character.RightUpperArm.Position).X, Services.Camera:WorldToViewportPoint(player.Character.RightUpperArm.Position).Y)
    RightUpperLeftLower.Visible = OnScreen
    RightUpperLeftLower.From = Vector2.new(Services.Camera:WorldToViewportPoint(player.Character.RightLowerArm.Position).X, Services.Camera:WorldToViewportPoint(player.Character.RightLowerArm.Position).Y)
    RightUpperLeftLower.To = Vector2.new(Services.Camera:WorldToViewportPoint(player.Character.RightUpperArm.Position).X, Services.Camera:WorldToViewportPoint(player.Character.RightUpperArm.Position).Y)
    LowerTorsoLeftUpper.Visible = OnScreen
    LowerTorsoLeftUpper.From = Vector2.new(Services.Camera:WorldToViewportPoint(player.Character.LowerTorso.Position).X, Services.Camera:WorldToViewportPoint(player.Character.LowerTorso.Position).Y)
    LowerTorsoLeftUpper.To = Vector2.new(Services.Camera:WorldToViewportPoint(player.Character.LeftUpperLeg.Position).X, Services.Camera:WorldToViewportPoint(player.Character.LeftUpperLeg.Position).Y)
    LeftLowerLeftUpper.Visible = OnScreen
    LeftLowerLeftUpper.From = Vector2.new(Services.Camera:WorldToViewportPoint(player.Character.LeftLowerLeg.Position).X, Services.Camera:WorldToViewportPoint(player.Character.LeftLowerLeg.Position).Y)
    LeftLowerLeftUpper.To = Vector2.new(Services.Camera:WorldToViewportPoint(player.Character.LeftUpperLeg.Position).X, Services.Camera:WorldToViewportPoint(player.Character.LeftUpperLeg.Position).Y)
    LowerTorsoRightUpper.Visible = OnScreen
    LowerTorsoRightUpper.From = Vector2.new(Services.Camera:WorldToViewportPoint(player.Character.RightLowerLeg.Position).X, Services.Camera:WorldToViewportPoint(player.Character.RightLowerLeg.Position).Y)
    LowerTorsoRightUpper.To = Vector2.new(Services.Camera:WorldToViewportPoint(player.Character.RightUpperLeg.Position).X, Services.Camera:WorldToViewportPoint(player.Character.RightUpperLeg.Position).Y)
    RightLowerRightUpper.Visible = OnScreen
    RightLowerRightUpper.From = Vector2.new(Services.Camera:WorldToViewportPoint(player.Character.LowerTorso.Position).X, Services.Camera:WorldToViewportPoint(player.Character.LowerTorso.Position).Y)
    RightLowerRightUpper.To = Vector2.new(Services.Camera:WorldToViewportPoint(player.Character.RightUpperLeg.Position).X, Services.Camera:WorldToViewportPoint(player.Character.RightUpperLeg.Position).Y)
  else
    HeadLowerTorso.Visible = false
    NeckLeftUpper.Visible = false
    LeftUpperLeftLower.Visible = false
    NeckRightUpper.Visible = false
    RightUpperLeftLower.Visible = false
    LowerTorsoLeftUpper.Visible = false
    LeftLowerLeftUpper.Visible = false
    LowerTorsoRightUpper.Visible = false
    RightLowerRightUpper.Visible = false
  end
else
  Box.Visible = false
  Tracer.Visible = false
  HeadLowerTorso.Visible = false
  NeckLeftUpper.Visible = false
  LeftUpperLeftLower.Visible = false
  NeckRightUpper.Visible = false
  RightUpperLeftLower.Visible = false
  LowerTorsoLeftUpper.Visible = false
  LeftLowerLeftUpper.Visible = false
  LowerTorsoRightUpper.Visible = false
  RightLowerRightUpper.Visible = false
  bottomrightone.Visible = false
  bottomleftone.Visible = false
  toprightone.Visible = false
  topleftone.Visible = false
  toplefttwo.Visible = false
  bottomlefttwo.Visible = false
  toprighttwo.Visible = false
  bottomrighttwo.Visible = false
end
end)
end

for i, v in pairs(Services.Players:GetPlayers()) do
if v ~= Services.LocalPlayer then
Funcs:AddEsp(v)
end
end

Services.Players.PlayerAdded:Connect(function(player)
if v ~= Services.LocalPlayer then
Funcs:AddEsp(player)
end
end)

local HitParticle = require(game:GetService("ReplicatedStorage").Modules.GlobalStuff).HitParticle
local GetWSettings = require(game:GetService("ReplicatedStorage").Modules.GlobalStuff).GetWSettings
local WeaponModules = game:GetService("ReplicatedStorage").Weapons.Modules:Clone()

require(game:GetService("ReplicatedStorage").Modules.GlobalStuff).HitParticle = function(...)
if Config.GunMods.Wallbang then
  return
else
  return HitParticle(...)
end
end

require(game:GetService("ReplicatedStorage").Modules.GlobalStuff).GetWSettings = function(Argument_1, Argument_2)
if tostring(getfenv(2).script.Name) == "NewLocal" then
return GetWSettings(Argument_1, Argument_2)
end
return require(WeaponModules:FindFirstChild(Argument_2))
end

function Funcs:UpdateGuns()
for a,b in pairs(WeaponModules:GetChildren()) do
if b.Name ~= "Pickaxe" then
  if Config.GunMods.Recoil == true then
    require(b).Recoil = 0
  else
    require(b).Recoil = require(game:GetService("ReplicatedStorage").Weapons.Modules[b.Name]).Recoil
  end
--  if Config.GunMods.FireRate == true then
  --  require(b).Debounce = 0
--  else
  --  require(b).Debounce = require(game:GetService("ReplicatedStorage").Weapons.Modules[b.Name]).Debounce
--  end
  if Config.GunMods.Spread == true then
    require(b).Inaccuracy = 0
  else
    require(b).Inaccuracy = require(game:GetService("ReplicatedStorage").Weapons.Modules[b.Name]).Inaccuracy
  end
    --if Config.GunMods.FireRate == true then
  --  require(b).Auto = true
 -- else
   -- require(b).Auto = require(game:GetService("ReplicatedStorage").Weapons.Modules[b.Name]).Auto
   -- end
end
end
end

 game:GetService("RunService").RenderStepped:Connect(function()
 local ConeOfFire = require(game.Players.LocalPlayer.PlayerGui:WaitForChild("MainGui").NewLocal.Tools.Tool.Gun).ConeOfFire
if Config.Aimbot.Silent then
  local ConeOfFire = require(game.Players.LocalPlayer.PlayerGui:WaitForChild("MainGui").NewLocal.Tools.Tool.Gun).ConeOfFire
  require(game.Players.LocalPlayer.PlayerGui:WaitForChild("MainGui").NewLocal.Tools.Tool.Gun).ConeOfFire = function(...)
    if tostring(getfenv(2).script.Name) == "Extra" then
      return ConeOfFire(...)
    end
    if Funcs:GetTarget() ~= nil then
      return Funcs:GetTarget().Character[Config.Aimbot.AimBone].Position
    end
    return ({...})[3]
  end
end
end)





local hooked = false
local FOVCircle = Drawing.new("Circle")
FOVCircle.Color = Color3.fromRGB(255, 0, 0)
FOVCircle.Thickness = 0.5
FOVCircle.NumSides = 16
FOVCircle.Filled = false
FOVCircle.Transparency = 1
setreadonly(getrawmetatable(game), false)
local __namecall = getrawmetatable(game).__namecall
getrawmetatable(game).__namecall = function(...)
if ({...})[2] == 1 and ({...})[3] == 21 then
  return true
else
  return __namecall(...)
end
end


Services.RunService.Stepped:Connect(function()
    if Config.LocalPlayer.Rejoin then
    if game:GetService("Players").LocalPlayer.PlayerGui.MenuUI.VoteKick and game:GetService("Players").LocalPlayer.PlayerGui.MenuUI.VoteKick.Title.Text == "Vote Kick <font color = '#FFA500'>".. game.Players.LocalPlayer.Name .. "</font>?" then
game:GetService("TeleportService"):Teleport(game.PlaceId)
    else
wait()
end
end
for i,v in pairs(game:GetService("Players").LocalPlayer.PlayerGui:GetChildren()) do
if v:FindFirstChild("ImageLabel") then
  game.Players.LocalPlayer:Kick("tell the zapp0s ware people to fix their script (and dont worry you're not banned)")
end
end
FOVCircle.Position = game:GetService('UserInputService'):GetMouseLocation();
FOVCircle.Radius = Config.Aimbot.FOV
if Config.Aimbot.DrawFOV then
FOVCircle.Visible = true
else
FOVCircle.Visible = false
end
if game.PlaceId == 2377868063 then
if game:GetService("Players").LocalPlayer.PlayerGui.GameUI.CoreFrames.RoundStats.Gamemode.Text == " FFA" then
Config.Visuals.TeamCheck = false
else
Config.Visuals.TeamCheck = true
end
end
if game.PlaceId == 3606833500 then
Config.Visuals.TeamCheck = false
end
if Config.Aimbot.RandomAimBone then
random = math.random(1,3)
if random == 1 then
  Config.Aimbot.AimBone = "Head"
elseif random == 2 then
  Config.Aimbot.AimBone = "UpperTorso"
elseif random == 3 then
  Config.Aimbot.AimBone = "LowerTorso"
end
end
pcall(function()
if Config.GunMods.Recoil == true then
  --getsenv(game:GetService("Players").LocalPlayer.PlayerGui.MainGui.NewLocal).CameraRecoil = function() end
end
--if Config.GunMods.FireRate == true then
 --getupvalue(getsenv(game:GetService("Players").LocalPlayer.PlayerGui.MainGui.NewLocal).Reload, 3).Debounce = 0
--end
end)
end)

     local RayHook;
RayHook = hookfunction(workspace.FindPartOnRayWithIgnoreList,newcclosure(function(...)
    args = {...}
    if Config.GunMods.Wallbang == true then
        args[3] = {game:GetService("Terrain"), game:GetService("Workspace").IgnoreThese, game:GetService("Players").LocalPlayer.Character, game:GetService("Workspace").BuildStuff, game:GetService("Workspace").Map, game:GetService("Workspace").Terrain}
            if Config.GunMods.Wallbang == true then
        return RayHook(unpack(args))
            else
                return RayHook(...)
                end
    end
    return RayHook(...)
end))




    for i,v in pairs(game:GetService("Players").LocalPlayer.PlayerGui:GetChildren()) do
        if v:IsA("LocalScript") then
            v:Destroy()
        end
    end

while wait(1) do
         if Config.LocalPlayer.NoFD == true then 
             wait(1)
game:GetService("ReplicatedStorage").Network.Remotes.Bouncing:FireServer()
end
end
