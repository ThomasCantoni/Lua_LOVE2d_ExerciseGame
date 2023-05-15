
TileClass = require("Tile")
PlayerClass = require("Player")
Map = {}

function love.load()
   world = love.physics.newWorld(0, 0, true)
   for i=0,5 do
        for j=0,4 do
        table.insert(Map,TileClass:new(40+i*125,40+j*125,50,50))
        end
   end
    PlayerTest = PlayerClass:new()
end

function love.update(dt)
world:update(dt)
  PlayerTest:Update(dt)

end







function love.draw()
    
    for k,tile in pairs(Map) do 
        tile:Draw()
    end
    PlayerTest:Draw()
   

end

