---------------------------------------------------------------------------
-- Blip Code
---------------------------------------------------------------------------
local jobMarkerBlips = {
    markerData = {},
    blipData = {},
    locations = {}
}
local drawBlips = {}
---------------------------------------------------------------------------
RegisterNetEvent("DRP_PoliceJob:SetLoadoutMarkerBlips")
AddEventHandler("DRP_PoliceJob:SetLoadoutMarkerBlips", function(markerD, blipD, locations)
    jobMarkerBlips.markerData = markerD
    jobMarkerBlips.locations = locations
    jobMarkerBlips.blipData = blipD
    for a = 1, #drawBlips do
        RemoveBlip(drawBlips[a])
    end
    drawBlips = {}
    for b = 1, #jobMarkerBlips.locations do
        local blip = AddBlipForCoord(jobMarkerBlips.locations[b].x, jobMarkerBlips.locations[b].y, jobMarkerBlips.locations[b].z)
        SetBlipSprite(blip, jobMarkerBlips.blipData.sprite)
        SetBlipColour(blip, jobMarkerBlips.blipData.color)
        SetBlipAsShortRange(blip, true)
        SetBlipScale(blip, jobMarkerBlips.blipData.scale)
        BeginTextCommandSetBlipName("STRING")
        AddTextComponentString(jobMarkerBlips.blipData.label)
        EndTextCommandSetBlipName(blip)
        table.insert(drawBlips, blip)
    end
end)

---------------------------------------------------------------------------
-- Locker Room Stuff
---------------------------------------------------------------------------
RegisterNetEvent("DRP_PoliceJob:OpenJobLoadout")
AddEventHandler("DRP_PoliceJob:OpenJobLoadout", function(loadouts)
    local menuPool = NativeUI.CreatePool()
    local mainMenu = NativeUI.CreateMenu('DRP Police Job', 'Pick Your Clothing')
    -- local subMenu = menuPool:AddSubMenu(mainMenu, "chicken")
    mainMenu:Visible(not mainMenu:Visible())

    for id, outfit in pairs(loadouts) do
        outfit.item = NativeUI.CreateItem(outfit.name, "Select This Outfit")
        mainMenu:AddItem(outfit.item)
    end

    mainMenu.OnItemSelect = function(sender, item, index)
        for id, outfit in pairs(loadouts) do
            if outfit.item == item then
                CreateThread(function()
                    setOutfit(outfit)
                end)
            end
        end
    end

    menuPool:Add(mainMenu)

    menuPool:RefreshIndex()

    CreateThread(function()
        while true do
            Wait(0)
            menuPool:ProcessMenus()
        end
    end)
end)

---------------------------------------------------------------------------
-- Main Thread
---------------------------------------------------------------------------
Citizen.CreateThread(function()
    while true do
        for a = 1, #jobMarkerBlips.locations do
            local playercoords = GetEntityCoords(GetPlayerPed(PlayerId()), false)
            local distance = Vdist(playercoords.x, playercoords.y, playercoords.z, jobMarkerBlips.locations[a].x, jobMarkerBlips.locations[a].y, jobMarkerBlips.locations[a].z)
            if distance <= 50.0 then
                DrawMarker(
                    jobMarkerBlips.markerData.markerType,
                    jobMarkerBlips.locations[a].x,
                    jobMarkerBlips.locations[a].y,
                    jobMarkerBlips.locations[a].z - 1.0,
                    0.0,
                    0.0,
                    0.0,
                    0.0,
                    0.0,
                    0.0,
                    jobMarkerBlips.markerData.scale,
                    jobMarkerBlips.markerData.scale,
                    jobMarkerBlips.markerData.scale,
                    jobMarkerBlips.markerData.color[1],
                    jobMarkerBlips.markerData.color[2],
                    jobMarkerBlips.markerData.color[3],
                    1.0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0
                )
                if distance <= 1.0 then
                    exports['drp_core']:DrawText3Ds(jobMarkerBlips.locations[a].x, jobMarkerBlips.locations[a].y, jobMarkerBlips.locations[a].z, jobMarkerBlips.markerData.label)
                    if IsControlJustPressed(1, 38) then
                        TriggerServerEvent("DRP_PoliceJob:GetJobLoadouts")
                    end
                end
            end
        end
        Citizen.Wait(0)
    end
end)