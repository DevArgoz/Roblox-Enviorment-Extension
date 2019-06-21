-- Init REE (Roblox-Environment-Extension)
loadstring(game:HttpGet("https://raw.githubusercontent.com/DevArgoz/Roblox-Environment-Extension/master/docs/source.lua",true))()
-- Delete old GUI
if game.CoreGui:FindFirstChild("DevConsole") then game.CoreGui.DevConsole:Destroy() end
if _G.DevConsoleScript then _G.DevConsoleScript:Destroy() end
_G.DevConsoleScript = script

local services = {}
local meta = {
	__index = function(self,v)
		return game:GetService(v)
	end
}
debug.setmetatable(services,meta)

local cmds = {}
local shortPaths = {}
local focused = false
local debounce = false

local gui = create("ScreenGui",{Parent=game.CoreGui;Name="DevConsole";})
local mainFrame = create("Frame",{Parent=gui;Size=UDim2.new(1,0,.3,0);BackgroundColor3=Color3.fromRGB(40,40,40);ZIndex=9e9;ClipsDescendants=true})
local logBox = create("Frame",{Parent=mainFrame;Size=UDim2.new(1,0,.95,0);BackgroundColor3=Color3.fromRGB(50,50,50);ClipsDescendants=true})
local inputBox = create("TextBox",{Parent=mainFrame;Size=UDim2.new(1,0,.05,0);Position=UDim2.new(0,0,.95,0);TextXAlignment=Enum.TextXAlignment.Left;TextSize=12;BackgroundTransparency=1;TextColor3=Color3.fromRGB(255,255,255);Text="";ClearTextOnFocus=false;})

-- Extra GUI Instances
local UIList = create("UIListLayout",{Parent=logBox;Padding=UDim.new(0,3);SortOrder=Enum.SortOrder.LayoutOrder;VerticalAlignment=Enum.VerticalAlignment.Bottom;})

