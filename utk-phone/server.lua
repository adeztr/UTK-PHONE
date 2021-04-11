ESX = nil


Citizen.CreateThread(function()
    while ESX == nil do
        Citizen.Wait(10)
        TriggerEvent("esx:getSharedObject", function(obj)
            ESX = obj
        end)
    end
end)



RegisterNetEvent("utk_laptop:datastore")
AddEventHandler('utk_laptop:datastore', function()

 
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
    if xPlayer ~= nil then
        print("geldi")
        TriggerClientEvent('utk_laptop:client:data_transceiver', source, { hex = xPlayer.identifier })

       -- TriggerClientEvent('utk_laptop:client:data_transceiver', )

    end
    
 
end)

RegisterNetEvent("utkphone:get_phone_number")
AddEventHandler('utkphone:get_phone_number', function()

    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
    if xPlayer ~= nil then
        print("Phone number : "..get_phone_number(xPlayer.identifier))
        TriggerClientEvent('utkphone:client:gpn', source, { telefon = get_phone_number(xPlayer.identifier) })
    end
 
end)


function get_phone_number(identifier)
    local datastore = MySQL.Sync.fetchAll("SELECT * FROM users WHERE identifier=@identifier", { ['@identifier'] = identifier })
    return datastore[1].phone_number
end

function getPlayerID(source)
    local identifiers = GetPlayerIdentifiers(source)
    local player = getIdentifiant(identifiers)
    return player
end
 
function getIdentifiant(id)
    for _, v in ipairs(id) do
        return v
    end
end