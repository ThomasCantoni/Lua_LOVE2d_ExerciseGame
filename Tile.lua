local Tile = {}
Tile.__index = Tile

function Tile:new()
    self = {}
    self.Color = { R=1,G=1,B=1}
    setmetatable(self,Tile)
    return self
end



function Tile:SetColor(R,G,B)
self.Color.R = R 
self.Color.G = G
self.Color.B = B 

end

function Tile:new(X,Y,W,H)
    self = {}
    self.Color = { R=1,G=1,B=1}
    self.X = X 
    self.Y = Y
    self.W = W
    self.H = H
    self.collider = world:newRectangleCollider(X,Y,W,H)
    self.collider:setType("static")
    setmetatable(self,Tile)
    return self
end


function Tile:Draw()
    love.graphics.setColor(self.Color.R,self.Color.G,self.Color.B)
    love.graphics.rectangle("fill",self.X,self.Y,self.W,self.H)
end
return Tile