local Validator = include("lvs_submarine/sh_validator.lua")

hook.Add("Initialize", "LVS_Submarine_Validate", function()
    if not Validator.CheckThisAddon() then MsgC("[LVS Submarine] {WARNING!} Check of THIS ADDON was not succsesful! CANNOT work correctly\n") else MsgC("[LVS Submarine] Succes\n") end
end)

resource.AddFile("sound/lvs_submarine/sonar.ogg")
resource.AddFile("sound/lvs_submarine/start.ogg")
resource.AddFile("sound/lvs_submarine/shutdown.ogg")


/*
*Раскоментировать при локальном запуске в мультиплеере

local files = {
    "models/typhoontest/typhoon.mdl",
    "models/sw/rus/torpedoes/45_36.mdl",
    "models/sw/rus/torpedoes/45_36man.mdl",
    "models/sw/rus/torpedoes/53_39.mdl",
    "models/sw/rus/torpedoes/53_56.mdl",
    "models/sw/rus/torpedoes/53_57.mdl",
    "models/sw/rus/torpedoes/53_65.mdl",
    "models/sw/rus/torpedoes/set65.mdl",
    "models/sw/rus/torpedoes/umgt1.mdl"
}

for _, localf in ipairs(files) do
    if not file.Exists(localf, "GAME") then
        break
    end
    resource.AddFile(localf)
end
*/