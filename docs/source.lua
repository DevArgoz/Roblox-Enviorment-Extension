getgenv().char = function()
	return game.Players.LocalPlayer.Character
end
getgenv().playergui = function()
	return game.Players.LocalPlayer.PlayerGui
end 
getgenv().playerscripts = function()
	return game.Players.LocalPlayer.PlayerScripts
end
getgenv().leaderstats = function()
	return game.Players.LocalPlayer.leaderstats
end
getgenv().tp = function(cfr)
	game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = cfr
end
getgenv().create = function(class,props)
	local inst = Instance.new(class)
	for i,v in pairs(props) do 
		pcall(function()
			inst[i] = v
		end)
	end
	return inst
end
getgenv().sethealth = function(val)
	game.Players.LocalPlayer.Character.Humanoid.MaxHealth = val
	game.Players.LocalPlayer.Character.Humanoid.Health = val
end
getgenv().setwalkspeed = function(val)
	game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = val
end
getgenv().setjumppower = function(val)
	game.Players.LocalPlayer.Character.Humanoid.JumpPower = val
end
getgenv().setgravity = function(val)
	workspace.Gravity = val
end
getgenv().script_db = {
	SPR = {
		Kill_All = function() loadstring(game:HttpGetAsync("https://raw.githubusercontent.com/DevArgoz/Roblox-Enviorment-Extension/master/docs/SPR/Kill_All.lua",true))() end,
		Taze_All = function() loadstring(game:HttpGetAsync("https://raw.githubusercontent.com/DevArgoz/Roblox-Environment-Extension/master/docs/SPR/SPR%20Taze%20all.lua",true))() end,
		OP_Weapons = function() loadstring(game:HttpGetAsync("https://raw.githubusercontent.com/DevArgoz/Roblox-Environment-Extension/master/docs/SPR/OP_Weapons.lua",true))() end,
		Bring_All = function() loadstring(game:HttpGetAsync("https://raw.githubusercontent.com/DevArgoz/Roblox-Environment-Extension/master/docs/SPR/Bring%20all%20players.lua",true))() end
	},
	RobloxHQ = {
		GetKicked = function() create("ScreenGui",{Parent=playergui;}) end
	}
}
