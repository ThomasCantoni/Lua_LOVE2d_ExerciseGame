
--default values
local Player = {
Speed=150,
X = 0,
Y = 0,
W = 50,
H = 50,
Sprite = {}
}
Player.__index = Player

function Player:new()
    
    setmetatable(self,Player)
    return self
end



function Player:new(X,Y,spritePath)

    self = {}
    self.X = X 
    self.Y = Y
    self.body = love.physics.newBody(world,X,Y,"dynamic")
    
    setmetatable(self,Player)
    return self
end

function Player:Update(dt)
    if(love.keyboard.isDown("d"))
      then  self.body:applyForce(1000*self.Speed*dt,0)
      end
      if(love.keyboard.isDown("a"))
      then  self.X =self.X- self.Speed * dt
      end
      if(love.keyboard.isDown("w"))
      then  self.Y =self.Y- self.Speed * dt
      end
      if(love.keyboard.isDown("s"))
      then  self.Y =self.Y+ self.Speed * dt
      end
end
function Player:Draw()
    love.graphics.setColor(1,0,1)
    love.graphics.rectangle("fill",self.X,self.Y,30,30)
   
end
return Player