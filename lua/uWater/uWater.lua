--uWater АПИшка для работы с физикой

local PHYS = {}

local function CreatePhys(physObj, ent)
    local wrapper = {
        _phys = physObj,
        _ent = ent,
        _mass = physObj:GetMass(),
        _buoyncy = 0.5, 
        _leinarForce = Vector(0,0,0),
        _angularForce = Vector(0,0,0)
    }
    return setmetatable(wrapper, {_index=PHYS})
end

function PHYS:AddLinarForce(force)
    self._leinarForce = self._leinarForce + force
end

function PHYS:AddAngularForce(force)
    self._angularForce = self._angularForce + force
end

function PHYS:ResetForce()
    self._leinarForce = Vector(0, 0, 0)
    self._angularForce = Vector(0, 0, 0)
end

function PHYS.Wrap(ent)
    local phys = ent:GetPhysicsObject()
    if not IsValid(phys) then return nil end
    return CreatePhys(phys, ent)
end

function PHYS:AppyLocalForce(LocalForce,LocalPos)
    local phys = self._phys
    if not IsValid(phys) then return nil end

    local worldForce = self._ent:LocalToWorldVector(LocalForce)
    local worldPos = self._ent:LocalToWorld(LocalPos)

    phys:ApplyForceOffset(worldForce, worldPos)
end
function PHYS:SetBuoyancy(ratio)
    self._buoyncy = math.Clamp(ratio, 0, 2) 
    self._phys:SetBioyancyRatio(self._buoyncy)   
end

function PHYS:Drive(force)
    --self:  (vector(0, 0, -(force or 1000)), LocalPos)

end

function PHYS:Surface()
    --self:AppyLocalForce(vector(0, 0, -(force or 1000)), LocalPos)
end

function PHYS:Thrust()
    
end

function PHYS:Turn()
    
end