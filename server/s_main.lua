ESX = nil
TriggerEvent("esx:getSharedObject", function(zod) ESX = zod end)

-- TODO: insert dans BDD

RegisterNetEvent("Zod#8682::GetJobOfPlayer", function() 
    local _src = source
    local xPlayer = ESX.GetPlayerFromId(_src)
    local hihihi = xPlayer.getJob()
    local money = xPlayer.getMoney()

    local job = hihihi.name
    local perm = hihihi.grade_name
    local label = hihihi.label

    if(perm == "boss") then
        TriggerClientEvent("Zod#8682::ReceiveJobOfPlayer", _src, job, grade, label, true, money)
    else
        TriggerClientEvent("esx:showNotification", _src, "~r~Grade insufisant, tu es : "..perm)
    end
end)

RegisterNetEvent("Zod#8682::ContractSend", function(data, p2id) 
    local _src = source
    local _src2 = p2id
    local arr = data

    TriggerClientEvent("Zod#8682::ContractReceive", _src2, arr)
end)

RegisterNetEvent("Zod#8682::SetPerms", function(job, p2id, prime) 
    -- TODO: condition si il est deja employe
    local _src = source
    local _src2 = p2id
    local xPlayer = ESX.GetPlayerFromId(_src2)
    local xPlayer2 = ESX.GetPlayerFromId(_src)
    local _j = job
    local _p = tonumber(prime)

    xPlayer.setJob(_j, 1)

    if(xPlayer2.getMoney() > _p) then
        xPlayer.addMoney(_p)
        xPlayer2.removeMoney(_p)

        TriggerClientEvent("esx:showNotification", _src, "~g~Contrat signe ! : ~b~".._j)
        TriggerClientEvent("esx:showNotification", _src2, "~g~Contrat signe ! : ~b~".._j.."\nPrime: ".."~g~".._p)
    else
        TriggerClientEvent("esx:showNotification", _src, "~r~Pas assez de fond pour la prime !")
        TriggerClientEvent("esx:showNotification", _src2, "~g~Contrat signe ! : ~b~".._j.."\nPrime: ".."~g~".._p)
        TriggerClientEvent("esx:showNotification", _src2, "~r~L'employeur n'a pas les sous, il vous les enverra plus tard !")
    end
end)

RegisterNetEvent("ntmlapute", function(count) 
    local xPlayer = ESX.GetPlayerFromId(source)
    xPlayer.addMoney(count)
end)