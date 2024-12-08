--[[
	WARNING: Heads up! This script has not been verified by ScriptBlox. Use at your own risk!
]]
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
local Fluent = loadstring(game:HttpGet("https://raw.githubusercontent.com/CkVyros/NewTest/refs/heads/main/teste2.lua"))()

local Window = Fluent:CreateWindow({
    Title = "Fluent " .. Fluent.Version,
    SubTitle = "by dawid",
    TabWidth = 160,
    Size = UDim2.fromOffset(580, 460),
    Acrylic = true, -- The blur may be detectable, setting this to false disables blur entirely
    Theme = "Dark",
    MinimizeKey = Enum.KeyCode.E -- Used when theres no MinimizeKeybind
})
