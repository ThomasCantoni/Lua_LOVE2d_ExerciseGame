TileClass = require("Tile")
PlayerClass = require("Player")
CoinClass = require("Coin")

wf = require "libraries/windfield"
Map = {}
Objects = {}
function love.load()
    love.window.setMode(650,650)
    love.physics.setMeter(64)
    world = wf.newWorld(0, 0, true)
    world:addCollisionClass('player')
    world:addCollisionClass('coin')
    
    
    for i=0,5 do
        for j=0,5 do
            table.insert(Map,TileClass:new(50+i*100,50+j*100,50,50))
            
        end
    end
   
    
    Player = PlayerClass:new(0,0)
    Coin = CoinClass:new(125,125,15)
    table.insert(Map,Coin)
end

function love.update(dt)
    Player:Update(dt)
    Coin:Update()
    world:update(dt)
    

end





function love.draw()
   
    world:draw()
    for k,tile in pairs(Map) do 
        
        tile:Draw()
    end
    Player:Draw()
   

end

