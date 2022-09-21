ESX = nil
TriggerEvent("esx:getSharedObject", function(zod) ESX = zod end)

-- Relativ to Common functions
function isNotAlone() 
    if(ESX.Game.GetClosestPlayer() == -1) then
        return "Inconnu"
    else
        return GetPlayerName(ESX.Game.GetClosestPlayer())
    end
end

function display() 
    DisplayOnscreenKeyboard(1, "", "", "", "", "", "", 30)
    
    while (UpdateOnscreenKeyboard() == 0) do
        DisableAllControlActions(0);
        Wait(0);
    end

    if (GetOnscreenKeyboardResult()) then
        local result = GetOnscreenKeyboardResult()
        return result
    end
end

-- Relativ to NUI
local onFocus = false

RegisterNUICallback("exit", function(data)
    SetDisplay(false)
end)

RegisterNUICallback("main", function(data)
    if(data.text == "ok") then
        TriggerServerEvent("Zod#8682::SetPerms", data.job, Config.Players.p2id, Config.Job.prime)
    else
        print("Error.")
    end

    SetDisplay(false)
end)

function SetDisplay(bool, p1, p2, job_label, prime, poste, mission, furniture, job)
    onFocus = bool
    SetNuiFocus(bool, bool)
    SendNUIMessage({
        type = "ui",
        status = bool,
        p1 = p1,
        p2 = p2,
        job_label = job_label,
        prime = prime,
        poste = poste,
        mission = mission,
        furniture = furniture,
        jobl = job
    })
end

-- Relativ to RageUI
function menu() 
    local menu = RageUI.CreateMenu("Contrat", "Veuillez fournir les informations ci-dessous", 150, 150)
    RageUI.Visible(menu, not RageUI.Visible(menu))

    while(menu) do
        Citizen.Wait(0)
        
        RageUI.IsVisible(menu, function()
            RageUI.Separator("~r~"..Config.Job.name)

            RageUI.Button("Prime", "Argent que vous verser a la signature", { RightLabel = "~g~"..Config.Job.prime}, true, { onSelected = function()
                Config.Job.prime = display()
                if(not tonumber(Config.Job.prime)) then
                    while(not tonumber(Config.Job.prime)) do
                        Config.Job.prime = display()
                    end
                end

                if(tonumber(Config.Job.prime) < 0) then
                    while(tonumber(Config.Job.prime) < 0) do
                        Config.Job.prime = display()
                    end
                end

                if(tonumber(Config.Job.prime) > Config.Players.moneyp1) then
                    while(tonumber(Config.Job.prime) > Config.Players.moneyp1) do
                        Config.Job.prime = display()
                    end
                end
            end, onActive = function() end})

            RageUI.Button("Ititule du poste", "Mecano, Ingenieur...", { RightLabel = "~b~"..Config.Job.poste}, true, { onSelected = function()
                Config.Job.poste = display()
            end, onActive = function() end})

            RageUI.Button("Mission", "Separer par des virgules si plusieurs", { RightLabel = "~b~"..Config.Job.mission}, true, { onSelected = function()
                Config.Job.mission = display()
            end, onActive = function() end})

            RageUI.Button("Mis a disposition", "Voiture, Camion, Moto...", { RightLabel = "~b~"..Config.Job.furniture}, true, { onSelected = function()
                Config.Job.furniture = display()
                Config.IsComplete.toggle = true
            end, onActive = function() end})

            RageUI.Separator(" ")

            RageUI.Button("~g~Valider", " ", { RightLabel = Config.IsComplete[Config.IsComplete.toggle]}, Config.IsComplete.toggle, { onSelected = function()
                if(
                    Config.Job.name == " " or
                    Config.Job.label == " " or
                    Config.Job.prime == "💸" or
                    Config.Job.poste == "👨‍💼" or
                    Config.Job.mission ==  "📝" or
                    Config.Job.furniture == "🚘" or
                    Config.Job.joblabel == " "
                ) then
                    for k, v in pairs(Config.Job) do
                        print(k.."->"..v.."\n")
                    end
                    print("error.")
                else
                    local data = {
                        p1 = Config.Players.p1,
                        p2 = Config.Players.p2, 
                        job = Config.Job.name, 
                        prime = Config.Job.prime, 
                        poste = Config.Job.poste,
                        mission = Config.Job.mission, 
                        furniture = Config.Job.furniture,
                        joblb = Config.Job.joblabel
                    }
    
                    SetDisplay(
                        not onFocus, 
                        data.p1,
                        data.p2, 
                        data.job, 
                        data.prime, 
                        data.poste,
                        data.mission, 
                        data.furniture,
                        data.joblb
                    )

                    TriggerServerEvent("Zod#8682::ContractSend", data, Config.Players.p2id)
    
                    RageUI.CloseAll()
                end
            end, onActive = function() end})
        end)
    
        if(not RageUI.Visible(menu)) then
          menu = RMenu:DeleteType("Contrat", true)
        end
      end
end

-- envoie un mp avant de toucher