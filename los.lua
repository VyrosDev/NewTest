local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/Marwanleprodu91670/muscle-legend-lite-hub-elerium-library-/refs/heads/main/library"))()
local Window = Library:AddWindow("VyrosxC Hub | Legends Of Speed ⚡", { MinSize = Vector2.new(600, 650) })
 
local MainTab = Window:AddTab("Main")

MainTab:AddDropdown("select", function(text)
	if text == "Mars" then  -- Code
		print("o")
	elseif text == "Earth" then
	print("k")
	elseif text == "Iridocyclitis" then
	print("Weeeee")
	end
end)
local mars = dropdown:Add("Mars")  -- Options 
local earth = dropdown:Add("Earth")
local not_a_planet = dropdown:Add("Iridocyclitis")
end

-- Tab de Auto Rebirth
local RebirthTab = Window:AddTab("Auto Rebirth")
local autoRebirthEnabled = false
local rebirthAmount = 0
local currentRebirths = 0

local function autoRebirth()
    spawn(function()
        while autoRebirthEnabled do
            local rebirthEvent = game.ReplicatedStorage:FindFirstChild("rebirthRemote")
            if rebirthEvent and (rebirthAmount == 0 or currentRebirths < rebirthAmount) then
                rebirthEvent:FireServer()
                currentRebirths = currentRebirths + 1
            else
                autoRebirthEnabled = false
            end
            wait(0.5)
        end
    end)
end

RebirthTab:AddSwitch("Ativar Auto Rebirth", function(state)
    autoRebirthEnabled = state
    if state then autoRebirth() end
end)

RebirthTab:AddTextBox("Definir Meta de Rebirths", function(value)
    rebirthAmount = tonumber(value) or 0
    currentRebirths = 0
    print("Meta de Rebirth definida: " .. rebirthAmount)
end)

-- Tab de Auto Farm
local AutoFarmTab = Window:AddTab("Auto Farm")

AutoFarmTab:AddSwitch("Auto Weight", function(state)
    if state then
        spawn(function()
            while state do
                local tool = game.Players.LocalPlayer.Backpack:FindFirstChild("Weight")
                if tool then
                    game.Players.LocalPlayer.Character.Humanoid:EquipTool(tool)
                    tool:Activate()
                end
                wait(0.1)
            end
        end)
    end
end)

-- Tab de Teleporte
local TeleportTab = Window:AddTab("Teleport")

TeleportTab:AddButton("Teleporte para o Beach", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-11, 5, -178)
end)

TeleportTab:AddButton("Teleporte para Muscle", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-8626, 15, -5730)
end)

-- Tab de Créditos
local CreditsTab = Window:AddTab("Credits")
CreditsTab:AddLabel("VyrosxC Hub by @Alexg78909")
CreditsTab:AddButton("Copiar Discord", function()
    setclipboard("discord.gg/uydz6pZWMk")
    print("Link do Discord copiado para a área de transferência!")
end)

-- Inicialização
Library:Init()
