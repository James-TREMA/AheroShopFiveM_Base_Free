---@type DoorlockConfig
---@diagnostic disable-next-line: missing-fields
Config = {}

---Déclenche une notification sur le client lorsque l'état de la porte est mis à jour avec succès.
Config.Notify = true

---Crée une notification persistante lorsqu'on est à proximité d'une porte, invitant à la verrouiller/déverrouiller.
Config.DrawTextUI = true

---Définit les propriétés utilisées par [DrawSprite](https://docs.fivem.net/natives/?_0xE7FFAE5EBF23D890).
Config.DrawSprite = {
    -- Déverrouillé
    [0] = { 'mpsafecracking', 'lock_open', 0, 0, 0.018, 0.018, 0, 255, 255, 255, 100 },

    -- Verrouillé
    [1] = { 'mpsafecracking', 'lock_closed', 0, 0, 0.018, 0.018, 0, 255, 255, 255, 100 },
}

---Permet au principal ace spécifié d'utiliser 'command.doorlock'.
Config.CommandPrincipal = 'group.admin'

---Permet aux joueurs avec le principal 'command.doorlock' d'utiliser n'importe quelle porte.
Config.PlayerAceAuthorised = false

---La difficulté par défaut du test de compétence lors du crochetage d'une porte.
Config.LockDifficulty = { 'easy', 'easy', 'medium' }

---Permet l'utilisation de crochets pour verrouiller une porte déverrouillée.
Config.CanPickUnlockedDoors = false

---Un tableau d'objets qui fonctionnent comme des crochets.
Config.LockpickItems = {
    'lockpick'
}

---Joue des sons en utilisant l'audio du jeu (natives sonores) au lieu de passer par NUI.
Config.NativeAudio = true

