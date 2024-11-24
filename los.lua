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



--// VyrosxC Hub \\--
local DrRayLibrary = loadstring(game:HttpGet("https://raw.githubusercontent.com/VyrosxC-Hub/NewTest/main/los2.lua"))()

local window = DrRayLibrary:Load("VyrosxC Hub", "Default")

local tab1 = DrRayLibrary.newTab("Main", "100789040568622")



-- Section
tab1.newLabel("Main")

tab1.newButton("Expand Torso", "Beta", function()
    ExpandTorso() 
end)

-- Adicionando o botão "Reset Character"
tab1.newButton("Reset Character", "Emergency", function()
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

tab1.newButton("Anti-Kick", "Anti 20 Min Bot", function()
    AntiKick()  -- Activates the Anti-Kick function
    print("Anti-Kick activated!")
end)

tab1.newButton("Low Graphics", "FPS + Ping", function()
    optimizeFpsPing()  -- Activates the Low Graphics function
    print("Graphics settings optimized!")
end)



-- Section
tab1.newLabel("Emergency")

tab1.newButton("Re-join The Game", "Re-Join", function()
    -- Teleports the player back to the same game instance
    local teleportService = game:GetService("TeleportService")
    local player = game:GetService("Players").LocalPlayer
    teleportService:Teleport(game.PlaceId, player)  -- Teleports to the current PlaceId
    print("Trying to get into the game...")  -- Confirms that the action was triggered
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
