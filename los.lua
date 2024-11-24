--// Functions \\--
 
-- Function Expand Torso --
local function ExpandTorso()
    local player = game.Players.LocalPlayer
    local character = player.Character or player.CharacterAdded:Wait()
    local torso = character:WaitForChild("UpperTorso")
 
    local expansionRate = Vector3.new(2, 2, 2) 

    torso.Size = torso.Size + expansionRate
end

-- Function Reset Character --
local function ResetCharacter()
    local player = game.Players.LocalPlayer
    local character = player.Character or player.CharacterAdded:Wait()

    character:BreakJoints()

    print("The character has been reset to its original state!")
end




-- Function Auto Race V2 --
local AutoRaceToggle = false  
local Player = game.Players.LocalPlayer  

-- Conectar à mudança da variável 'raceInProgress'
game:GetService('ReplicatedStorage').raceInProgress.Changed:Connect(function()
    if AutoRaceToggle then  -- Verifica se o Auto Race está ativado
        if game:GetService('ReplicatedStorage').raceInProgress.Value == true then
            game:GetService('ReplicatedStorage').rEvents.raceEvent:FireServer("joinRace")  -- Envia o evento para o servidor para entrar na corrida
        end
    end
end)

game:GetService('ReplicatedStorage').raceStarted.Changed:Connect(function()
    if AutoRaceToggle then  
        if game:GetService('ReplicatedStorage').raceStarted.Value == true then
          
            for i, v in pairs(game:GetService('Workspace').raceMaps:GetChildren()) do
             
                if v:FindFirstChild("finishPart") then
                    local OldFinishPosition = v.finishPart.CFrame
                    v.finishPart.CFrame = Player.Character.HumanoidRootPart.CFrame 
                    wait()
                    v.finishPart.CFrame = OldFinishPosition 
                end
            end
        end
    end
end)

local function ToggleAutoRace(state)
    AutoRaceToggle = state
    print("Auto Race Toggle: " .. (AutoRaceToggle and "Enabled" or "Disabled"))
end

game:GetService('ReplicatedStorage').raceStarted.Changed:Connect(function()
    if AutoRaceToggle then  -- Verifica se o Auto Race está ativado
        if game:GetService('ReplicatedStorage').raceStarted.Value == true then
            -- Teleporta o jogador para a posição de corrida quando a corrida começar
            for i, v in pairs(game:GetService('Workspace').raceMaps:GetChildren()) do
                -- Verificar se a parte de final de corrida (finishPart) existe
                if v:FindFirstChild("finishPart") then
                    local OldFinishPosition = v.finishPart.CFrame
                    v.finishPart.CFrame = Player.Character.HumanoidRootPart.CFrame 
                    wait()  
                    v.finishPart.CFrame = OldFinishPosition  
                end
            end
        end
    end
end)





-- Function Hip Height
local function setHipHeight(value)
    local player = game.Players.LocalPlayer
    local character = player.Character or player.CharacterAdded:Wait()
    local humanoid = character:WaitForChild("Humanoid")
    humanoid.HipHeight = value  -- Define a altura do quadril (HipHeight)
end



--// VyrosxC Hub \\--
local DrRayLibrary = loadstring(game:HttpGet("https://raw.githubusercontent.com/VyrosxC-Hub/NewTest/main/los2.lua"))()

-- Create a new window and set its title and theme
local window = DrRayLibrary:Load("VyrosxC Hub", "Default")

-- Create the first tab with an image ID
local tab1 = DrRayLibrary.newTab("Main", "100789040568622")


-- Section
tab1.newLabel("Main")

tab1.newButton("Expand Torso", "Beta", function()
    ExpandTorso() 
end)

-- Adicionando o botão "Reset Character"
tab1.newButton("Reset Character", "Restart If Necessary", function()
    ResetCharacter()  -- Chama a função para resetar o personagem
end)


-- Section
tab1.newLabel("Player Settings")

tab.newInput("Alterar HipHeight", "Digite um valor para o HipHeight.", function(value)
    local numericValue = tonumber(value)  -- Tenta converter o valor digitado para número
    if numericValue then
        setHipHeight(numericValue)  -- Chama a função setHipHeight para alterar a altura
        print("Novo valor para HipHeight: " .. numericValue)
    else
        print("Valor inválido! Por favor, insira um número.")
    end
end)

tab1.newToggle("Auto Race V2", "Best Auto Race 💀", false, function(Value)
    ToggleAutoRace(Value)  -- Ativa ou desativa o Auto Race com base no valor do toggle
    if AutoRaceToggle then
        print("Auto Race V2 Enabled")
    else
        print("Auto Race V2 Disabled!")
    end
end)

-- Create the second tab with a different image ID
local tab2 = DrRayLibrary.newTab("Tab 2", "ImageIdLogoHere")

-- Add elements to the second tab
tab2.newLabel("Hello, this is Tab 2.")
tab2.newButton("Button", "Prints Hello!", function()
    print('Hello!')
end)


tab2.newDropdown("Dropdown", "Select one of these options!", {"water", "dog", "air", "bb", "airplane", "wohhho", "yeay", "delete"}, function(selectedOption)
    print(selectedOption)
end)
