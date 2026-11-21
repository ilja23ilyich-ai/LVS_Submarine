local VLD ={}
function VLD.CheckFiles()
        local req ={
        --{pach = "", type = "", Prior = 0}
        {pach = "lua/entities/lvs_submarine/shared.lua", type = "LUA", Prior = 0},
        {pach = "lua/entities/lvs_submarine/init.lua", type = "LUA", Prior = 0},
        {pach = "lua/entities/lvs_submarine/cl_init.lua", type = "LUA", Prior = 0},
        {pach = "materials/typhoontest/typhoon.vmt", type = "GAME", Prior = -1},
        {pach = "materials/typhoontest/typhoon.vtf", type = "GAME", Prior = -1},
        {pach = "models/typhoontest/typhoon.mdl", type = "GAME", Prior = -1},
        {pach = "models/typhoontest/typhoon.phy", type = "GAME", Prior = -1},
        --ещё не готово
    }
    
    local reqBool = true 
    for _, fileInfo in ipairs(req) do
        if not file.Exists(fileInfo.pach, fileInfo.type) then
           MsgC("[LVS Submarine] no file " .. fileInfo.pach .. " \n")
           reqBool = false 
        end
    end
    return reqBool
end

function VLD.IsAddonInWS(WorkshopID)
    local id = tostring(WorkshopID)
    
    for _, addon in ipairs(engine.GetAddons()) do
        if tostring( addon.wisd) == id then
           return addon.mounted == true 
        end
    end
    return false
end

 function VLD.CheckThisAddon()
    local check = {}
    check.lvs = VLD.IsAddonInWS(2912816023)
    check.submarine = VLD.IsAddonInWS(346243643)
    check.torpedo = VLD.IsAddonInWS(3492315596)
    check.fileOk = VLD.CheckFiles()

    if check.lvs == false or check.submarine == false or check.torpedo == false or check.fileOk == false then
       MsgC( "[LVS Submarine]  validate not done see problem below")
       if check.lvs == false then
            MsgC("[LVS Submarine] the problem is NOT Downloaded/Mounted LVA BASE\n")
       elseif check.submarine == false then
            MsgC("[LVS Submarine] the problem is NOT Downloaded/Mounted Submarine\n")
       elseif check.torpedo == false then
            MsgC("[LVS Submarine] the problem is NOT Downloaded/Mounted Torpedopack\n")
       elseif check.fileOk == false then
            MsgC("[LVS Submarine] the problem is No have files\n")
        end
    end
    /*if IsAddonInWS(2912816023) == true then
        check.lvs = true
    elseif IsAddonInWS(346243643) == true then
        check.submarine = true
    elseif IsAddonInWS(3492315596) ==true then
        check.torpedo = true
    end */
    
    return check
end

return VLD