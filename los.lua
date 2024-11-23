local library = loadstring(game:HttpGet("https://raw.githubusercontent.com/VyrosxC-Hub/NewTest/main/los2.lua", true))()
local Window = Library:AddWindow("VyrosxC Hub", { MinSize = Vector2.new(600, 650) })

-- Adicionar Abas
local statsTab = window:AddTab("Stats") -- Aba de Estatísticas
statsTab:Show()

local autoRebirthTab = window:AddTab("Auto Rebirth") -- Aba de Rebirth Automático
local autoRaceTab = window:AddTab("Auto Race") -- Aba de Corridas Automáticas
local chatSpamTab = window:AddTab("Chat Spam") -- Aba de Spam de Chat
local extraTab = window:AddTab("Extra") -- Aba de Extras
local creditsTab = window:AddTab("Credits") -- Aba de Créditos

-- Função para Atualizar Estatísticas
local function updateStats()
    local player = game.Players.LocalPlayer
    local leaderstats = player:WaitForChild("leaderstats")
    statsTab:AddLabel("Steps: " .. leaderstats.Steps.Value)
    statsTab:AddLabel("Rebirths: " .. leaderstats.Rebirths.Value)
    statsTab:AddLabel("Hoops: " .. leaderstats.Hoops.Value)
    statsTab:AddLabel("Races: " .. leaderstats.Races.Value)
end
updateStats()

-- Auto Rebirth
local rebirthFolder = autoRebirthTab:AddFolder("Rebirth Stopping Point")
rebirthFolder:AddTextBox("Set Rebirth Goal", function(value)
    local target = tonumber(value)
    if target then
        targetRebirth = target
        print("Rebirth goal set to: " .. targetRebirth)
    else
        print("Invalid value!")
    end
end)

rebirthFolder:AddSwitch("Enable Auto Rebirth", function(state)
    getgenv().AutoRebirth = state
    while AutoRebirth do
        Rebirth()
        wait(0.7)
    end
end)

-- Auto Race
local raceFolder = autoRaceTab:AddFolder("Race Options")
local raceDropdown = raceFolder:AddDropdown("Select Map", function(selected)
    _G.SelectedTeleport = selected
    print("Selected Map: " .. selected)
end)

raceDropdown:Add("Main City")
raceDropdown:Add("Space")
raceDropdown:Add("Desert")

raceFolder:AddSwitch("Enable Auto Race", function(state)
    toggleAutoRaces(state)
end)

-- Spam no Chat
chatSpamTab:AddTextBox("Spam Message", function(value)
    _G.Message = value
end)

chatSpamTab:AddTextBox("Interval (s)", function(value)
    _G.Interval = tonumber(value) or 1
end)

chatSpamTab:AddSwitch("Enable Chat Spam", function(state)
    _G.SendMessages = state
    if state then
        spawn(function()
            while _G.SendMessages do
                if _G.Message and _G.Message ~= "" then
                    sendChatMessage(_G.Message)
                end
                wait(_G.Interval)
            end
        end)
    end
end)

-- Extras
extraTab:AddSwitch("Enable No Clip", function(state)
    toggleNoclip(state)
end)

extraTab:AddTextBox("Set Gravity", function(value)
    local gravity = tonumber(value)
    if gravity then
        workspace.Gravity = gravity
    else
        print("Invalid gravity value!")
    end
end)

extraTab:AddButton("Delete Barriers", function()
    deleteBarrier()
end)

-- Créditos
creditsTab:AddLabel("VyrosxC Hub")
creditsTab:AddLabel("Script Created By VyrosxC (@Alexg78909)")
creditsTab:AddButton("Join Discord", function()
    setclipboard("discord.gg/uydz6pZWMk")
    print("Discord link copied!")
end)

creditsTab:AddLabel("Collaborators:")
creditsTab:AddLabel("Demonnic_Fast (@ericklopes16)")

-- Finalizar Inicialização
library:Init()
