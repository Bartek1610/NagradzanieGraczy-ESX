ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterServerEvent('jotaro_coins:GiveItem')
AddEventHandler('jotaro_coins:GiveItem', function()
    local xPlayer = ESX.GetPlayerFromId(source)
    if Config.Money then
        xPlayer.addAccountMoney('bank', Config.Count)
        xPlayer.showNotification('Zostałeś Nagrodzony za Rozgrywkę na serwerze przez '..Config.Time..' minut! Gratulujemy i życzymy miłej rozgrywki!')
    else
        xPlayer.addInventoryItem(Config.Item, Config.Count)
        xPlayer.showNotification('Zostałeś Nagrodzony za Rozgrywkę na serwerze przez '..Config.Time..' minut! Gratulujemy i życzymy miłej rozgrywki!')
    end
end)