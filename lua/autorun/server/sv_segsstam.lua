AddCSLuaFile("autorun/sh_segsfrt.lua")
util.AddNetworkString( "Speeds" )
util.AddNetworkString( "IsTired" )
util.AddNetworkString( "MakeNotTired" )
local DefaultWalkSpeed
local DefaultRunSpeed
local ModWalkSpeed
local ModRunSpeed




function SetPlayerSpeed (ply, sprint, run )
	ply:SetRunSpeed(sprint)
	ply:SetWalkSpeed(run)

	
	
end

net.Receive("Speeds", function(num, ply)
	DefaultWalkSpeed = net.ReadInt(32) 
	DefaultRunSpeed = net.ReadInt(32)
	ModWalkSpeed = DefaultWalkSpeed/2
	ModRunSpeed = DefaultRunSpeed/2

end)


net.Receive("IsTired", function(num, ply)
	local isTired = net.ReadBool()
	
		if(isTired)
		then
			
			
			SetPlayerSpeed(ply, ModRunSpeed, ModWalkSpeed)
		end
		
end)

net.Receive("MakeNotTired", function(num, ply)
	local isTired = net.ReadBool()
	if(isTired == false)
	then
		
		SetPlayerSpeed(ply, DefaultRunSpeed,  DefaultWalkSpeed)
		
	end

end)









