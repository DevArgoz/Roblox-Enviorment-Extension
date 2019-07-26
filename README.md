# Roblox-Enviorment-Extension

Patch v1.3
 - Added antikick(status); status: true/false
 - Added string.getLocation(object,string);
 - Added string.getLocations(object,string);
 - Added string.split(object,splitIndicator);
 - Added string.random(length,specialCharacters);

Patch v1.2
 - Added join_place
 - Added setupvalue
 - Added getupvalue

Patch v1.1
 - Added script_db (script database) only 2 games are supported at the moment, more game swill be coming soon.

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
 - setupvalue(script,upvalue,value); changes a LOCAL value of the given script
 - getupvalue(script,upvalue); returns a LOCAL value of the given script
 - join_place(placeId); teleports the local player to the given place

[Documentation for script_db is coming soon!]
