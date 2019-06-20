# Roblox-Enviorment-Extension

Functions (No arguments)
 - char(); return the players character
 - playergui(); returns the local gui
 - playerscripts(); returns the local scripts
 - leaderstats(); returns the leaderstats
 
Functions (With arguments)
 - tp(CFrame); teleports the HumanoidRootPart to the given CFrame
 - create(class,properties); creates an instance with given properties as table
 - sethealth(val); sets the players health
 - setwalkspeed(val); sets the players walkspeed
 - setjumppower(val); sets the players jumppower
 - setgravity(val); sets the local gravity

Tables:
 - script_db = { 
     SPR = { [https://www.roblox.com/games/3140868024/Stateview-Prison-Roleplay]
        Kill_All(); [Requires the glock 17 to be in your backpack]
        Taze_All(); [Requires the taser to be in your backpack]
        OP_Weapons(); [Affects Glcok 17, M4A1, Baton and Taser]
        Bring_All(); [Requires the handcuffs to be in your backpack]
     },
     RobloxHQ = { [https://www.roblox.com/games/716960179/ROBLOX-HQ-w-Destruction-Tools-Admin]
        GetKicked(); [Kicks you, dunno why I added this]
     }
 }
