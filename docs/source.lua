_G.REE = {}
_G.REE.SaveLog = false
_G.REE.LogSaveBuffer = {}
local function iwarn(s)
	s = string.gsub(s, "[R-E-E]: ", "")
	warn("[R-E-E]: "..tostring(s))
local function iprint(s)
	s = string.gsub(s, "[R-E-E]: ", "")
	print("[R-E-E]: "..tostring(s))
hookfunction(getgenv().error,function(msg,trace)
    local trace = trace or 0
    warn("[R-E-E] [ERROR] [TRACE " .. trace .. "]: " .. msg)
end)
hookfunction(getrenv().error,function(msg,trace)
    local trace = trace or 0
    warn("[R-E-E] [ERROR] [TRACE " .. trace .. "]: " .. msg)
end)
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
getgenv().create = function(class, props)
	local inst = Instance.new(class)
	for i, v in pairs(props) do
		pcall(
			function()
				inst[i] = v
			end
		)
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
getgenv().join_place = function(placeId)
	game:GetService("TeleportService"):Teleport(placeId, game.Players.LocalPlayer)
end
getgenv().setupvalue = function(_script, upvalue, val)
	for i, v in pairs(debug.getregistry()) do
		if type(v) == "function" and getfenv(v).script == _script then
			if debug.getupvalue(v, upvalue) then
				debug.setupvalue(v, upvalue, val)
				return true
			end
		end
	end
	return false
end
getgenv().getupvalue = function(_script, upvalue)
	for i, v in pairs(debug.getregistry()) do
		if type(v) == "function" and getfenv(v).script == _script then
			if debug.getupvalue(v, upvalue) ~= nil then
				return debug.getupvalue(v, upvalue)
			end
		end
	end
	return nil
