--// Variables \\--

getgenv().HoopFarm = false

getgenv().OpenEgg = false -- Fixo

getgenv().eggOpen = false -- Temporário

local RunService = game:GetService("RunService")
local Players = game:GetService("Players")
local Player = Players.LocalPlayer
local Chr = Player.Character

Player.CharacterAdded:Connect(function()
    Chr = Player.Character
end)

local ChrHead = Chr.Head
local Humanoid = Chr.Humanoid
local Root = Chr.HumanoidRootPart

--// Tables \\--

local Crystals = {}

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


repeat task.wait(0.25) until game:IsLoaded();
getgenv().Image = "rbxassetid://82291816564081"; -- put a asset id in here to make it work
getgenv().ToggleUI = "E" -- This where you can Toggle the Fluent ui library

task.spawn(function()
    if not getgenv().LoadedMobileUI == true then 
        getgenv().LoadedMobileUI = true
        local OpenUI = Instance.new("ScreenGui");
        local ImageButton = Instance.new("ImageButton");
        local UICorner = Instance.new("UICorner");

        OpenUI.Name = "OpenUI";
        OpenUI.Parent = game:GetService("CoreGui");
        OpenUI.ZIndexBehavior = Enum.ZIndexBehavior.Sibling;

        ImageButton.Parent = OpenUI;
        ImageButton.BackgroundColor3 = Color3.fromRGB(105,105,105);
        ImageButton.BackgroundTransparency = 0.8;
        ImageButton.Position = UDim2.new(0.9,0,0.1,0);
        ImageButton.Size = UDim2.new(0,50,0,50);
        ImageButton.Image = getgenv().Image;
        ImageButton.Draggable = true;

        -- Adiciona bordas arredondadas sutis
        UICorner.CornerRadius = UDim.new(0, 9);
        UICorner.Parent = ImageButton;

        -- Ajuste na função do clique para alternar a UI
        ImageButton.MouseButton1Click:Connect(function()
            local CoreGui = game:GetService("CoreGui")
            local UI = CoreGui:FindFirstChild("YourScriptUI") -- Nome do UI que você quer alternar

            if UI then
                UI.Enabled = not UI.Enabled -- Alterna a visibilidade da UI
            else
                warn("UI não encontrada!")
            end
        end)
    end
end)
local Fluent = loadstring(game:HttpGet("https://raw.githubusercontent.com/CkVyros/NewTest/refs/heads/Home/teste2.lua"))()

local Window = Fluent:CreateWindow({
    Title = "Vyros Hub | " .. Fluent.Version,
    SubTitle = "Legends Of Speed",
    TabWidth = 160,
    Size = UDim2.fromOffset(580, 460),
    Acrylic = true, -- The blur may be detectable, setting this to false disables blur entirely
    Theme = "Dark",
    MinimizeKey = Enum.KeyCode.E -- Used when theres no MinimizeKeybind
})

local Tabs = {
    Home = Window:AddTab({ Title = "Home", Icon = "home" }),
    Teleports = Window:AddTab({ Title = "Teleports", Icon = "arrow-left-right" }),	
    AutoFarm = Window:AddTab({ Title = "Auto Farm", Icon = "skull" }),	
    Settings = Window:AddTab({ Title = "Credits", Icon = "users" })
}

local Options = Fluent.Options

