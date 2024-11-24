--// VyrosxC Hub \\--
local DrRayLibrary = loadstring(game:HttpGet("https://raw.githubusercontent.com/VyrosxC-Hub/NewTest/main/los2.lua"))()

-- Primeira Janela (VyrosxC Hub)
local window1 = DrRayLibrary:Load("VyrosxC Hub", "Default")

-- Tab1 para a primeira janela
local tab1 = DrRayLibrary.newTab("Main", "rbxassetid://100789040568622")

tab1.newLabel("Main")

tab1.newButton("Expand Torso", "Button", function()
    ExpandTorso() 
end)

tab1.newButton("Reset Character", "Button", function()
    ResetCharacter()  -- Chama a função para resetar o personagem
end)

tab1.newLabel("Player Settings")

tab1.newInput("Walk Speed", "Enter a Value For Walk Speed", function(value)
    local numericValue = tonumber(value) 
    if numericValue then
        local player = game.Players.LocalPlayer
        local character = player.Character or player.CharacterAdded:Wait()
        local humanoid = character:WaitForChild("Humanoid")
        humanoid.WalkSpeed = numericValue  
        print("New value for WalkSpeed: " .. numericValue)
    else
        print("Invalid value! Please enter a valid number for WalkSpeed.")
    end
end)

-- Segunda Janela (VyrosxC Hub 2)
local window2 = DrRayLibrary:Load("VyrosxC Hub 2", "rbxassetid://103168823763561")

-- Tab1 para a segunda janela
local tab2 = DrRayLibrary.newTab("Main 2", "rbxassetid://100789040568622")

tab2.newLabel("Main 2")

tab2.newButton("Expand Torso", "Button", function()
    ExpandTorso() 
end)

tab2.newButton("Reset Character", "Button", function()
    ResetCharacter()  -- Chama a função para resetar o personagem
end)

tab2.newLabel("Player Settings")

tab2.newInput("Walk Speed", "Enter a Value For Walk Speed", function(value)
    local numericValue = tonumber(value) 
    if numericValue then
        local player = game.Players.LocalPlayer
        local character = player.Character or player.CharacterAdded:Wait()
        local humanoid = character:WaitForChild("Humanoid")
        humanoid.WalkSpeed = numericValue  
        print("New value for WalkSpeed: " .. numericValue)
    else
        print("Invalid value! Please enter a valid number for WalkSpeed.")
    end
end)
