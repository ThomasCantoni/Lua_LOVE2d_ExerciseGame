local Coin = {}
Coin.__index = Coin
text = " "

function Coin:new()
    
    setmetatable(self,Coin)
    return self
end

function Coin:NewPoint()
    col = math.random(1,5)
    row = math.random(1,5)
    
    self.desiredX = 125 + 100 * col 
    self.desiredY = 125  +100*row
end


function Coin:new(X,Y,radius)

    self = {}
    self.desiredX = X 
    self.desiredY = Y 
    self.X = X 
    self.Y = Y
    self.Color = {R=1,G=1,B=1}
    self.R = radius
    world:setCallbacks(function (a,b,c) self:beginContact(a,b,c) end,function (a,b,c) self:endContact(a,b,c) end)


    self.collider = world:newCircleCollider(X,Y,radius)
    self.collider:setUserData('coin')
    self.collider:setType("static")
    self.collider:setSensor(true)
    self.collider:setObject(self)

    setmetatable(self,Coin)
    return self
end
function Coin:beginContact(a,b,coll)
    
    
       
    if(a:getUserData() == "player"  and b:getUserData() == "coin")
    then 
        text = "COIN TOUCHED"
        Player:AddPoints(1)
        self.Color.B = 1
        self.Color.G = 1
        self:NewPoint()
    end
    
    
    
    
end
function Coin:endContact(a,b,coll)
    if(a:getUserData() == "player"  or b:getUserData() == "coin")
    then 
        self.Color.B = 0
        self.Color.G = 0
        text = " "
    end
end
function Coin:Update()
    self.collider:setPosition(self.desiredX,self.desiredY)

end

function Coin:Draw()
    love.graphics.print(text)
    love.graphics.setColor(self.Color.R,self.Color.G,self.Color.B)
    love.graphics.circle("fill",self.collider:getX(),self.collider:getY(),self.R)
   
end
return Coin