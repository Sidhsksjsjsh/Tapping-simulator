-- Auto tap (Winter Only) will be deleted at the end of the christmas event.

-- I will make several features that can automatically create clans, Huge Mount configurations, and block player messages.

local Asset = game:GetService("MarketplaceService"):GetProductInfo(game.PlaceId)
 
local ID = game.PlaceId
 
local JOB = game.JobId
 
local Name = Asset.Name

local PlayerName = game.Players.LocalPlayer

local Toggle_A5 = true

local function Alert(AlertText, cooldown)
spawn(function()
local message = Instance.new("Message",workspace)
message.Text = AlertText
wait(cooldown)
message:Destroy()
end)
end

local function ClientMusic(ID, Toggle, Volume_X1)
local sound = Instance.new("Sound")
sound.SoundId = ID
sound.Volume = Volume_X1
sound.Parent = game:GetService("SoundService")
sound.TimePosition = 0
sound.Looped = Toggle
sound:Play()
end

local EggTable = {}
local PetsTable = {}
local BossTable = {}
local IslandTable = {}

for _,Egg in pairs(game:GetService("Workspace").Shops:GetChildren()) do
    table.insert(EggTable, Egg.Name)
end

for _,Island in pairs(game:GetService("Workspace").Islands:GetChildren()) do
    table.insert(IslandTable, Island.Name)
end

for _,Boss in pairs(game:GetService("Workspace").Bosses:GetChildren()) do
    table.insert(BossTable, Boss.Name)
end

function teleportTO(placeCFrame)
    local plr = game.Players.LocalPlayer
    if plr.Character then
        plr.Character.HumanoidRootPart.CFrame = placeCFrame
    end
end

function teleportIsland(IslandTag)
    if game:GetService("Workspace").Islands:FindFirstChild(IslandTag) then
        teleportTO(game:GetService("Workspace").Islands[IslandTag].CFrame)
    end
end

function autoUpgradeRebirth()
        game:GetService("ReplicatedStorage").Events.Upgrade:FireServer("rebirthUpgrades")
    end
    
    function autoUpgradeJumps()
        game.ReplicatedStorage.Events.Upgrade:FireServer("jumps")
        end

    function autoupgradegem()
        game:GetService("ReplicatedStorage").Events.Upgrade:FireServer("gemMultiplierUpgrade")
    end

local StyleTitle = "Paid Hub V2.6" -- this title is for style only and not original gui it is for sale. This is FREE!

local function Notify(Object_1, Object_2, dur)
       game:GetService("StarterGui"):SetCore("SendNotification",{ Title = Object_1, Text = Object_2, Button1 = "", Duration = dur or 20, })
end

local Library = loadstring(game:HttpGet("https://pastebin.com/raw/aC8GQEKE"))()
local ui = Library:CreateWindow()


local P_1 = ui:new("Farm")
local P_2 = ui:new("Unlock World")
local P_3 = ui:new("Farm Egg")
local P_4 = ui:new("Auto Rebirth")
local P_6 = ui:new("Boss farm")
local P_5 = ui:new("Misc")

P_1:Ping()
P_1:FPS()
P_1:TimePlayed()
P_1:UTC()

    P_1:CreateToggle("Auto Click", false, function(v)
        getgenv().autoswing = v
        while true do
            if not getgenv().autoswing then return end

            local Event = game:GetService("ReplicatedStorage").Events.Tap
            Event:FireServer()
            
wait()

        end
    end)
  
P_1:CreateToggle("Auto Claim Random Reward", false, function(v)
      A_2 = v
      
         while wait() do
         if A_2 == false then break end
             local Event = game:GetService("ReplicatedStorage").Events.ClaimRandomReward
            Event:FireServer()
            
        end
    end)

P_1:CreateToggle("Auto Claim Rank Reward", false, function(v)
      A_3 = v
      
         while wait() do
         if A_3 == false then break end
             local Event = game:GetService("ReplicatedStorage").Events.ClaimRankReward
            Event:FireServer()
           
        end
    end)

