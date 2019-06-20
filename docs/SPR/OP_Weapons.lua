if game.Players.LocalPlayer.Backpack:FindFirstChild("Glock 17") then 
	local GlockSettings = require(game.Players.LocalPlayer.Backpack["Glock 17"].Setting)
	GlockSettings.Auto = false
	GlockSettings.BaseDamage = 1e9
	GlockSettings.AmmoPerMag = math.huge
	GlockSettings.FireRate = 0.02
	GlockSettings.Range = 9e9
	GlockSettings.Spread = 0
	GlockSettings.Ammo = math.huge
	GlockSettings.MaxAmmo = math.huge
	GlockSettings.Recoil = 0
end

if game.Players.LocalPlayer.Backpack:FindFirstChild("Taser") then 
	local TaserSettings = require(game.Players.LocalPlayer.Backpack["Taser"].Setting)
	TaserSettings.Auto = false
	TaserSettings.BaseDamage = 1e9
	TaserSettings.AmmoPerMag = math.huge
	TaserSettings.FireRate = 0.02
	TaserSettings.Range = 9e9
	TaserSettings.Spread = 0
	TaserSettings.Ammo = math.huge
	TaserSettings.MaxAmmo = math.huge
	TaserSettings.Recoil = 0
end

if game.Players.LocalPlayer.Backpack:FindFirstChild("Baton") then 
	local Baton = game.Players.LocalPlayer.Backpack["Baton"]
	Baton.Damage.Value = 100
	Baton.HeadDamage.Value = 200
	Baton.BackstabDamage.Value = 100
end

if game.Players.LocalPlayer.Backpack:FindFirstChild("M4A1") then 
	local M4A1Settings = require(game.Players.LocalPlayer.Backpack["M4A1"].Setting)
	M4A1Settings.Auto = true
	M4A1Settings.BaseDamage = 1e9
	M4A1Settings.AmmoPerMag = math.huge
	M4A1Settings.FireRate = 0.02
	M4A1Settings.Range = 9e9
	M4A1Settings.Spread = 0
	M4A1Settings.Ammo = math.huge
	M4A1Settings.MaxAmmo = math.huge
	M4A1Settings.Recoil = 0
end