end
getgenv().instanceByPath = function(path)
	local x = {}
	local last = ""
	for i=1,#path do
		local y = string.sub(path,i,i)
		if y == "." then
			table.insert(x,#x+1,last)
			last = ""
		else
			last = last .. y
		end
	end
	table.insert(x,#x+1,last)
	for i=1,#x do 
		if x[i] == "LocalPlayer" then 
			x[i] = game.Players.LocalPlayer.Name
		end
	end
	for i,v in pairs(game:GetDescendants()) do 
		if v.Name == x[#x] then 
			if v:GetFullName() == table.concat(x,".") then 
				return v
			end
		end
	end
	return nil
end
getgenv().splitString = function(text,ind)
	local args = {}
	local last = ""
	for i=1,#text do
		local x = string.sub(text,i,i)
		if x == ind  then
			table.insert(args,#args+1,last)
			last = ""
		else
			last = last .. x
		end
	end
	table.insert(args,#args+1,last)
	return args
end
getgenv().script_db = {
	SPR = {
		Kill_All = function()
			loadstring(
				game:HttpGetAsync(
					"https://raw.githubusercontent.com/DevArgoz/Roblox-Enviorment-Extension/master/docs/SPR/Kill_All.lua",
					true
				)
			)()
		end,
		Taze_All = function()
			loadstring(
				game:HttpGetAsync(
					"https://raw.githubusercontent.com/DevArgoz/Roblox-Environment-Extension/master/docs/SPR/SPR%20Taze%20all.lua",
					true
				)
			)()
		end,
		OP_Weapons = function()
			loadstring(
				game:HttpGetAsync(
					"https://raw.githubusercontent.com/DevArgoz/Roblox-Environment-Extension/master/docs/SPR/OP_Weapons.lua",
					true
				)
			)()
		end,
		Bring_All = function()
			loadstring(
				game:HttpGetAsync(
					"https://raw.githubusercontent.com/DevArgoz/Roblox-Environment-Extension/master/docs/SPR/Bring%20all%20players",
					true
				)
			)()
		end
	},
	RobloxHQ = {
		TriggerAntiExploit = function()
			create("ScreenGui", {Parent = playergui()})
			create("Part", {Parent = workspace})
		end
	},
	GhostSim = {
		AutoFarm = function()
			loadstring(
				game:HttpGetAsync(
					"https://raw.githubusercontent.com/DevArgoz/Roblox-Environment-Extension/master/docs/GhostSim/Autofarm.lua",
					true
				)
			)()
		end
	}
}
setreadonly(string,false)
string.getLocation = function(obj,str)
    local indBegin = -1
    local indEnd = -1
    for i=1,#obj do
        if string.sub(obj,i,i) == string.sub(str,1,1) then
            local miss = false
            for ind=1,#str do
                if not string.sub(obj,i+ind,i+ind) == string.sub(str,ind,ind) then
                    miss = true
                end
            end
            if not miss then
                indBegin = i
                indEnd = i+#str
            end
        end
    end
    return indBegin,indEnd
end
string.getLocations = function(obj,str)
    local founds = {}
    for i=1,#obj do
        if string.sub(obj,i,i) == string.sub(str,1,1) then
            local miss = false
            for ind=1,#str do
                if not string.sub(obj,i+ind,i+ind) == string.sub(str,ind,ind) then
                    miss = true
                end
            end
            if not miss then
                table.insert(founds,{["begin"]=i,["end"]=i+#str-1})
            end
        end
    end
    return founds
end

string.split = function(obj,ind)
    local args,last = {},""
    for i=1,#obj do
        if string.sub(obj,i,i) == ind then
            table.insert(args,last);last=""
        else
            last = last .. string.sub(obj,i,i)
        end
    end
    table.insert(args,last);
    return args
end
string.random = function(length,specialChars)
    local chars = "abcedfghijklmnopqrstuvwxyz1234567890"
    local schars = chars .. "();:-.#+^/*+"
    local str = ""
    for i=1,length do
        local r = math.random(1,#chars)
        if specialChars then
            r = math.random(1,#schars)
        end
        str = str .. string.sub(schars,r,r)
    end
    return str
end
getgenv().antikick = function(val)
    settings_antikick = val
    if val then
        local MT = getrawmetatable(game)
        local OldNameCall = MT.__namecall
        setreadonly(MT,false)
        MT.__namecall = newcclosure(function(self,...)
            local m = ({...})[select('#', ...)]
            local args = {...}
            if m == "Kick" and settings_antikick == true then
                iwarn("KICK ATTEMPT:")
                iwarn("Object: " .. self:GetFullName() or tostring(self))
                iwarn("Reason: " .. args[1] or "")
                iwarn("Time: " .. os.date("*t").hour .. "/" .. os.date("*t").min .. "/" .. os.date("*t").sec)
                return true
            end
            return OldNameCall and OldNameCall(self, ...) or self[m](self, unpack({...}))
        end)
        setreadonly(MT,true)
    end
end
getgenv().consolelog = function(toggle)
	_G.REE.SaveLog = not _G.REE.SaveLog
	return true
end
game:GetService"LogService".MessageOut:Connect(function(msg,type)
	if not _G.REE.SaveLog then return false end
	local time = os.date(*t)
	local message = "["..time.hour..":"..time.min..":"..time.sec.."] ["..tostring(type).."]: "..tostring(msg)
	table.insert(_G.REE.LogSaveBuffer,#_G.REE.LogSaveBuffer+1,message)
	return true
end)
getgenv().saveconsolelog = function(fileName)
    local clog = _G.REE.LogSaveBuffer
    local current = ""
    for i=1,#clog do
        if current == "" then
            current = clog[i] .. "\n"
        else
            current = current .. clog[i] .. "\n"
        end
    end
    writefile(fileName,current)
    _G.REE.LogSaveBuffer = {}
    return true
end
		
getgenv().fetchTable(tab,...)
    local op = ""
    local args = {...}
    local nom = 0
    if args[2] then nom = args[2] end
    local space = nom * 4
    if args[1] then op = tostring(args[1]) .. ": " end
    for i,v in pairs(tab) do 
        if type(v) == "table" then 
            if #v == 0 then 
                iwarn(string.rep(" ",space) .. i .. ":")
            end
            fetchTable(v,i,nom + 1)
        else
            iwarn(string.rep(" ",space) .. i .. " => " .. tostring(v))
        end
    end
end

getgenv().splitString = function(inputstr, sep)
        if sep == nil then sep = "%s" end
        local t={}
        for str in string.gmatch(inputstr, "([^"..sep.."]+)") do table.insert(t, str) end
        return t
end
