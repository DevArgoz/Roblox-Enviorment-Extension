local function ShootAt(player)
	local targetChar = player.Character
	local A_1 = targetChar.Humanoid
	local A_2 = targetChar.Head
	local A_3 = 100
	local A_4 = Vector3.new(-0.162023023, -0.0627541691, -0.984789491)
	local A_5 = 0
	local A_6 = 0
	local A_7 = false
	local Event = game.Players.LocalPlayer.Backpack["Taser"]["GunScript_Server"].InflictTarget
	Event:FireServer(A_1, A_2, A_3, A_4, A_5, A_6, A_7)
end

for i,v in pairs(game.Players:GetPlayers()) do 
	ShootAt(v)
end