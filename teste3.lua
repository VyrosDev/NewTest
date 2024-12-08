local VyrosLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/ImNotRox1/Backin-Library/refs/heads/main/source.lua')))()

local Window = VyrosLib:New({
	Title = "Vyros Hub"
})

local Tab = Window:MakeTab({
	Title = "Main",
	Icon = "rbxassetid://100789040568622",
})

Tab:AddButton({
	Title = "Button example",
	Callback = function()
      	print("button pressed")
  	end    
})

Tab:AddToggle({
	Name = "This is a toggle!",
	Callback = function(Value)
		print(Value)
	end    
})

VyrosLib:Destroy()
