task.wait(15)
--Toggles
_G.Hatch    = true
_G.Airdrops = true
_G.Upgrade  = false
--Hatching
local Egg    = "Painted Spring Egg";
local Amount = "Buy8";
local BuyEgg = game:GetService("ReplicatedStorage").GameClient.Events.RemoteFunction.BuyEgg;
local LimitedEgg = game:GetService("ReplicatedStorage").Events.HatchLimited;
--Boosts
local GemBoost = "Gems";
local CoinBoost = "Coins";
local RebirthBoost = "Rebirth";
local LuckBoost = "Luck";
local HatchBoost = "Hatch";
local BuyBoost = game:GetService("ReplicatedStorage").Events.BuyBoost;
--Upgrades
local EXPUpgrade = "EXP";
local BuyUpgrade = game:GetService("ReplicatedStorage").GameClient.Events.RemoteEvent["Upgrade Controller"];
--Misc.
local player = game.Players.LocalPlayer
local EggTp = game:GetService("Workspace").Eggs[Egg].View.CFrame 
local workspace = game:GetService("Workspace")
--Actual Stuff
local function onCharacterAdded(character)
  game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = EggTp 
  task.wait(1)
  LimitedEgg:FireServer();
  task.wait(1)
  for i = 1,3 do
    task.wait(0.3)
    BuyBoost:FireServer(GemBoost);
    BuyBoost:FireServer(CoinBoost);
    BuyBoost:FireServer(RebirthBoost);
    BuyBoost:FireServer(LuckBoost);
    BuyBoost:FireServer(HatchBoost);
  end
  spawn(function()
    while _G.Hatch and task.wait() do
      BuyEgg:InvokeServer(Egg, Amount);
    end
  end)
  while _G.Airdrops and task.wait(5) do
    local descendants = workspace:GetDescendants()
    for _, descendant in pairs(descendants) do
      if descendant:IsA("Part") and descendant.Name == "Particles" then
        game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = descendant.CFrame
        task.wait(0.5)
        descendant:Destroy()
        task.wait(0.5)
        game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = EggTp 
      end
    end
  end
  while _G.Upgrade and task.wait(5) do 
    BuyUpgrade:FireServer(EXPUpgrade);
  end
end

player.CharacterAdded:Connect(onCharacterAdded)

if player.Character then
  onCharacterAdded(player.Character)
end
