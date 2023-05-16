
--default values
local Player = {}

Player.__index = Player

function Player:new()
    
    setmetatable(self,Player)
    return self
end

function Player:AddPoints(number)
self.points = self.points + number;
end

function Player:new(X,Y,spritePath)

    self = {}
    self.Speed = 1000
    self.X = X 
    self.Y = Y
    self.points = 0
    self.collider = world:newRectangleCollider(X,Y,30,30)
    self.collider:setType("dynamic")
    self.collider:setUserData('player')
    self.collider:setLinearDamping(5)
    self.collider:setMass(1)
    self.collider:setObject(self)


    setmetatable(self,Player)
    return self
end

function Player:Update(dt)
    if(love.keyboard.isDown("d"))
      then   self.collider:applyLinearImpulse(1 * self.Speed * dt,0)
      end
      if(love.keyboard.isDown("a"))
      then  self.collider:applyLinearImpulse(-1 * self.Speed * dt,0)
      end
      if(love.keyboard.isDown("w"))
      then  
       self.collider:applyLinearImpulse(0,-1 * self.Speed * dt)
      end
      if(love.keyboard.isDown("s"))
      then   self.collider:applyLinearImpulse(0,1 * self.Speed * dt)
      end
end
function Player:Draw()
    love.graphics.setColor(1,0,1)
    love.graphics.print("Points: "..self.points )
   
end
return Player