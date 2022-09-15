ESX = nil

Citizen.CreateThread(function()
    while ESX == nil do
        TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
        Citizen.Wait(1000)
    end
end)

local timer = Config.Time
local isTimerActive = false


RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(playerData)
    BeginTimer()
end)

function BeginTimer()
    if not isTimerActive then
        isTimerActive = true
        while timer >= 0 do
            timer = timer -1
            Citizen.Wait(60000)
            if Config.Debug then
                print(timer)
            end
            if timer == 0 then
                TriggerEvent('jotaro_coins:GiveItem')
                break
            end
        end
    end
end

RegisterNetEvent('jotaro_coins:GiveItem')
AddEventHandler('jotaro_coins:GiveItem', function()
    if timer == 0 then
        TriggerServerEvent('jotaro_coins:GiveItem')
        isTimerActive = false
        timer = Config.Time
        BeginTimer()
    end
end)

Citizen.CreateThread(function()
    if Config.Debug then
        RegisterCommand('StartTimer', function()
            BeginTimer()
        end)
    end
end)