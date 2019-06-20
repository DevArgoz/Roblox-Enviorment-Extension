local active = false
local enemies = {}
local target = nil
local mouse = game.Players.LocalPlayer:GetMouse()
local US = game:GetService("UserInputService")
game.Players.LocalPlayer.Chatted:Connect(function(msg)
	if msg:sub(1,3) == "/e " then 
		if msg:sub(4,6) == "add" then 
			table.insert(enemies,#enemies+1,msg:sub(8,#msg))
		end
		if msg:sub(4,9) == "remove" then 
			local enemy = msg:sub(11,#msg)
			for i=1,#enemies do 
				if string.lower(enemies[i]) == string.lower(enemy) then 
					table.remove(enemies,i)
				end
			end
		end
	end
end)
local function GetBackpackMax()
	local tl = game.Players.LocalPlayer.PlayerGui.UI.MainGui.PackStatus.FillBar.Label.Text
	local raw = ""
	local count = false
	for i=1,#tl do 
		local x = string.sub(tl,i,i)
		if x == "/" then 
			count = true
		elseif x ~= " " and count then 
			raw = raw .. x
		end
	end
	local size = ""
	for i=1,#raw do 
		if string.sub(raw,i,i) ~= "," then  size = size .. string.sub(raw,i,i) end
	end
	return tonumber(size)
end
US.InputBegan:Connect(function(key,gpe)
	if gpe then return end
	if key.KeyCode == Enum.KeyCode.R then 
		active = not active
		target = nil
	end
end)
game:GetService("RunService").RenderStepped:Connect(function()
	if not active then return end
	local orgTarget = target
	if game.Players.LocalPlayer.PlayerGui.UI.MainGui.PackStatus.FillBar.Manager.InternalFill.Value >= GetBackpackMax() then 
		target = nil
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = workspace.ScriptParts.EctoplasmConverters.NormalWorldConverter.CFrame
		wait(.2)
		target = orgTarget
	end
	if target ~= nil then 
		game.Players.LocalPlayer.Character.Humanoid:ChangeState(11)
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = target.HumanoidRootPart.CFrame
	end
end)
local function IsValidTarget(name)
	for i=1,#enemies do 
		if string.lower(enemies[i]) == string.lower(name) then 
			return true
		end
	end
	return false
end
while wait() do 
	if active then 
		for i,v in pairs(workspace.Ghosts:GetChildren()) do 
			if IsValidTarget(v.Name) and active then 
				local begin = elapsedTime()
				target = v
				local VS = workspace.CurrentCamera.ViewportSize
				local MX,MY = VS.X/2,VS.Y/2
				local NX,NY = MX-mouse.X,MY-mouse.Y
				mousemoverel(NX,NY)
				wait(.5)
				mouse1click()
				repeat wait() until not v:FindFirstChild("Health") or target == nil or (elapsedTime()-begin) > 20 or not v:FindFirstChild("HumanoidRootPart") 
				target = nil
				wait(.1)
			end
		end
	end
end
