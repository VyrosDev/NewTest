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

-- Function Maps Teleports --
local function SelectMap(location)
    if location == "Desert" then
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(2506.85156, 14.74121, 4353.92725, -0.0108262217, 3.44026461e-08, 0.999941409, 4.99142838e-10, 1, -3.43992568e-08, -0.999941409, 1.26699637e-10, -0.0108262217)
    elseif location == "Space" then
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-346.1203, 3.85000086, 577.441223, 0.649530411, -5.26415e-08, 0.760335565, -2.8906797e-08, 1, 9.39287119e-08, -0.760335565, -8.29884286e-08, 0.649530411)
    end
end

-- Function Chest Teleports --
local function SelectChest(chest)
    if chest == "Main City Chest" then
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-668.435242, 64.7499619, -263.600342, -0.588192225, -6.5145052e-08, -0.808721185, 4.4101709e-09, 1, -8.37607317e-08, 0.808721185, -5.28340109e-08, -0.588192225)
    elseif chest == "Snow City Chest" then
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-591.912415, 72.749939, 2143.3291, -0.99671495, 7.0440322e-08, -0.080989778, 7.61660246e-08, 1, -6.76071892e-08, 0.080989778, -7.3553764e-08, -0.99671495)
    elseif chest == "Magma City Chest" then
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(2482.57764, 68.8001709, 3992.08301, -0.688194096, 3.17123816e-09, 0.725526631, 2.77723515e-08, 1, 2.19723582e-08, -0.725526631, 3.52708263e-08, -0.688194096)
    end
end

-- Function Spawn Teleports --
local function SelectLocation(location)
    if location == "Main City" then
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-555.846985, 3.80000067, 399.529388, 1, 0, 0, 0, 1, 0, 0, 0, 1)
    elseif location == "Desert" then
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(262.487244, 645.934387, -180.146057, 0.999046028, 0, 0.043669384, 0, 1, 0, -0.043669384, 0, 0.999046028)
    elseif location == "Space" then
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(247.883865, 73.0481033, -272.587677, 0.993579924, -8.65447536e-09, -0.113132581, -5.42947631e-10, 1, -8.12669327e-08, 0.113132581, 8.08066147e-08, 0.993579924)
    end
end



-- Function Auto Farm --
local selectedLocation = "None"
local function SetLocation(location)
    selectedLocation = location
    print("Selected location: " .. location)
end

local selectedOrb = "None"
local function SetOrb(orb)
    selectedOrb = orb
    print("Orb selected: " .. orb)
end

local collectionSpeed = "x150"
local speedMap = {
    ["x50"] = 50, 
    ["x75"] = 75, 	
    ["x100"] = 100,	
    ["x150"] = 150,
    ["x175"] = 175,
    ["x200"] = 200,	
    ["x250"] = 250,
    ["x275"] = 275,	
    ["x300"] = 300	
}
local function SetCollectionSpeed(speed)
    collectionSpeed = speed
    print("Selected collection speed: " .. speed)
end

local function CollectOrbs()
    if selectedLocation == "None" or selectedOrb == "None" then
        print("Select a location and an Orb before collecting.")
        return
    end

    local repetitions = speedMap[collectionSpeed] or 100 
    print("Collecting " .. selectedOrb .. " in " .. selectedLocation .. " with " .. repetitions .. " repetitions.")

    for i = 1, repetitions do
        game.ReplicatedStorage.rEvents.orbEvent:FireServer("collectOrb", selectedOrb, selectedLocation)
    end
end



-- Function Auto Hoops --
local isFarmingV1 = false
local isFarmingV2 = false

local function HoopFarmV1()
    local Chr = game.Players.LocalPlayer.Character
    if Chr and Chr.Parent and Chr:FindFirstChild("Head") then
        for i, v in next, game:GetService("Workspace").Hoops:GetDescendants() do
            if v.Name == "TouchInterest" and v.Parent then
                firetouchinterest(Chr:WaitForChild("Head", 5), v.Parent, 0)
                task.wait()
                firetouchinterest(Chr:WaitForChild("Head", 5), v.Parent, 1)
            end
        end
    end
end

local function HoopFarmV2()
    local Chr = game.Players.LocalPlayer.Character
    if Chr and Chr.Parent and Chr:FindFirstChild("HumanoidRootPart") then
        local children = workspace.Hoops:GetChildren()
        for i, child in ipairs(children) do
            if child.Name == "Hoop" then
                child.CFrame = Chr.HumanoidRootPart.CFrame
            end    
        end
    end
end

local function StartFarmingV1()
    while isFarmingV1 do
        HoopFarmV1()
        wait() 
    end
end

