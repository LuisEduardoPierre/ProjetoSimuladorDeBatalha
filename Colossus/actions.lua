local utils = require "utils"
local actions = {}

--Cria uma lista de ações populada internamente
actions.list = {}

function actions.build()
    actions.list = {}


    --atacar com espada
    local creatureAttack = {
        description = "Atacar Jogador",
        requirement = nil,
        execute = function (playerData, creatureData)
            --1. Definir chance de sucesso
            local successChance = playerData.speed == 0 and 1 or creatureData.speed / playerData.speed
            local success = math.random() <= successChance
            --2. calcular Dano
            local rawDamage = creatureData.attack - math.random * playerData.defense
            local damage = math.max(2, math.ceil(rawDamage))
            
            if success then
                --3. Aplicar dano em caso de sucesso
                playerData.health = playerData.health - damage
                --4. Apresentar o resutado com o print
                print(string.format("%s atacou %s e deu %d de dano",creatureData.name, playerData.name, damage))
                
                local healthRate = math.floor((playerData.health/ playerData.maxHealth) * 10)
                print(string.format("%s: %s",playerData.name, utils.barra_progresso(healthRate)))
            else
                print(string.format("%s errou o ataque ao player!!!", creatureData.name))
            end
        end
    }

    -- Ação de espera da criatura
local await = {
    description = "Aguardar",
    execute = function (playerData, creatureData)
            print(string.format("%s esta recuperando suas forças para atacar novamente... Aproveite a oportunidade para revidar!!",creatureData.name))
            
            local healthRate = math.floor((playerData.health/ playerData.maxHealth) * 10)
            print(string.format("%s: %s",playerData.name, utils.barra_progresso(healthRate)))
    end
}
-- Ataque de sonar / som
local sonarAttack = {
    description = "Ataque com Sonar",
    execute = function (playerData, creatureData)

        --2. calcular Dano
        local rawDamage = creatureData.attack - math.random * playerData.defense
        local damage = math.max(2, math.ceil(rawDamage * 0.3))
        
        
            --3. Aplicar dano em caso de sucesso
            playerData.health = playerData.health - damage
            --4. Apresentar o resutado com o print
            print(string.format("%s usou um sonar e deu %d de dano",creatureData.name, damage))
            
            local healthRate = math.floor((playerData.health/ playerData.maxHealth) * 10)
            print(string.format("%s: %s",playerData.name, utils.barra_progresso(healthRate)))
    end
}


--Populando Lista
actions.list[#actions.list + 1] = creatureAttack
actions.list[#actions.list + 1] = sonarAttack
actions.list[#actions.list + 1] = await

end

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