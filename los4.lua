--// VyrosxC Hub \\--
local DrRayLibrary = loadstring(game:HttpGet("https://raw.githubusercontent.com/VyrosxC-Hub/NewTest/main/los2.lua"))()

-- Primeira janela (VyrosxC Hub)
local window1 = DrRayLibrary:Load("VyrosxC Hub", "Default")

-- Tab1
local tab1 = DrRayLibrary.newTab("Main", "rbxassetid://100789040568622")

-- Section
tab1.newLabel("Main")

tab1.newButton("Expand Torso", "Button", function()
    ExpandTorso() 
end)

tab1.newButton("Reset Character", "Button", function()
    ResetCharacter()  -- Chama a função para resetar o personagem
end)

-- Player Settings
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

tab1.newInput("Jump Power", "Enter a Value For Jump Power.", function(value)
    local numericValue = tonumber(value) 
    if numericValue then
        local player = game.Players.LocalPlayer
        local character = player.Character or player.CharacterAdded:Wait()
        local humanoid = character:WaitForChild("Humanoid")
        humanoid.JumpPower = numericValue 
        print("Novo valor para JumpPower: " .. numericValue)
    else
        print("Invalid value! Please enter a valid number for JumpPower.")
    end
end)

tab1.newInput("Hip Height", "Default Value '2.5'", function(value)
    local numericValue = tonumber(value)  
    if numericValue then
        setHipHeight(numericValue)  
        print("New value for HipHeight: " .. numericValue)
    else
        print("Invalid value! Please enter a number.")
    end
end)

-- Segunda janela (VyrosxC Hub 2)
local DrRayLibrary2 = loadstring(game:HttpGet("https://raw.githubusercontent.com/VyrosxC-Hub/NewTest/main/los2.lua"))()

local window2 = DrRayLibrary2:Load("VyrosxC Hub 2", "rbxassetid://103168823763561")

-- Tab1
local tab2 = DrRayLibrary2.newTab("Main 2", "rbxassetid://100789040568622")

-- Section
tab2.newLabel("Main 2")

tab2.newButton("Expand Torso", "Button", function()
    ExpandTorso() 
end)

tab2.newButton("Reset Character", "Button", function()
    ResetCharacter()  -- Chama a função para resetar o personagem
end)

-- Player Settings
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

tab2.newInput("Jump Power", "Enter a Value For Jump Power.", function(value)
    local numericValue = tonumber(value) 
    if numericValue then
        local player = game.Players.LocalPlayer
        local character = player.Character or player.CharacterAdded:Wait()
        local humanoid = character:WaitForChild("Humanoid")
        humanoid.JumpPower = numericValue 
        print("Novo valor para JumpPower: " .. numericValue)
    else
        print("Invalid value! Please enter a valid number for JumpPower.")
    end
end)