local function StartFarmingV2()
    while isFarmingV2 do
        HoopFarmV2()
        wait()  
    end
end



-- Function No Ping --
local function StabilizePing()
    while noPingEnabled do

        pingCheckEvent:FireServer("pingCheck")
        wait()  
    end
end



-- Function Auto Rebirth Stopping Point --
local targetRebirth = 99999  
local currentRebirths = 0  

local function Rebirth()
    task.wait(0.7)
    local ohString1 = "rebirthRequest"
    game:GetService("ReplicatedStorage").rEvents.rebirthEvent:FireServer(ohString1)
end

local function getCurrentRebirths()

    return game.Players.LocalPlayer:WaitForChild("leaderstats"):WaitForChild("Rebirths").Value
end

local function autoRebirthStoppingPoint()
    while true do
    
        currentRebirths = getCurrentRebirths()

        if currentRebirths >= targetRebirth then
            print("Rebirth target reached: " .. currentRebirths)
            break  
        end
  
        Rebirth()

        task.wait(0.7) 
    end
end

local function autoRebirth()
    while true do
   
        Rebirth()
 
        task.wait(0.7)  
    end
end



-- Function Auto Race V1 --
local function teleportToMaps()
    while _G.Farm do
        pcall(function()
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(48.311, 36.315, -8680.453) 
            wait(0.3)
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(1686.075, 36.315, -5946.634) 
            wait(0.3)
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(1001.331, 36.315, -10986.218) 
            wait(0.3)
        end)
    end
end

local function teleportToSpace()
    while _G.Farm do
        pcall(function()
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-4970.01709, 36.0000916, -4805.07861)
            wait(0.3)
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-4945.31689, 36.0000916, -4805.07861) 
            wait(0.3)
        end)
    end
end

local function teleportToDesert()
    while _G.Farm do
        pcall(function()
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(636.770996, 161.306763, 9718.75)
            wait(0.3)
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(2061.12476, 219.799164, 17953.8984) 
            wait(0.3)
        end)
    end
end

local function stopAutoFarm()
    _G.Farm = false
end

local function toggleAutoRaces(state)
    _G.Farm = state
    if state then
        spawn(function()
            while _G.Farm do
                pcall(function()
             
                    game:GetService("ReplicatedStorage").rEvents.raceEvent:FireServer("joinRace")
                    wait()
                
                    local part = game.Players.LocalPlayer.Character.HumanoidRootPart
                    for _, v in pairs(game:GetService("Workspace").raceMaps:GetDescendants()) do
                        if v.Name == "Decal" and v.Parent then
                            firetouchinterest(part, v.Parent, 0)
                            wait()
                            firetouchinterest(part, v.Parent, 1)
                        end
                    end
                end)
                wait()
            end
        end)
        
        if _G.SelectedTeleport == "Space" then
            teleportToSpace()
        elseif _G.SelectedTeleport == "Main City" then
            teleportToMaps() 
        elseif _G.SelectedTeleport == "Desert" then
            teleportToDesert() 
        end
    else
        stopAutoFarm()
    end
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



--// VyrosxC Hub \\--
local DrRayLibrary = loadstring(game:HttpGet("https://raw.githubusercontent.com/VyrosxC-Hub/NewTest/main/los2.lua"))()

local window = DrRayLibrary:Load("VyrosxC Hub", "Default")
-- Tab1
local tab1 = DrRayLibrary.newTab("Main", "rbxassetid://100789040568622")

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