local function SendLog(text,color)
	local num = (#logBox:GetChildren() - 1) + 1
	local tl = create("TextLabel",{Parent=logBox;Text=text;TextColor3=color;TextScaled=true;Font=Enum.Font.Gotham;Name=num;TextXAlignment=Enum.TextXAlignment.Left;Size=UDim2.new(1,0,0,17);BackgroundTransparency=1})
end

local function UpdateLastLog(text,color)
	local obj = logBox:FindFirstChild(tostring((#logBox:GetChildren() - 1)))
	obj.Text = text
	obj.TextColor3 = color
end

function cmds.getupval(path,upval)
	debounce = true
	if string.lower(path:sub(1,5)) == "game." then path = path:sub(6,#path) end
	if shortPaths[path] then
		path = shortPaths[path]
	end
	local upvalue = getupvalue(instanceByPath(path),upval) or "NO VALUE FOUND!"
	SendLog("[" .. path .. "] local " .. upval .. " equals to " .. tostring(upvalue),Color3.fromRGB(255,255,0))
	debounce = false
end

function cmds.setupval(path,upval,val)
	debounce = true
	if string.lower(path:sub(1,5)) == "game." then path = path:sub(6,#path) end
	if shortPaths[path] then
		path = shortPaths[path]
	end
	setupvalue(instanceByPath(path),upval,val)
	SendLog("[" .. path .. "] Changed local " .. upval .. " to " .. val,Color3.fromRGB(255,255,0))
	debounce = false
end

function cmds.copy_reg(...)
	if not syn then SendLog("This command is Synapse X only.",Color3.fromRGB(200,0,0)) return end
	debounce = true
	local reg = debug.getregistry()
	local str = ""
	SendLog("Copieing " .. #reg .. " objects...",Color3.fromRGB(255,255,0))
	wait(.2)
	for i,v in pairs(reg) do 
		str = str .. tostring(i) .. " => " .. tostring(v) .. "\n"
	end
	syn.write_clipboard(str)
	SendLog("Copied registry to clipboard.",Color3.fromRGB(0,180,0))
	debounce = false
end

function cmds.cls(...)
	debounce = true
	for i,v in pairs(UIList.Parent:GetChildren()) do 
		if not v:IsA("UIListLayout") then 
			v:Destroy()
		end
	end
	debounce = false
end

function cmds.cmds()
	debounce = true
	SendLog("Commands:",Color3.fromRGB(255,255,255))
	SendLog(" cls - Clears the console",Color3.fromRGB(255,255,255))
	SendLog(" getupval <PATH> <UPVALUE> - Returns the given upvalue of the given script",Color3.fromRGB(255,255,255))
	SendLog(" setupval <PATH> <UPVALUE> <VALUE> - Sets the given upvalue of the given script",Color3.fromRGB(255,255,255))
	SendLog(" copy_reg - Copies the roblox registry to your clipboard",Color3.fromRGB(255,255,255))
	SendLog(" exec <Code/Source> - Executes the given code/source.",Color3.fromRGB(255,255,255))
	SendLog(" path <new/del> <Name> <Path> - Saves/Deletes a path.",Color3.fromRGB(255,255,255))
	SendLog(" copy_path <Path> - Copies a path saved with 'path'.",Color3.fromRGB(255,255,255))
	debounce = false
end

function cmds.exec(...)
	debounce = true
	local code = {...}
	local suc,err = pcall(function() loadstring(table.concat(code))() end)
	if suc then
		SendLog("Executed code.",Color3.fromRGB(0,180,0))
	else
		SendLog("Failed to execute code! Error: " .. err, Color3.fromRGB(200,0,0))
	end
	debounce = false
end

function cmds.path(mode,name,path)
	debounce = true
	if mode == "new" then
		if not shortPaths[name] then
			shortPaths[name] = path
			SendLog("Saved path " .. path .. " under " .. name .. ".",Color3.fromRGB(0,180,0))
		else
			SendLog("Path already exists.",Color3.fromRGB(255,255,0))
		end
	elseif mode == "del" then
		if shortPaths[name] then
			shortPaths[name] = nil
			SendLog("Removed path " .. path .. ".",Color3.fromRGB(0,180,0))
		else
			SendLog("Path does not exist.",Color3.fromRGB(255,255,0))
		end
	end
	debounce = false
end

function cmds.copy_path(name)
	debounce = true
	if shortPaths[name] then
		syn.write_clipboard(shortPaths[name])
		SendLog("Copied path for " .. name .. ".",Color3.fromRGB(0,180,0))
	else
		SendLog("Path does not exist.",Color3.fromRGB(255,255,0))
	end
	debounce = false
end

local function HandleCommand()
	local cmd = inputBox.Text
	local args = splitString(cmd," ")
	local invoke = args[1]
	local nargs = {}
	if #args > 1 then for i=2,#args do table.insert(nargs,#nargs+1,args[i]) end end
	inputBox.Text = ""
	if cmds[invoke] then 
		if not debounce then 
			SendLog("> " .. cmd,Color3.fromRGB(255,255,255))
			cmds[invoke](unpack(nargs))
		end
	else
		SendLog("Invalid invoke! Use cmds to view all the commands.",Color3.fromRGB(200,0,0))
	end
end

services.UserInputService.InputEnded:Connect(function(key,gpe)
	if gpe then return end
	if key.KeyCode == Enum.KeyCode.P then
		gui.Enabled = not gui.Enabled
	end
	if key.KeyCode == Enum.KeyCode.Semicolon then 
		if not gui.Enabled then return end
		inputBox:CaptureFocus()
	end
	if key.KeyCode == Enum.KeyCode.Return and focused then 
		if not gui.Enabled then return end
		HandleCommand()
	end
end)

SendLog("Dev Console v1 by Argoz. Please keep in mind that this is in early alpha.",Color3.fromRGB(255,255,255))
SendLog("Use cmds to view all the commands.",Color3.fromRGB(255,255,255))

while wait(.1) do 
	focused = inputBox:IsFocused()
end
