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





-- Function Hip Height --
local function setHipHeight(value)
    local player = game.Players.LocalPlayer
    local character = player.Character or player.CharacterAdded:Wait()
    local humanoid = character:WaitForChild("Humanoid")
    humanoid.HipHeight = value  -- Define a altura do quadril (HipHeight)
end

-- Function WalkSpeed and JumpPower
local function setPlayerStats(walkSpeed, jumpPower)
    local player = game.Players.LocalPlayer
    local character = player.Character or player.CharacterAdded:Wait()
    local humanoid = character:WaitForChild("Humanoid")
    
    -- Ajusta a velocidade de caminhada
    humanoid.WalkSpeed = walkSpeed
    print("Speed ​​adjusted to: " .. walkSpeed)
    
    -- Ajusta o poder de pulo
    humanoid.JumpPower = jumpPower
    print("Jump power adjusted to: " .. jumpPower)
end




-- Function Anti-Kick --
local function AntiKick()
    local vu = game:GetService("VirtualUser")
    game:GetService("Players").LocalPlayer.Idled:Connect(function()
        vu:Button2Down(Vector2.new(0, 0), workspace.CurrentCamera.CFrame)
        wait(1)
        vu:Button2Up(Vector2.new(0, 0), workspace.CurrentCamera.CFrame)
    end)
end

-- Function Low Graphics --
local function optimizeFpsPing()
    for _, v in pairs(game:GetService("Workspace"):GetDescendants()) do
        if v:IsA("BasePart") and not v.Parent:FindFirstChild("Humanoid") then
            v.Material = Enum.Material.SmoothPlastic
            if v:IsA("Texture") then
                v:Destroy()
            end
        end
    end
end



-- Function City Teleports --
local function SelectCity(city)
    if city == "Main City" then
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-9686.27148, 58.9799881, 3110.75903, -0.993164003, 2.12365538e-08, -0.116727315, 2.63954707e-08, 1, -4.26504876e-08, 0.116727315, -4.54400002e-08, -0.993164003)
    elseif city == "Snow City" then
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-9672.77832, 58.9799881, 3768.75171, 0.991323948, -1.89020124e-08, -0.131441399, 1.31006459e-08, 1, -4.50012685e-08, 0.131441399, 4.28888676e-08, 0.991323948)
    elseif city == "Magma City" then
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-11051.4258, 216.940002, 4886.27832, 0.987576485, 3.03587235e-08, -0.157139242, -3.89276664e-08, 1, -5.14532452e-08, 0.157139242, 5.69310785e-08, 0.987576485)
    elseif city == "Legends Highway" then
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-13095.9746, 214.580338, 5895.57568, 0.999146283, 0.0376458429, -0.0170128513, -0.037201196, 0.99897629, 0.0257374309, 0.0179643426, -0.0250825603, 0.999523938)
    end
end


--// VyrosxC Hub \\--
local DrRayLibrary = loadstring(game:HttpGet("https://raw.githubusercontent.com/VyrosxC-Hub/NewTest/main/los2.lua"))()

local window = DrRayLibrary:Load("VyrosxC Hub", "Default")



-- Tab1
local tab1 = DrRayLibrary.newTab("Main", "100789040568622")

-- Section
tab1.newLabel("Main")

tab1.newButton("Expand Torso", "Button", function()
    ExpandTorso() 
end)

-- Adicionando o botão "Reset Character"
tab1.newButton("Reset Character", "Button", function()
    ResetCharacter()  -- Chama a função para resetar o personagem
end)



-- Section
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
    local numericValue = tonumber(value)  -- Tenta converter o valor digitado para número
    if numericValue then
        setHipHeight(numericValue)  -- Chama a função setHipHeight para alterar a altura
        print("New value for HipHeight: " .. numericValue)
    else
        print("Invalid value! Please enter a number.")
    end
end)



-- Section
tab1.newLabel("Game Options")

tab1.newButton("Anti-Kick", "Button", function()
    AntiKick()  -- Activates the Anti-Kick function
    print("Anti-Kick activated!")
end)

tab1.newButton("Low Graphics", "Button", function()
    optimizeFpsPing()  -- Activates the Low Graphics function
    print("Graphics settings optimized!")
end)



-- Section
tab1.newLabel("Emergency")

tab1.newButton("Re-join The Game", "Button", function()
    
    local teleportService = game:GetService("TeleportService")
    local player = game:GetService("Players").LocalPlayer
    teleportService:Teleport(game.PlaceId, player)  
    print("Trying to get into the game...")  
end)


tab1.newToggle("Auto Race V2", "Best Auto Race 💀", false, function(Value)
    ToggleAutoRace(Value)  -- Ativa ou desativa o Auto Race com base no valor do toggle
    if AutoRaceToggle then
        print("Auto Race V2 Enabled")
    else
        print("Auto Race V2 Disabled!")
    end
end)



-- Tab2
local tab2 = DrRayLibrary.newTab("Teleports", "ImageIdLogoHere")

-- Section 
tab2.newLabel("City Teleports")

tab2.newDropdown("Select City", "Teleports", {"Main City", "Snow City", "Magma City", "Legends Highway"}, function(selectedCity)
    -- Call the SelectCity function with the selected city
    SelectCity(selectedCity)
    print("Selected City: " .. selectedCity)
end)
