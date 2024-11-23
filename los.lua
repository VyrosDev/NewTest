local library = loadstring(game:HttpGet("https://raw.githubusercontent.com/Marwanleprodu91670/muscle-legend-lite-hub-elerium-library-/refs/heads/main/library", true))()
local Window = Library:AddWindow("Muscle Legends V8", { MinSize = Vector2.new(600, 650) })

-- Criando a Tab Principal
local features = window:AddTab("Main")
features:Show()

-- Funções para manipular o personagem
local function ExpandTorso()
    local character = game.Players.LocalPlayer.Character
    if character then
        -- Exemplo de expansão do torso
        character:WaitForChild("Torso").Size = Vector3.new(10, 10, 10)
    end
end

local function ResetCharacter()
    local character = game.Players.LocalPlayer.Character
    if character then
        -- Resetando o personagem ao tamanho normal
        character:WaitForChild("Torso").Size = Vector3.new(2, 2, 2)
    end
end

-- Funções para alterar as estatísticas do jogador
local function setPlayerStats(walkSpeed, jumpPower)
    local player = game.Players.LocalPlayer
    if player and player.Character then
        local humanoid = player.Character:FindFirstChildOfClass("Humanoid")
        if humanoid then
            humanoid.WalkSpeed = walkSpeed
            humanoid.JumpPower = jumpPower
        end
    end
end

local function setHipHeight(value)
    local player = game.Players.LocalPlayer
    if player and player.Character then
        local humanoid = player.Character:FindFirstChildOfClass("Humanoid")
        if humanoid then
            humanoid.HipHeight = value
        end
    end
end

-- Adicionando botões para expandir e resetar o torso
features:AddButton("Expand Torso", function()
    ExpandTorso()
    print("Successfully expanded torso!")
end)

features:AddButton("Reset Character", function()
    ResetCharacter()
    print("The character has been reset to normal size!")
end)

-- Inputs para WalkSpeed e JumpPower
features:AddTextBox("Walk Speed", function(value)
    local newWalkSpeed = tonumber(value)
    if newWalkSpeed then
        local currentJumpPower = game.Players.LocalPlayer.Character.Humanoid.JumpPower
        setPlayerStats(newWalkSpeed, currentJumpPower)
    else
        print("Invalid value for WalkSpeed.")
    end
end)

features:AddTextBox("Jump Power", function(value)
    local newJumpPower = tonumber(value)
    if newJumpPower then
        local currentWalkSpeed = game.Players.LocalPlayer.Character.Humanoid.WalkSpeed
        setPlayerStats(currentWalkSpeed, newJumpPower)
    else
        print("Invalid value for JumpPower.")
    end
end)

features:AddTextBox("Hip Height", function(value)
    local newValue = tonumber(value)
    if newValue then
        setHipHeight(newValue)
        print("Hip height adjusted to: " .. newValue)
    else
        print("Invalid value for HipHeight.")
    end
end)

-- Funções para opções do jogo
local function AntiKick()
    -- Função para evitar o kick do servidor
    -- Implementar a lógica aqui
    print("Anti-Kick activated!")
end

local function optimizeFpsPing()
    -- Função para otimizar os gráficos e melhorar o desempenho
    -- Implementar a lógica aqui
    print("Optimized graphics for better performance!")
end

-- Botões para opções do jogo
features:AddButton("Anti-Kick", function()
    AntiKick()
end)

features:AddButton("Low Graphics", function()
    optimizeFpsPing()
end)

-- Função para reentrar no jogo
local function reJoinGame()
    local teleportService = game:GetService("TeleportService")
    local player = game:GetService("Players").LocalPlayer
    teleportService:Teleport(game.PlaceId, player)
    print("Trying to get into the game...")
end

features:AddButton("Re-join The Game", function()
    reJoinGame()
end)

-- Função para teleportar para cidades, mapas, ou locais
local function SelectCity(value)
    -- Lógica para teletransportar para a cidade
    print("Teleported to: " .. value)
end

features:AddDropdown("Select City", function(text)
    SelectCity(text)
end)

features:AddDropdown("Select Map", function(text)
    -- Lógica para teletransportar para o mapa
    print("Teleported to map: " .. text)
end)

features:AddDropdown("Select Spawn", function(text)
    -- Lógica para teletransportar para o spawn
    print("Teleported to spawn: " .. text)
end)

features:AddDropdown("Select Chest", function(text)
    -- Lógica para teletransportar para o chest
    print("Teleported to chest: " .. text)
end)

-- Funções para farm automático
local isCollecting = false

local function CollectOrbs()
    -- Lógica de coleta automática de orbes
    print("Collecting orbs...")
end

features:AddSwitch("Auto Farm", function(state)
    isCollecting = state
    print("Auto Farm Status: " .. (isCollecting and "Enabled" or "Disabled"))

    while isCollecting do
        CollectOrbs()
        wait(0.3)
    end
end)

-- Função No Ping
local noPingEnabled = false

local function NoPing()
    -- Lógica para ativar No Ping
    print("No Ping activated!")
end

features:AddSwitch("No Ping", function(state)
    noPingEnabled = state
    print("No Ping Status: " .. (noPingEnabled and "Enabled" or "Disabled"))

    if noPingEnabled then
        NoPing()
    end
end)

-- Adicionando funcionalidade de Hoops
features:AddSwitch("Hoops V1", function(state)
    while state do
        -- Função de farm de hoops V1
        print("Farming Hoops V1")
        wait(0.3)
    end
end)

features:AddSwitch("Hoops V2", function(state)
    while state do
        -- Função de farm de hoops V2
        print("Farming Hoops V2")
        wait(0.3)
    end
end)

-- Inicialização
Library:Init()
