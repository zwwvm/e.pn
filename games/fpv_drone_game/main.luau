cfg = {
    ["Database"] = require(game:GetService("ReplicatedStorage").Framework.Database),
    ["Equipped"] = require(game.ReplicatedStorage.Framework.Editor).Equipped,
    ["Explosive"] = require(game:GetService("ReplicatedStorage").Framework.Database).Attachments[require(game.ReplicatedStorage.Framework.Editor).Equipped.Explosive]
}

local repo = 'https://raw.githubusercontent.com/violin-suzutsuki/LinoriaLib/main/'
local Library = loadstring(game:HttpGet(repo .. 'Library.lua'))()

local Window = Library:CreateWindow({Title = 'e.pn | fpv drone game ( key: right shift )', Center = true, AutoShow = true})

local main_tab = Window:AddTab('main')
local modifications_box = main_tab:AddLeftTabbox()
local attachments_box = main_tab:AddRightGroupbox('attachments')
local speed_mod_tab = modifications_box:AddTab("speed")
local cool_down_mod_tab = modifications_box:AddTab("cooldown")
local explosion_radius = modifications_box:AddTab("explosion")

speed_mod_tab:AddSlider('speed_slider', {Text = 'speed', Default = cfg.Explosive.speed, Min = 5, Max = 300, Rounding = 1, Callback = function(v)
        cfg.Explosive.speed = v
    end
})

cool_down_mod_tab:AddSlider('cooldown_slider', {Text = 'xray', Default = cfg.Database.Settings.xrayCooldownTime, Min = 0, Max = 100, Rounding = 1, Callback = function(v)
        cfg.Database.Settings.xrayCooldownTime = v
    end
})
explosion_radius:AddSlider('radius_slider', {Text = "radius () doesn't work anymore )", Default = cfg.Explosive.explosionRadius, Min = 5, Max = 1000, Rounding = 1, Callback = function(v)
        cfg.Explosive.explosionRadius = v
    end
})

attachments_box:AddDropdown('camera_changer', {Values = cfg.Database.Categories.Camera.attachments,Default = cfg.Equipped.Camera, Multi = false,Text = 'camera:',
Callback = function(v)
        cfg.Equipped.Camera = v
    end
})

attachments_box:AddDropdown('battery_changer', {Values = cfg.Database.Categories.Battery.attachments,Default = cfg.Equipped.Battery, Multi = false,Text = 'battery:',
Callback = function(v)
        cfg.Equipped.Battery = v
    end
})

attachments_box:AddDropdown('explosive_changer', {Values = cfg.Database.Categories.Explosive.attachments,Default = cfg.Equipped.Explosive, Multi = false,Text = 'bomb:',
Callback = function(v)
        cfg.Equipped.Explosive = v
    end
})