P_1:CreateToggle("Auto Claim Daily Reward", false, function(v)
      A_4 = v
      
         while wait() do
         if A_4 == false then break end
             game:GetService("ReplicatedStorage").Events.OpenDailyReward:InvokeServer()
end
end)

    P_2:CreateBox("Unlock World", "World Name", function(value)
        Teleporter = value
    end)
    
    P_2:CreateDropdown("Unlock Island", IslandTable, function(value)
        teleportIsland(value)
    end)

    P_2:CreateButton("Teleport", function()
        
    if Teleporter == "Spawn" then

       local Greenland = {
         [1] = CFrame.new(-75, 18, -483)        
}
game:GetService("ReplicatedStorage").Events.Teleport:FireServer(unpack(Greenland))

    else if Teleporter == "Flamelands" then
        
        local FlameWorld = {
         [1] = CFrame.new(1138, 150, -2860)        
}
game:GetService("ReplicatedStorage").Events.Teleport:FireServer(unpack(FlameWorld))
        
    else if Teleporter == "Fantasy" then

        local DreamWorld = {
         [1] = CFrame.new(1415, 153, -5604)        
}
game:GetService("ReplicatedStorage").Events.Teleport:FireServer(unpack(DreamWorld))

    else if Teleporter == "Space" then
        local Planet = {
         [1] = CFrame.new(1172, 130, -7966)        
}
game:GetService("ReplicatedStorage").Events.Teleport:FireServer(unpack(Planet))

    else if Teleporter == "Ocean" then
        local UnderwaterWorld = {
         [1] = CFrame.new(1213, 119, -10666)        
}
game:GetService("ReplicatedStorage").Events.Teleport:FireServer(unpack(UnderwaterWorld))

    else if Teleporter == "Secret" then
        local UnknownWorld = {
         [1] = CFrame.new(3372, 1018, -1313)        
}
game:GetService("ReplicatedStorage").Events.Teleport:FireServer(unpack(UnknownWorld))

end
end
end
end
end
end
end)


P_4:CreateBox("Rebirth", "Rebirth Amount", function(value)
        Rebirths = value
    end)


    P_4:CreateToggle("auto rebirth", false, function(v)

        getgenv().autoclicker = v
        while wait(0.1) do
            if not getgenv().autoclicker then return end



    local A_1 = Rebirths
    local Event = game:GetService("ReplicatedStorage").Events.Rebirth
    Event:FireServer(A_1)
end
end)



P_3:CreateDropdown("Select Egg", EggTable, function(value)

        Eggs = value
    end)

P_3:CreateBox("Auto Delete Pet (1)", "Pet name", function(P1)

        DeletePet1 = P1
    end)

P_3:CreateBox("Auto Delete Pet (2)", "Pet name", function(P2)

        DeletePet2 = P2
    end)

P_3:CreateBox("Auto Delete Pet (3)", "Pet name", function(P3)

        DeletePet3 = P3
    end)

P_3:CreateBox("Auto Delete Pet (4)", "Pet name", function(P4)

        DeletePet4 = P4
    end)

    P_3:CreateToggle("auto hatch selected egg", false, function(v)
  
        getgenv().autoclick = v
        while true do
            if not getgenv().autoclick then return end

            local args = {
    [1] = {
        [1] = DeletePet1,
        [2] = DeletePet2,
        [3] = DeletePet3,
        [4] = DeletePet4,
    },
    [2] = Eggs,
    [3] = 1
}

game:GetService("ReplicatedStorage").Events.HatchEgg:InvokeServer(unpack(args))

end
end)

local ToggleRebirth = false
P_5:CreateToggle("Auto upgrade rebirth", false, function(v)
      ToggleRebirth = v
       while wait() do
           if ToggleRebirth == false then break end
       autoUpgradeRebirth()
end
end)

local ToggleJumps = false
P_5:CreateToggle("Auto upgrade jump", false, function(v)
      ToggleJumps = v
       while wait() do
           if ToggleJumps == false then break end
       autoUpgradeJumps()
end
end)

local ToggleGems = false
P_5:CreateToggle("Auto upgrade gem", false, function(v)
      ToggleGems = v
       while wait() do
           if ToggleGems == false then break end
       autoupgradegem()
end
end)

P_6:CreateDropdown("Boss Farm", BossTable, function(value)
    if game:GetService("Workspace").Bosses:FindFirstChild(value) then
pos = CFrame.new(game:GetService("Workspace").Bosses[value].Position)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = pos
else
Notify("Boss Notification","Boss not found")
end
end)

P_5:CreateButton("dex V3", function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/peyton2465/Dex/master/out.lua"))()
end)

P_5:CreateButton("dex V4", function()
loadstring(game:GetObjects("rbxassetid://10055842438")[1])()
end)

P_5:CreateButton("Psy Hub", function()
loadstring(game:GetObjects("rbxassetid://3014051754")[1].Source)()
end)

local Players = game.Players
Players.PlayerAdded:Connect(function(player)
Notify("Player Detector",player.Name.." has joined the game!",5)
end)

local Players = game.Players
Players.PlayerRemoving:Connect(function(player)
Notify("Player Detector",player.Name.." has left the game!",5)
end)
