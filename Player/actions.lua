local actions = {}

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
                print("Atacou com espada e causou " .. damage .. " de dano")
                --4. Aplicar dano em caso de sucesso
                creatureData.health = creatureData.health - damage
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
        print("Voce usou uma poção e recuperou alguns pontos de vida")
    end
}

--Populando Lista
actions.list[#actions.list + 1] = swordAttack


function actions.getValidActions()
    
end

return actions