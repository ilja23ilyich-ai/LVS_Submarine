AddCSLuaFile("cl_init.lua")
AddCSLuaFile("shared.lua")
include("shared.lua")
local uAPI =  include("lua/uWater/uWater.lua")

function ENT:Initialize()
    self.BaseClass.Initialize(self)

    self:SetModel(self.Model)
    self:PhysicsInit(SOLID_VPHYSICS)
    self:SetMoveType(MOVETYPE_VPHYSICS)
    self:SetHealth(self.MaxHealth)

    local phys = self:GetPhysicsObject()
    if IsValid(phys) then
       phys:Wake()
       phys:SetMass(self.Weight) 
    end
end



function ENT:OnSpawn(PObj)
    local DriverSeat = self:AddDriverSeat(Vector(0,0,50), Angle(0,0,0))
    if IsValid(DriverSeat) then
       DriverSeat.HidePlayer = true 
    end
    --self:AddPassengerSeat(Vector(0,0,50), Angle(0,0,0))
end

/*
ENT.AddSeats не должны вызыватся тут надо в OnSpawn()
function ENT.AddSeats()
    self:AddDriverSeat()
    --AddDriverSeat(Vector(0,0,50), Angle(0,0,0))
end
*/
function ENT:PhysicsSimulate(phys, deltaTime)
    if self.BaseClass and self.BaseClass.PhysicsSimulate then
        self.BaseClass.PhysicsSimulate(self, phys, deltaTime)
    end
    if not uAPI then
        self.PhysAPI = uAPI.Wrap(self)
    end
    local api = self.PhysAPI
    if not api then return end
    local driver = self:GetDriver()
    if IsValid(driver) then
       if driver:KeyDown(IN_JUMP) then api:Surface(1500) end
       if driver:KeyDown(IN_DUCK) then api:Dive(1500) end
       if driver:KeyDown(IN_FORWARD) then api:Thrust(800) end
       if driver:KeyDown(IN_BACK) then api:Thrust(-800) end
       if driver:KeyDown(IN_MOVELEFT) then api:Turn(800) end
       if driver:KeyDown(IN_MOVERIGHT) then api:Turn(-800) end
    end
    local velocity = phys:GetVelocity()
    local dragC = 0.3
    local dragF = -velocity * dragC
    api:AddLinarForce(dragF)
    return api._angularForce, api._leinarForce, SIM_LOCAL_FORCE
end
