local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/VyrosDev/Vyros-Hub-UI/refs/heads/main/VyrosHubUI.lua')))()
local Window = OrionLib:MakeWindow({Name = "Title of the library", HidePremium = false, SaveConfig = true, ConfigFolder = "OrionTest"})

local Tab = Window:MakeTab({
	Name = "Tab 11",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})

local Section = Tab:AddSection({
	Name = "Section"
})

Tab:AddButton({
	Name = "Click here!",
	Callback = function()
      		print("button pressed")
  	end    
})



OrionLib:Destroy()
