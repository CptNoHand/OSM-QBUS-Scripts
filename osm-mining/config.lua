Config = {
    Items = {
    'steel',
    'iron',
    'copper',
    'metalscrap',
    'aluminum'},
    PickupCoords = vector3(2953.1809082031,2742.7822265625,43.618045806885),
    GetMetal = vector3(3801.583984375,4475.2426757812,5.9926810264587),
    WashCoords = vector3(3842.9516601562,4445.056640625,0.34231993556023),
    Objects = {
        ['drill'] = 'prop_tool_jackham',
        ['stone'] = 2139496847,
    },
    MiningPositions = {
        {coords = vector3(2992.77, 2750.64, 42.78), heading = 209.29},
        {coords = vector3(2983.03, 2750.9, 42.02), heading = 214.08},
        {coords = vector3(2976.74, 2740.94, 43.63), heading = 246.21},
        {coords = vector3(2998.17, 2796.16, 44.94), heading = 279.59},
        {coords = vector3(3005.1, 2782.4, 44.48), heading = 290.25},
        {coords = vector3(2913.88, 2802.41, 44.56), heading = 60.43},
        {coords = vector3(2928.11, 2759.41, 45.12), heading = 146.34},
        {coords = vector3(2934.29, 2742.46, 44.24), heading = 98.54}
    },
}

Strings = {
    ['press_mine'] = 'Drücke ~INPUT_CONTEXT~ um zu sprengen.',
    ['mining_info'] = 'Drücke ~INPUT_FRONTEND_RDOWN~ to chop, ~INPUT_FRONTEND_RRIGHT~ to stop.',
    ['you_sold'] = 'Du verkaufst %sx %s for %s',
    ['e_sell'] = 'Drücke ~INPUT_CONTEXT~ um all dein Erz zu verkaufen.',
    ['someone_close'] = 'Jemand ist im Gefahrengebiet!',
    ['mining'] = 'Abbauen',
    ['sell_mine'] = 'Verkaufen',
    ['afterexplosion'] = 'Explosion erfolgreich. Baue die Steine ab!',
    
}

Config.SellLocations = {
     [1] = {
         ["coords"] = {
             ["x"] = -96.984, 
             ["y"] = -1013.646, 
             ["z"] = 27.275
            }
        }
}