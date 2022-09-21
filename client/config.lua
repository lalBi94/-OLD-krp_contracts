ESX = nil
TriggerEvent("esx:getSharedObject", function(zod) ESX = zod end)

Config = {}

Config.Players = {
    p1 = GetPlayerName(PlayerId()),
    p1id = GetPlayerServerId(PlayerId(-1)),
    p2 = isNotAlone(),
    p2id = GetPlayerServerId(ESX.Game.GetClosestPlayer()),
    moneyp1 = 0
}

Config.Date = {
    day = "",
    mouth = "",
    years = ""
}

Config.Job = {
    name = " ",
    prime = "💸",
    poste = "👨‍💼",
    mission = "📝",
    furniture = "🚘",
    joblabel = " "
}

Config.IsComplete = {
    [true] = " ",
    [false] = "🔒",
    toggle = false
}