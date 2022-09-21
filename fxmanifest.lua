fx_version 'adamant'
game 'gta5'

author "General Zod"
description "Contract script for Dream RolePlay"

ui_page { 
    "ui/main.html" 
}

files {
    "ui/main.html",
    "ui/main.js",
    "ui/main.css"
}

client_scripts{
    -- RageUI
    "rui/RMenu.lua",
    "rui/menu/RageUI.lua",
    "rui/menu/Menu.lua",
    "rui/menu/MenuController.lua",
    "rui/components/*.lua",
    "rui/menu/elements/*.lua",
    "rui/menu/items/*.lua",
    "rui/menu/panels/*.lua",
    "rui/menu/windows/*.lua",

    -- Clients
    "client/cl_main.lua",
    "client/cl_functions.lua",
    "client/cl_event.lua",
    "client/config.lua"
}

server_scripts {
    "server/s_main.lua",
    "client/config.lua"
}