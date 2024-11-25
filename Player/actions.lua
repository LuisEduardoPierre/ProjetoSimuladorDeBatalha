local utils = require "utils"
local actions = {}

--Cria uma lista de ações populada internamente
actions.list = {}

function actions.build()
    actions.list = {}

    --atacar com espada
    local swordAttack = {
        description = "Atacar com espada",
        requirement = nil,
        execute = function (playerData, creatureData)
            --1. Definir chance de sucesso
            local successChance = creatureData.speed == 0 and 1 or playerData.speed / creatureData.speed
            local success = math.random() <= successChance
            --2. calcular Dano
            local rawDamage = playerData.attack - math.random * creatureData.defense
            local damage = math.max(2, math.ceil(rawDamage))
            --3. Apresentar resultado com print
            if success then
                --4. Aplicar dano em caso de sucesso
                creatureData.health = creatureData.health - damage
                --5. Apresentar o resutado com o print
                print(string.format("%s com espada e causou %d de dano",playerData.name, damage))
                
                local healthRate = math.floor((creatureData.health/ creatureData.maxHealth) * 10)
                print(string.format("%s: %s",creatureData.name, utils.barra_progresso(healthRate)))
            else
                print("Ataque com espada falhou!!!")
            end
        end
    }
end

--Poção de regen usada
local regenPotion = {
    description = "Usar poção de regeneração",
    requirement = function (playerData, creatureData) 
        return playerData.potions >= 1 
    end,

    execute = function (playerData, creatureData)
        playerData.potions = playerData.potions - 1
        
        local regen = 5
        playerData.health = math.min(playerData.health, playerData + regen)
        print(string.format("%s usou uma poção e recuperou alguns pontos de vida.",playerData.name))
    end
}

--Populando Lista
actions.list[#actions.list + 1] = swordAttack
actions.list[#actions.list + 1] = regenPotion

-- Retorna uma lista de ações validas
function actions.getValidActions(playerData, creatureData)
    local validActions = {}
    for _, action in pairs(actions.list) do
        local requirement = action.requirement
        local isValid  = requirement == nil or requirement(playerData, creatureData)
        if isValid then
            validActions[#validActions+1] = action
            
        end

    end
    return validActions
end

return actions