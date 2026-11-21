AddCSLuaFile("cl_init.lua")
AddCSLuaFile("shared.lua")
include("shared.lua")
include("lua/uWater/uWater.lua")

function ENT:Initialize()
    self.BaseClass.Initialize(self)

    self:SetModel(self.model)
    self:PhysicsInit(SOLID_VPHYSICS)
    self:SetMoveType(MOVETYPE_VPHYSICS)
    self:SetHealth(self.MaxHealth)

    local phys = self:GetPhysicsObject()
    if IsValid(phys) then
       phys:Wake()
       phys:SetMass(self.Weight) 
    end
end

function ENT.AddSeats()
    self.AddDriverSeat(Vector(0,0,50), Angle(0,0,0))
end

function ENT:PhysicsSimulate(phys, deltaTime)
    if self.BaseClass and self.BaseClass.PhysicsSimulate then
        self.BaseClass.PhysicsSimulate(self, phys, deltaTime)
    end
    if not self.PhysAPI then
        self.PhysAPI = phys.warp(self)
    end
    local api = self.PhysAPI
end