tab1.newButton("Anti Kick", "Button", function()
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



-- Tab2
local tab2 = DrRayLibrary.newTab("Teleports", "rbxassetid://103168823763561")

-- Section 
tab2.newLabel("City Teleports")

tab2.newDropdown("Select City", "Teleports", {"Main City", "Snow City", "Magma City", "Legends Highway"}, function(selectedCity)
    -- Call the SelectCity function with the selected city
    SelectCity(selectedCity)
    print("Selected City: " .. selectedCity)
end)



-- Section
tab2.newLabel("Map Teleports")

tab2.newDropdown("Select Map", "Teleports", {"Desert", "Space"}, function(selectedMap)
  
    SelectMap(selectedMap)
    print("Selected Map: " .. selectedMap)
end)



-- Section 
tab2.newLabel("Chest Teleports")

tab2.newDropdown("Select Chest", "Teleports", {"Main City Chest", "Snow City Chest", "Magma City Chest"}, function(selectedChest)
 
    SelectChest(selectedChest)
    print("Selected Chest: " .. selectedChest)
end)



-- Section
tab2.newLabel("Spawn Teleports")

tab2.newDropdown("Select Spawn Location", "Teleports", {"Main City", "Desert", "Space"}, function(selectedLocation)
  
    SelectLocation(selectedLocation)
    print("Selected Spawn Location: " .. selectedLocation)
end)



-- Tab3
local tab3 = DrRayLibrary.newTab("Auto Farm", "rbxassetid://78744214847458")

-- Section 
tab3.newLabel("Auto Farm")

tab3.newDropdown("Select City", "City", {"None", "City", "Magma City"}, function(selectedLocation)
    SetLocation(selectedLocation)
    print("Selected Location: " .. selectedLocation)
end)

tab3.newDropdown("Select Orb", "Orb", {"None", "Red Orb", "Yellow Orb"}, function(selectedOrb)
    SetOrb(selectedOrb)
    print("Selected Orb: " .. selectedOrb)
end)

tab3.newDropdown("Select Speed", "Speed", {"None", "x50", "x75", "x100", "x150", "x175", "x200", "x250", "x275", "x300"}, function(selectedSpeed)
    SetCollectionSpeed(selectedSpeed)
    print("Selected Collection Speed: " .. selectedSpeed)
end)

tab3.newToggle("Auto Farm", "Toggle", false, function(toggleState) 
    isCollecting = toggleState
    print("Auto Farm Status: " .. (isCollecting and "Enabled" or "Disabled"))

    while isCollecting do
        CollectOrbs()
        wait() 
    end
end)

tab3.newToggle("No Ping", "Toggle", false, function(toggleState)
    noPingEnabled = toggleState
    if noPingEnabled then
        print("No Ping Enabled!")
        StabilizePing()
    else
        print("Bo Ping Disabled!")
    end
end)



-- Section
tab3.newLabel("Hoops Farm")

tab3.newToggle("Hoops V1", "Toggle", false, function(toggleState)
    isFarmingV1 = toggleState
    if isFarmingV1 then
        print("Hoops Farm V1 Enabled!")
        StartFarmingV1()  
    else
        print("Hoops Farm V1 Disabled!")
    end
end)

tab3.newToggle("Hoops V2", "Toggle", false, function(toggleState)
    isFarmingV2 = toggleState
    if isFarmingV2 then
        print("Hoops Farm V2 Enabled!")
        StartFarmingV2() 
    else
        print("Hoops Farm V2 Disabled!")
    end
end)



-- Tab4
local tab4 = DrRayLibrary.newTab("Auto Rebirth", "rbxassetid://124658295933505")

-- Section 
tab4.newLabel("Rebirth Stopping Point")

tab4.newInput("Rebirth", "Enter Desired Rebirth", function(value)
    local newTarget = tonumber(value)
    if newTarget then
        targetRebirth = newTarget
        print("Target rebirth set to: " .. targetRebirth)
    else
        print("Invalid input! Please enter a valid number.")
    end
end)

-- Toggle para Rebirth Stopping Point
tab4.newToggle("Auto Rebirth Stopping Point", "Toggle", false, function(toggleState) 
    if toggleState then
        print("Auto Rebirth (Stopping Point) Enabled!")
        autoRebirthStoppingPoint()
    else
        print("Auto Rebirth (Stopping Point) Disabled!")
    end
end)



-- Section 
tab4.newLabel("Auto Rebirth")

tab4.newToggle("Auto Rebirth", "Toggle", false, function(toggleState) 
    if toggleState then
        print("Auto Rebirth Enabled!")
        autoRebirth()
    else
        print("Auto Rebirth Disabled!")
    end
end)



-- Tab6
local tab5 = DrRayLibrary.newTab("Auto Race", "rbxassetid://97860628277392")

-- Section 
tab5.newLabel("Auto Race")

tab5.newDropdown("Select Map", "Select one of these options!", {"None", "Main City", "Space", "Desert"}, function(selectedOption) 
    _G.SelectedTeleport = selectedOption
    print("Selected Teleport: " .. selectedOption)
end)

tab5.newToggle("Auto Race V1", "Toggle", false, function(toggleState)
    toggleAutoRaces(toggleState)
end)

tab5.newToggle("Auto Race V2", "Best Auto Race 💀", false, function(Value)
    ToggleAutoRace(Value) 
    if AutoRaceToggle then
        print("Auto Race V2 Enabled!")
    else
        print("Auto Race V2 Disabled!")
    end
end)



-- Section 
tab5.newLabel("Extremely Fast Races")

tab5.newToggle("Auto Fill Race", "Toggle", false, function(value)
    autoFillRaceActive = value
    
    if autoFillRaceActive then
        spawn(function()
            while autoFillRaceActive do
                game:GetService("ReplicatedStorage").rEvents.raceEvent:FireServer("joinRace", true)
                wait()
            end
        end)
    end
end)

local window = DrRayLibrary:Load("VyrosxC Hub 2", "Default")