do
    Fluent:Notify({
        Title = "Vyros Hub",
        Content = "Welcome and enjoy!",
        SubContent = "Nothing Here", -- Optional
        Duration = 10 -- Set to nil to make the notification not disappear
    })



    Tabs.Home:AddParagraph({
        Title = "Paragraph",
        Content = "This is a paragraph.\nSecond line!"
    })



    Tabs.Home:AddButton({
    Title = "Expand Torso",
    Description = "Expands the torso size",
    Callback = function()
        ExpandTorso() -- Chama a função de expansão do torso
        print("Torso expandido com sucesso!")
    end
})

    Tabs.Home:AddButton({
    Title = "Reset Character",
    Description = "Resets the character to its original state",
    Callback = function()
        ResetCharacter() -- Chama a função de reset do personagem
        print("Personagem resetado!")
    end
})



    local Toggle = Tabs.Home:AddToggle("MyToggle", {Title = "Toggle", Default = false })

    Toggle:OnChanged(function()
        print("Toggle changed:", Options.MyToggle.Value)
    end)

    Options.MyToggle:SetValue(false)


    
    local Slider = Tabs.Home:AddSlider("Slider", {
        Title = "Slider",
        Description = "This is a slider",
        Default = 2,
        Min = 0,
        Max = 5,
        Rounding = 1,
        Callback = function(Value)
            print("Slider was changed:", Value)
        end
    })

    Slider:OnChanged(function(Value)
        print("Slider changed:", Value)
    end)

    Slider:SetValue(3)



    local Dropdown = Tabs.Home:AddDropdown("Dropdown", {
        Title = "Dropdown",
        Values = {"one", "two", "three", "four", "five", "six", "seven", "eight", "nine", "ten", "eleven", "twelve", "thirteen", "fourteen"},
        Multi = false,
        Default = 1,
    })

    Dropdown:SetValue("four")

    Dropdown:OnChanged(function(Value)
        print("Dropdown changed:", Value)
    end)


    
    local MultiDropdown = Tabs.Home:AddDropdown("MultiDropdown", {
        Title = "Dropdown",
        Description = "You can select multiple values.",
        Values = {"one", "two", "three", "four", "five", "six", "seven", "eight", "nine", "ten", "eleven", "twelve", "thirteen", "fourteen"},
        Multi = true,
        Default = {"seven", "twelve"},
    })

    MultiDropdown:SetValue({
        three = true,
        five = true,
        seven = false
    })

    MultiDropdown:OnChanged(function(Value)
        local Values = {}
        for Value, State in next, Value do
            table.insert(Values, Value)
        end
        print("Mutlidropdown changed:", table.concat(Values, ", "))
    end)



    local Colorpicker = Tabs.Home:AddColorpicker("Colorpicker", {
        Title = "Colorpicker",
        Default = Color3.fromRGB(96, 205, 255)
    })

    Colorpicker:OnChanged(function()
        print("Colorpicker changed:", Colorpicker.Value)
    end)
    
    Colorpicker:SetValueRGB(Color3.fromRGB(0, 255, 140))



    local TColorpicker = Tabs.Home:AddColorpicker("TransparencyColorpicker", {
        Title = "Colorpicker",
        Description = "but you can change the transparency.",
        Transparency = 0,
        Default = Color3.fromRGB(96, 205, 255)
    })

    TColorpicker:OnChanged(function()
        print(
            "TColorpicker changed:", TColorpicker.Value,
            "Transparency:", TColorpicker.Transparency
        )
    end)



    local Keybind = Tabs.Home:AddKeybind("Keybind", {
        Title = "KeyBind",
        Mode = "Toggle", -- Always, Toggle, Hold
        Default = "LeftControl", -- String as the name of the keybind (MB1, MB2 for mouse buttons)

        -- Occurs when the keybind is clicked, Value is `true`/`false`
        Callback = function(Value)
            print("Keybind clicked!", Value)
        end,

        -- Occurs when the keybind itself is changed, `New` is a KeyCode Enum OR a UserInputType Enum
        ChangedCallback = function(New)
            print("Keybind changed!", New)
        end
    })

    -- OnClick is only fired when you press the keybind and the mode is Toggle
    -- Otherwise, you will have to use Keybind:GetState()
    Keybind:OnClick(function()
        print("Keybind clicked:", Keybind:GetState())
    end)

    Keybind:OnChanged(function()
        print("Keybind changed:", Keybind.Value)
    end)

    task.spawn(function()
        while true do
            wait(1)

            -- example for checking if a keybind is being pressed
            local state = Keybind:GetState()
            if state then
                print("Keybind is being held down")
            end

            if Fluent.Unloaded then break end
        end
    end)

    Keybind:SetValue("MB2", "Toggle") -- Sets keybind to MB2, mode to Hold


    local Input = Tabs.Home:AddInput("Input", {
        Title = "Input",
        Default = "Default",
        Placeholder = "Placeholder",
        Numeric = false, -- Only allows numbers
        Finished = false, -- Only calls callback when you press enter
        Callback = function(Value)
            print("Input changed:", Value)
        end
    })

    Input:OnChanged(function()
        print("Input updated:", Input.Value)
    end)
end





SaveManager:SetLibrary(Fluent)
InterfaceManager:SetLibrary(Fluent)

SaveManager:IgnoreThemeSettings()

SaveManager:SetIgnoreIndexes({})

InterfaceManager:SetFolder("FluentScriptHub")
SaveManager:SetFolder("FluentScriptHub/specific-game")

InterfaceManager:BuildInterfaceSection(Tabs.Settings)
SaveManager:BuildConfigSection(Tabs.Settings)


Window:SelectTab(1)

Fluent:Notify({
    Title = "Welcome to Vyros Hub!",
    Content = "The script has been loaded.",
    Duration = 5
})

SaveManager:LoadAutoloadConfig()
