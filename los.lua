--// Functions \\--
 
-- Function Expand Torso --
local function ExpandTorso()
    local player = game.Players.LocalPlayer
    local character = player.Character or player.CharacterAdded:Wait()
    local torso = character:WaitForChild("UpperTorso")

    -- Definindo a taxa de expansão
    local expansionRate = Vector3.new(2, 2, 2) 

    -- Expande o torso
    torso.Size = torso.Size + expansionRate
end

-- Function Reset Character --
local function ResetCharacter()
    local player = game.Players.LocalPlayer
    local character = player.Character or player.CharacterAdded:Wait()

    -- Destrói a estrutura atual do personagem (quebrando os joints)
    character:BreakJoints()

    -- O Roblox vai automaticamente gerar um novo personagem, retornando ao seu estado inicial
    print("The character has been reset to its original state!")
end

-- Function WalkSpeed e JumpPower --
local function setPlayerStats(walkSpeed, jumpPower)
    local player = game.Players.LocalPlayer
    local character = player.Character or player.CharacterAdded:Wait()
    local humanoid = character:WaitForChild("Humanoid")
    
    -- Ajusta a velocidade
    humanoid.WalkSpeed = walkSpeed
    print("Speed ​​adjusted to: " .. walkSpeed)
    
    -- Ajusta o poder de pulo
    humanoid.JumpPower = jumpPower
    print("Jump power adjusted to: " .. jumpPower)
end

-- Definir o Toggle de Auto Race
local AutoRaceToggle = false  -- A variável que controla o estado do toggle

-- Função Auto Race V2 --
game:GetService('ReplicatedStorage').raceInProgress.Changed:Connect(function()
    if AutoRaceToggle then  -- Verifica se o Auto Race está ativado
        if game:GetService('ReplicatedStorage').raceInProgress.Value == true then
            game:GetService('ReplicatedStorage').rEvents.raceEvent:FireServer("joinRace")  -- Envia o evento para o servidor para entrar na corrida
            print("Joined the race!")
        end
    end
end)

game:GetService('ReplicatedStorage').raceStarted.Changed:Connect(function()
    if AutoRaceToggle then  -- Verifica se o Auto Race está ativado
        if game:GetService('ReplicatedStorage').raceStarted.Value == true then
            -- Teleporta o jogador para a posição de corrida quando a corrida começar
            for i, v in pairs(game:GetService('Workspace').raceMaps:GetChildren()) do
                local OldFinishPosition = v.finishPart.CFrame
                v.finishPart.CFrame = Players.LocalPlayer.Character.HumanoidRootPart.CFrame
                wait(1)
                v.finishPart.CFrame = OldFinishPosition
            end
            print("Race started, ready to race!")
        end
    end
end)

game:GetService('ReplicatedStorage').raceEnded.Changed:Connect(function()
    if AutoRaceToggle then  -- Verifica se o Auto Race está ativado
        if game:GetService('ReplicatedStorage').raceEnded.Value == true then
            -- Verifica se o jogador ganhou a corrida
            local player = Players.LocalPlayer
            if player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
                -- Aqui podemos definir uma condição para determinar se o jogador venceu
                -- Exemplo simples de verificação, dependendo da estrutura do jogo
                if player.Character.HumanoidRootPart.Position == game:GetService("Workspace").raceMaps.finishPart.Position then
                    print("You won the race!")
                else
                    print("You lost the race!")
                end
            end
        end
    end
end)

-- Função para ativar/desativar o Auto Race
local function ToggleAutoRace(state)
    AutoRaceToggle = state
    print("Auto Race Toggle: " .. (AutoRaceToggle and "Enabled" or "Disabled"))
end


--// VyrosxC Hub UI \\--
local DrRayLibrary = loadstring(game:HttpGet("https://raw.githubusercontent.com/VyrosxC-Hub/NewTest/main/los2.lua"))()

-- Create a new window and set its title and theme
local window = DrRayLibrary:Load("VyrosxC Hub", "Default")

-- Create the first tab with an image ID
local tab1 = DrRayLibrary.newTab("Main", "100789040568622")


-- Section
tab1.newLabel("Main")

tab1.newButton("Expand Torso", "BETA", function()
    ExpandTorso() 
end)

-- Adicionando o botão "Reset Character"
tab1.newButton("Reset Character", "Restart If Necessary", function()
    ResetCharacter()  -- Chama a função para resetar o personagem
end)


-- Section
tab1.newLabel("Player Settings")

tab1.newInput("Walk Speed", "Select Your Walk Speed.", function()
    setPlayerStats()     
    print("Invalid value for WalkSpeed: " .. text)
end)

tab1.newToggle("Auto Race V2", "The Best Auto Race 💀", true, function(Value)
    ToggleAutoRace(Value)
    if AutoRaceToggle then
        print("Auto Race Started!")
    else
        print("Auto Race Stopped!")
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
