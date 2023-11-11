Config                      = {}
Config.Locale               = GetConvar('esx:locale', 'fr')

Config.Accounts             = {
	bank = {
		label = TranslateCap('account_bank'),
		round = true
	},
	black_money = {
		label = TranslateCap('account_black_money'),
		round = true 
	},
	money = {
		label = TranslateCap('account_money'),
		round = true
	}
}

Config.StartingAccountMoney = { money = 3000, bank = 10000 }

Config.StartingInventoryItems = false -- table/false

Config.DefaultSpawns = { -- If you want to have more spawn positions and select them randomly uncomment commented code or add more locations
	{ x = 222.2027, y = -864.0162, z = 30.2922, heading = 1.0 },
	--{x = 224.9865, y = -865.0871, z = 30.2922, heading = 1.0},
	--{x = 227.8436, y = -866.0400, z = 30.2922, heading = 1.0},
	--{x = 230.6051, y = -867.1450, z = 30.2922, heading = 1.0},
	--{x = 233.5459, y = -868.2626, z = 30.2922, heading = 1.0}
}

Config.AdminGroups = {
	['admin'] = true
}


Config.EnablePaycheck = true -- active le paycheck
Config.LogPaycheck = false -- enregistre les paiements sur un canal Discord via un webhook (par défaut, c'est false)
Config.EnableSocietyPayouts = false -- paye à partir du compte de la société où le joueur est employé ? Condition : esx_society
Config.MaxWeight = 24 -- le poids maximum de l'inventaire sans sac à dos
Config.PaycheckInterval = 7 * 60000 -- fréquence de réception des chèques de paie en millisecondes
Config.EnableDebug = false -- Utiliser les options de débogage ?
Config.EnableDefaultInventory = true -- Affiche l'inventaire par défaut ( F2 )
Config.EnableWantedLevel = false -- Utilise le niveau normal de GTA ?
Config.EnablePVP = true -- Autorise les combats entre joueurs

Config.Multichar = GetResourceState("esx_multicharacter") ~= "missing"
Config.Identity = true -- Sélectionne les données d'identité d'un personnage avant qu'il ne soit chargé (ceci se produit par défaut avec multichar)
Config.DistanceGive = 4.0 -- Distance maximale pour donner des objets, des armes, etc.

Config.AdminLogging = false -- Enregistre l'utilisation de certaines commandes par ceux qui ont les permissions group.admin ace (faux par défaut)

Config.DisableHealthRegeneration = false -- Le joueur ne régénère plus sa santé.
Config.DisableVehicleRewards = false -- Désactive la récupération des armes des véhicules par le joueur
Config.DisableNPCDrops = false -- empêche les PNJ de lâcher des armes en cas de mort
Config.DisableDispatchServices = false -- Désactive les services de répartition
Config.DisableScenarios = false -- Désactive les scénarios
Config.DisableWeaponWheel = false -- Désactive la roue d'arme par défaut
Config.DisableAimAssist = false -- désactive l'assistance AIM (principalement sur les contrôleurs)
Config.DisableVehicleSeatShuff = false -- Désactive le mélange des sièges des véhicules
Config.DisableDisplayAmmo = false -- Désactive l'affichage des munitions


Config.RemoveHudComponents       = {
	[1] = false,                         --ÉTOILES RECHERCHÉES,
	[2] = false,                         --ICÔNE_POIGNÉE_DE_POIGNÉE
	[3] = false,                         --CASH
	[4] = false,                         --MP_CASH
	[5] = false,                         --MP_MESSAGE
	[6] = false,                         --NOM DU VÉHICULE (VEHICLE_NAME)
	[7] = false,                         -- NOM DE LA ZONE
	[8] = false,                         -- CLASSE DU VÉHICULE
	[9] = false,                         -- NOM DES RUE
	[10] = false,                        --HELP_TEXT
	[11] = false,                        --TEXTE_D'AIDE_FLOTTANT_1
	[12] = false,                        --TEXTE_D'AIDE_FLOTTANTE_2
	[13] = false,                        --CHANGEMENT DE CASH
	[14] = false,                        --RETICLE
	[15] = false,                        --SUBTITLE_TEXT
	[16] = false,                        --RADIO_STATIONS
	[17] = false,                        --SAUVEGARDE_GAME,
	[18] = false,                        --GAME_STREAM
	[19] = false,                        --ROUE D'ARMES
	[20] = false,                        --ROUE D'ARMES_STATS
	[21] = false,                        --HUD_COMPONENTS
	[22] = false,                        --HUD_WEAPONS
}

Config.SpawnVehMaxUpgrades = false -- les véhicules d'administration sont créés avec les paramètres maximums du véhicule.
Config.CustomAIPlates = '11AAA11' -- Plaques personnalisées pour les véhicules AI

-- Format de la chaîne de caractères
--1 donne un nombre aléatoire de 0 à 9.
--A donne une lettre aléatoire de A à Z.
-- . donne une lettre ou un chiffre aléatoire, avec une probabilité de 50 % pour l'un ou l'autre.
--^1 conduit à l'émission d'un 1 littéral.
--^A entraîne l'émission d'un A littéral.
--Tout autre caractère entraînera l'émission de ce caractère.
-- Une chaîne de moins de 8 caractères sera remplie à droite.