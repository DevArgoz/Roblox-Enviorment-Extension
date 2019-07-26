# Roblox-Enviorment-Extension

Patch v1.3
 - Added antikick(status:**bool**)
 - Added string.getLocation(findfrom:**str**,find:**str**)
 - Added string.getLocations(findfrom:**str**,find:**str**)
 - Added string.split(findfrom:**str**,splitIndicator:**str**)
 - Added string.random(length:**int**,specialCharacters:**str**)

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
 - tp(location:**CFrame**); teleports the HumanoidRootPart to the given CFrame
 - create(class:**str**,properties:**table**); creates an instance with given properties
 - sethealth(val:**int**); sets the players health
 - setwalkspeed(val:**int**); sets the players walkspeed
 - setjumppower(val:**int**); sets the players jumppower
 - setgravity(val:**int**); sets the local gravity
 - setupvalue(**script**,upvalue:**str**,value); changes a LOCAL value of the given script
 - getupvalue(**script**,upvalue:**str**); returns a LOCAL value of the given script
 - join_place(placeId:**int**); teleports the local player to the given place

[Documentation for script_db is coming soon!]
