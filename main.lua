local player = require("Player.player") 
local creature = require("Colossus.creature")
local utils = require("utils")
utils.enableEmojis()
--Header
utils.prinHeader()
--obter a definição de jogador
print(player.attack)
--Obter definição de monstro
local boss = creature
--Apresentar monstro
utils.printCreature(boss)
--começar loop de batalha
while true do

--Oferecer ações possíveis para o jogador

--Turno de escolha do player



--Finaliza o codigo caso o player fique com vida <= 0
if player.health <= 0 then
        break
    end

--turno de escolha do boss

--Finaliza o codigo caso o boss fique com vida <= 0
if boss.health <= 0 then
        break
    end
end