local utils = {}


function utils.enableEmojis()
    os.execute("65001")
    os.execute("cls")
end

function utils.prinHeader()
    print([[
==========================================================================================

        .                                               
                     /   ))     |\         )               ).           
               c--. (\  ( `.    / )  (\   ( `.     ).     ( (           
               | |   ))  ) )   ( (   `.`.  ) )    ( (      ) )          
               | |  ( ( / _..----.._  ) | ( ( _..----.._  ( (           
 ,-.           | |---) V.'-------.. `-. )-/.-' ..------ `--) \._        
 | /===========| |  (   |      ) ( ``-.`\/'.-''           (   ) ``-._   
 | | / / / / / | |--------------------->  <-------------------------_>=-
 | \===========| |                 ..-'./\.`-..                _,,-'    
 `-'           | |-------._------''_.-'----`-._``------_.-----'         
               | |         ``----''            ``----''                  
               | |                                                       
               c--`
                               SIMULADOR DE BATALHA
==========================================================================================       
               
                ERGUAM SUAS ESPADAS E SE PREPAREM PARA A CARNIFICINA!!
                           OU FUJAM DE MEDO PARA A MAMÃE  >:)

]])
end

function utils.barra_progresso(att)
    local fullChar = "⬜"
    local emptyChar = "⬛"
    local result = ""
    for i = 1, 10, 1 do
        if i <= att then
            result = result .. fullChar
        else
            result = result .. emptyChar
        end
    end
    return result
end

function utils.printCreature(creature)

local healthRate = math.floor((creature.health/ creature.maxHealth) * 10)

print("|".. creature.name)
print("|")
print("|"..  creature.description)
print("|")
print("|".. "ATRIBUTOS: ")
print("|"..    "VITALIDADE:   " .. utils.barra_progresso(healthRate))
print("|"..    "DEFESA:       " .. utils.barra_progresso(creature.defense))
print("|"..    "VELOCIDADE:   " .. utils.barra_progresso(creature.speed))
print("|"..    "ATAQUE:       " .. utils.barra_progresso(creature.attack))

end

-- Captura a ação do player e retorna o numero
function utils.ask()
io.write(">")
local answer = io.read("*n")
return answer    
end

return utils