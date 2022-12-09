AddCSLuaFile("autorun/sh_segsfrt.lua")

MaxStamina = 25
Stamina = MaxStamina
StaminaLoss = 1 -- stamina loss in seconds
Ply = LocalPlayer()
local hasPrinted = false
local speedUpdated = false
local DefaultWalkSpeed = Ply:GetWalkSpeed()
local DefaultRunSpeed = Ply:GetRunSpeed()
math.Clamp(Stamina, 0, MaxStamina)
wave = Material( "vgui/stupidbitch" )
local tired = false


hook.Add("Think", "Thinking", function()
    
    if(speedUpdated == false)
    then
        
        net.Start("Speeds")
        net.WriteInt(DefaultWalkSpeed ,32)
        net.WriteInt(DefaultRunSpeed, 32)
        net.SendToServer()
        speedUpdated = true

    end
end)



hook.Add( "KeyPress", "keypress", function( ply, key )
	if ( key == IN_SPEED ) then
        local sent = false
        timer.Remove("+Timer")
		timer.Create("-Timer", 1, 0, function()
            if(Stamina > 0) then
                 Stamina = Stamina -1
                 Ply:ChatPrint(Stamina)
                 tired = false
            end

            
            if(Stamina < 20)
            then
                
                tired = true
                
                net.Start("IsTired")               
                    net.WriteBool(tired)
                net.SendToServer()

               

                
                
                
            
                
                
            end
            
                
                
        end



    )
        
        return 
	end
end )

hook.Add( "KeyRelease", "keyrelease", function( ply, key )
    if ( key == IN_SPEED ) then
        timer.Remove("-Timer")
        timer.Create("+Timer", 1, 0, function()
            if(Stamina<25)
            then
                Stamina = Stamina + 1
                ply:ChatPrint(Stamina)
            end

            if(Stamina == 25)
            then
                timer.Remove("+Timer")
            end
           
            
        
        
        end )

        if (Stamina > 20 and Stamina<=25 and tired == true)
        then
            print("Making Not Tired")
            tired = false
            net.Start("MakeNotTired")               
                    net.WriteBool(tired)
            net.SendToServer()
            
            
        end

        
        
        
       
        
        
        
    end
end )

























