local player = require("Player.player") 
local creature = require("Colossus.creature")
local creatureActions = require("Colossus.actions")
local utils = require("utils")
local playerActions = require("Player.actions")
os.execute("chcp 65001")

--Header
utils.prinHeader()
--obter a definição de jogador
print(player.attack)
--Obter definição de monstro
local boss = creature
local bossActions = creatureActions
--Apresentar monstro
utils.printCreature(boss)
--Construir as ações possíveis no jogo
playerActions.build()
bossActions.build()
--começar loop de batalha
while true do

--Oferecer ações possíveis para o jogador
print(string.format("Qual sera a próxima ação de %s?",player.name))
local validPlayerActions =  playerActions.getValidActions(player, boss)
for i , action in pairs(validPlayerActions) do
    print(string.format("%d. %s",i, action.description))
end
print()
local chosenIndex = utils.ask()
local chosenAction = validPlayerActions[chosenIndex]
local isActionValid = chosenAction ~= nil
--Turno de escolha do player
if isActionValid then
    chosenAction.execute(player, boss)
else
    print(string.format("Ação inválida. %s perdeu a vez.", player.name))
end


--Finaliza o codigo caso o player fique com vida <= 0
if player.health <= 0 then
        break
    end

--turno de escolha do boss
print()
local validBossActions = bossActions.getValidActions(player, boss)
local bossActions = validBossActions[math.random(#validBossActions)]
bossActions.execute(player,boss)
--Finaliza o codigo caso o boss fique com vida <= 0
end

if player.health <= 0 then
    print()
    print(string.format("%s perdeu a batalha!", player.name))
    print("Quem sabe um outro guerreiro o derrotará")
elseif boss.health <= 0   then
    print()
    print(string.format("%s prevaleceu e venceu a batalha contra!", player.name, boss.name))
    print("Parabéns!!!")
end