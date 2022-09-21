ESX = nil
TriggerEvent("esx:getSharedObject", function(zod) ESX = zod end)

RegisterNetEvent("Zod#8682::ReceiveJobOfPlayer", function(job, grade, label, check, money)
    if(check) then
        Config.Job.name = label
        Config.Job.joblabel = job
        Config.Players.moneyp1 = money
        menu()
    end
end)

RegisterNetEvent("Zod#8682::ContractReceive", function(data) 
    local arr = data
    SetDisplay(
        not onFocus, 
        arr.p1, 
        arr.p2, 
        arr.job, 
        arr.prime, 
        arr.poste,
        arr.mission, 
        arr.furniture,
        arr.joblabel
    )
end)