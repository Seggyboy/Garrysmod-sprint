AddCSLuaFile("autorun/sh_segsfrt.lua")
AddCSLuaFile("autorun/client/cl_segstam.lua")

local ply = LocalPlayer()
local lungs = Material("materials/Lungs.png")
hook.Add("HudPaint", "Tired",function()

    local scrw, scrh = ScrW(), ScrH()
    surface.SetMaterial( lungs )
    surface.DrawTexturedRect(0,0, scrw, scrh)
    
end)

