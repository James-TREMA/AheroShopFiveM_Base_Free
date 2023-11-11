Config = {
    -- Être notifié lorsqu'une nouvelle version est disponible
    versionCheck = true,

    -- Activer le support pour ox_target
    ox_target = true,

    -- /*
    -- * Afficher ou masquer les blips des stations-service
    -- * 0 - Masquer tous
    -- * 1 - Afficher le plus proche (vérification toutes les 5000ms)
    -- * 2 - Afficher tous
    -- */
    showBlips = 1,

    -- Quelles touches désactiver pendant le ravitaillement
    disabledKeys = { 0, 22, 23, 24, 29, 30, 31, 37, 44, 56, 82, 140, 166, 167, 168, 170, 288, 289, 311, 323 },

    -- Durée totale (ex. 10% de carburant manquant) : 10 / 0.25 * 250 = 10 secondes

    -- Valeur de remplissage du carburant (ajouter 0.25% toutes les 250ms)
    refillValue = 0.50,

    -- Intervalle de temps pour le remplissage du carburant (toutes les 250 ms)
    refillTick = 250,

    -- Coût du carburant (ajouté à chaque intervalle)
    priceTick = 5,

    -- Perte de durabilité du bidon à chaque intervalle de remplissage
    durabilityTick = 1.3,

    -- Activer le bidon d'essence
    petrolCan = {
        enabled = true,
        duration = 5000,
        price = 1000,
        refillPrice = 800,
    },

    -- Multiplicateur de consommation de carburant basé sur la classe du véhicule (par défaut 1.0)
    classUsage = {
        [13] = 0.0, -- Cycles
    },

    -- Consommation de carburant par seconde en fonction du régime moteur du véhicule
    rpmUsage = {
        [1.0] = 0.14,
        [0.9] = 0.12,
        [0.8] = 0.10,
        [0.7] = 0.09,
        [0.6] = 0.08,
        [0.5] = 0.07,
        [0.4] = 0.05,
        [0.3] = 0.04,
        [0.2] = 0.02,
        [0.1] = 0.01,
        [0.0] = 0.00,
    },

    -- Véhicules électriques (non utilisés actuellement)
    electricModels = {
        [`airtug`] = true,
        [`neon`] = true,
        [`raiden`] = true,
        [`caddy`] = true,
        [`caddy2`] = true,
        [`caddy3`] = true,
        [`cyclone`] = true,
        [`dilettante`] = true,
        [`dilettante2`] = true,
        [`surge`] = true,
        [`tezeract`] = true,
        [`imorgon`] = true,
        [`khamelion`] = true,
        [`voltic`] = true,
        [`iwagen`] = true,
    },

    -- Modèles de pompes à essence
    pumpModels = {
        `prop_gas_pump_old2`,
        `prop_gas_pump_1a`,
        `prop_vintage_pump`,
        `prop_gas_pump_old3`,
        `prop_gas_pump_1c`,
        `prop_gas_pump_1b`,
        `prop_gas_pump_1d`,
    }
}