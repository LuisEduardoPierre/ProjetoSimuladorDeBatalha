local player = require("Definitions.player") 
local creature = require("Definitions.creature")
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
