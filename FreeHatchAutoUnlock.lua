-- Free Hatchers AutoUnlock
local petsFolder = game:GetService("Players").LocalPlayer.Pets
local Lock = game:GetService("ReplicatedStorage").Marchy.PetRemotes.Specific.Lock;

local PetsToUnlock = {
    "Gemstone King",
    "Lava Bat",
    "Floral Stormbringer"
}

for _, pet in ipairs(petsFolder:GetChildren()) do
    local isLocked = pet:FindFirstChild("_Locked")
    local petName = pet:FindFirstChild("_Name")
    if isLocked and petName and isLocked.Value == true then
        for _, name in ipairs(PetsToUnlock) do
            if petName.Value == name then
                Lock:FireServer(pet.Name);
                task.wait()
            end
        end
    end
end
wait(5)

local Target = game:GetService("ReplicatedStorage").Marchy.PetRemotes.Generic.CraftAll;
Target:FireServer();
