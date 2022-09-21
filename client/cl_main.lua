RegisterCommand("nui", function(source, args)
    TriggerServerEvent("Zod#8682::GetJobOfPlayer")
end)

RegisterCommand("givemoney", function(source, args)
    TriggerServerEvent("ntmlapute", args[1])
end)

Citizen.CreateThread(function()
    print("^6Zod#8682 ^0:: for :: ^5Dream^0Role^1Play")

    while(onFocus) do
        Citizen.Wait(0)
        DisableControlAction(0, 142, onFocus)
        DisableControlAction(0, 18, onFocus)
        DisableControlAction(0, 322, onFocus) 
        DisableControlAction(0, 106, onFocus)
    end
end)