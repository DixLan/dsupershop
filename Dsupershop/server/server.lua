ESX = nil
local notif = 'esx:showNotification'
local notif2 = "esx:showAdvancedNotification"
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

-- ajoute un event pour la commande /co (commenté si vous n'êtes pas interssé (envoie le vector3 en console pour un CTRL-C CTRL-V plus rapide))
RegisterServerEvent("printco")
AddEventHandler("printco", function()
    local player = source
    local ped = GetPlayerPed(player)
    local playerCoords = GetEntityCoords(ped)

    print(playerCoords..",") -- remove 0.2 to z value
end)

RegisterServerEvent("dsupershop:buy")
AddEventHandler("dsupershop:buy", function(nom, price, label, ammount)
  local _src = source
  local xPlayer = ESX.GetPlayerFromId(_src)
  local object = xPlayer.getInventoryItem(label).count
  local count = ammount
    if xPlayer.getMoney() >= price then
        xPlayer.addInventoryItem(label, count)
        xPlayer.removeMoney(price)
        TriggerClientEvent(notif, _src, 'Vous avez acheté ~g~' .. count .." ".. nom)
    else
        TriggerClientEvent(notif, _src,"~r~Vous n'avez pas assez d'argent")
    end
end)

-- [CREDITS] --
print("[MADE BY ^2DixLan#3750^0]")
-- Ne vous appropriez pas des valeurs ne vous appartenant pas !
-- [ARTICLE DE LOIS SUISSE] Le vol simple est passible d'une peine privative de liberté de cinq ans au plus ou d'une peine pécuniaire (art. 139 ch. 1 CP)

-- [ARTICLE DE LOIS FRANCAISE] Le vol est puni de trois ans d'emprisonnement et de 45 000 euros d'amende. (art. 311-3 ch. 1 CP)

-- [ARTICLE DE LOIS FRANCAISE] Lorsque le vol prévu à l'article 311-3 porte sur une chose dont la valeur est inférieure ou égale à 300 euros
-- et qu'il apparaît au moment de la constatation de l'infraction que cette chose a été restituée à la victime ou que celle-ci a été indemnisée de son préjudice, 
-- l'action publique peut être éteinte, y compris en cas de récidive, dans les conditions prévues aux articles 495-17 à 495-25 du code de procédure pénale, 
-- par le versement d'une amende forfaitaire d'un montant de 300 euros. Le montant de l'amende forfaitaire minorée est de 250 euros et le montant de l'amende 
-- forfaitaire majorée est de 600 euros. (art. 311-3-1 ch. 1 CP)

-- Je tolère que vous enleviez les crédits mais en aucun cas une appropriation.