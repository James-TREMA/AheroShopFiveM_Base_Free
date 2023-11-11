Config = {}
Config.Locale = GetConvar('esx:locale', 'fr')

-- [Config.EnableCommands]
-- Active les commandes telles que /char et /chardel
Config.EnableCommands = ESX.GetConfig().EnableDebug

-- Méthode EXPERIMENTALE d'enregistrement des caractères
Config.UseDeferrals = false

-- Ces valeurs sont pour le format de date dans le menu d'enregistrement
-- Choix : DD/MM/YYYY | MM/DD/YYYY | YYYY/MM/DD
Config.DateFormat = 'DD/MM/YYYY'

-- Ces valeurs sont pour la deuxième validation d'entrée dans server/main.lua
Config.MaxNameLength = 20 -- Longueur maximale du nom.
Config.MinHeight = 120 -- Hauteur minimale de 120 cm
Config.MaxHeight = 220 -- 220 cm de hauteur maximale.
Config.LowestYear = 1900 -- 112 ans est l'âge le plus élevé que l'on puisse avoir.
Config.HighestYear = 2005 -- 18 ans est l'âge le plus jeune.

Config.FullCharDelete = true -- Supprime toutes les références au personnage.
Config.EnableDebugging = ESX.GetConfig().EnableDebug -- imprime pour le débogage :)