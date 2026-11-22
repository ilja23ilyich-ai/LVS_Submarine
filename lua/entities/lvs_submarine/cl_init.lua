include("shared.lua")

function ENT:Initialize()
    self.BaseClass.Initialize(self)
    self.EngineSound =CreateSound(self, "lvs_submaribne/sonar.ogg")
    if self.EngineSounnd then

    end
end

function ENT:Draw(flags)
    self.BaseClass.Draw(self, flags)
    local driver = self:GetDriver()
    if not IsValid(driver) or driver ~= LocalPlayer() then return end
    local depth = -self:GetPos().z
    draw.SimpleText("Глубина: " .. math.Round(depth) .. " М", "DermaLarge", ScrW()/2, ScrH() -100, Color(0,255,255), TEXT_ALIGN_CENTER)

    
end

