AddCSLuaFile("cl_init.lua")
AddCSLuaFile("shared.lua")
include("shared.lua")

function ENT:Initialize()
    self.BaseClass.Initialize(self)

end

function ENT.AddSeats()
    self.AddDriverSeat(Vector(0,0,50), angle(0,0,0))
end

function ENT:PhysicsSimulate(phys, deltaTime)
    self.BaseClass.PhysicsSimulate(self, phys, deltaTime)
    local api = self.PhysAPI
    if not api then return end

    local driver = self.GetDirver()
    if IsValid(driwer) then
        if driver:KeyDown(IN_JUMP) then
            api:Surface(1500)
        elseif driver:KeyDown(IN_DUCK) then
            api:Drive(1500)
        end
    end
end

