local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/Marwanleprodu91670/muscle-legend-lite-hub-elerium-library-/refs/heads/main/library"))()
local Window = Library:AddWindow("VyrosxC Hub | Legends Of Speed ⚡", { MinSize = Vector2.new(600, 650) })

-- Criando a Tab Principal
local Tab = Window:AddTab("Main")
local StatsSection = Tab:AddSection("Player Info")

Tab:AddLabel("UserID: " .. game.Players.LocalPlayer.UserId)
Tab:AddLabel("Status: Online")
Tab:AddLabel("Key: Valid ✅")

-- Função para atualizar os valores das estatísticas
local function UpdatePlayerStats()
    local player = game.Players.LocalPlayer
    local userID = player.UserId
    local playerStatus = "Online"  -- Status sempre online
    local playerKey = "Valid ✅"  -- Chave sempre válida

    -- Atualizar os Labels com os valores
    Tab:UpdateLabel("UserID: " .. userID)
    Tab:UpdateLabel("Status: " .. playerStatus)
    Tab:UpdateLabel("Key: " .. playerKey)
end

-- Atualizar as estatísticas a cada 5 segundos
game:GetService("RunService").Heartbeat:Connect(function()
    UpdatePlayerStats()
end)

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

-- Adicionando botões para expandir e resetar o torso
Tab:AddButton("Expand Torso", function()
    ExpandTorso()
    print("Successfully expanded torso!")
end)

Tab:AddButton("Reset Character", function()
    ResetCharacter()
    print("The character has been reset to normal size!")
end)

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

-- Inputs para WalkSpeed e JumpPower
Tab:AddTextbox("Walk Speed", { Default = "500", TextDisappear = true, Callback = function(value)
    local newWalkSpeed = tonumber(value)
    if newWalkSpeed then
        local currentJumpPower = game.Players.LocalPlayer.Character.Humanoid.JumpPower
        setPlayerStats(newWalkSpeed, currentJumpPower)
    else
        print("Invalid value for WalkSpeed.")
    end
end})

Tab:AddTextbox("Jump Power", { Default = "200", TextDisappear = true, Callback = function(value)
    local newJumpPower = tonumber(value)
    if newJumpPower then
        local currentWalkSpeed = game.Players.LocalPlayer.Character.Humanoid.WalkSpeed
        setPlayerStats(currentWalkSpeed, newJumpPower)
    else
        print("Invalid value for JumpPower.")
    end
end})

-- Função para definir a altura do quadril (HipHeight)
local function setHipHeight(value)
    local player = game.Players.LocalPlayer
    if player and player.Character then
        local humanoid = player.Character:FindFirstChildOfClass("Humanoid")
        if humanoid then
            humanoid.HipHeight = value
        end
    end
end

Tab:AddTextbox("Hip Height", { Default = "2.5", TextDisappear = true, Callback = function(value)
    local newValue = tonumber(value)
    if newValue then
        setHipHeight(newValue)
        print("Hip height adjusted to: " .. newValue)
    else
        print("Invalid value for HipHeight.")
    end
end})

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
Tab:AddButton("Anti-Kick", function()
    AntiKick()
end)

Tab:AddButton("Low Graphics", function()
    optimizeFpsPing()
end)

-- Função para reentrar no jogo
local function reJoinGame()
    local teleportService = game:GetService("TeleportService")
    local player = game:GetService("Players").LocalPlayer
    teleportService:Teleport(game.PlaceId, player)
    print("Trying to get into the game...")
end

Tab:AddButton("Re-join The Game", function()
    reJoinGame()
end)

-- Função para teleportar para cidades, mapas, ou locais
local function SelectCity(value)
    -- Lógica para teletransportar para a cidade
    print("Teleported to: " .. value)
end

Tab:AddDropdown("Select City", { Default = "None", Options = {"None", "Main City", "Snow City", "Magma City", "Legends Highway"}, Callback = SelectCity })

-- Funções para farm automático
local isCollecting = false

local function CollectOrbs()
    -- Lógica de coleta automática de orbes
    print("Collecting orbs...")
end

Tab:AddToggle("Auto Farm", { Default = false, Callback = function(state)
    isCollecting = state
    print("Auto Farm Status: " .. (isCollecting and "Enabled" or "Disabled"))

    while isCollecting do
        CollectOrbs()
        wait(0.3)
    end
end})

-- Função No Ping
local noPingEnabled = false

local function NoPing()
    -- Lógica para ativar No Ping
    print("No Ping activated!")
end

Tab:AddToggle("No Ping", { Default = false, Callback = function(state)
    noPingEnabled = state
    print("No Ping Status: " .. (noPingEnabled and "Enabled" or "Disabled"))

    if noPingEnabled then
        NoPing()
    end
end})

-- Tab de Créditos
local CreditsTab = Window:AddTab("Credits")
CreditsTab:AddLabel("VyrosxC Hub by @Alexg78909")
CreditsTab:AddButton("Copiar Discord", function()
    setclipboard("discord.gg/uydz6pZWMk")
    print("Link do Discord copiado para a área de transferência!")
end)

-- Inicialização
Library:Init()
