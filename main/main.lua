
function love.load()
    World = love.physics.newWorld(0,100,true)
    Floor = {}
    Floor.body = love.physics.newBody(World,0, love.graphics.getHeight(),"static")
    Floor.shape = love.physics.newRectangleShape(6500, 50)
    Floor.fixture = love.physics.newFixture(Floor.body,Floor.shape,2)

    Player={}
    Player.body= love.physics.newBody(World,50,love.graphics.getHeight(),"dynamic")
    Player.body:setMass(50)
    Player.shape= love.physics.newCircleShape(47)
    Player.fixture= love.physics.newFixture(Player.body,Player.shape)

end
function love.keypressed(key)
    if key == "escape" then
       love.event.quit()
    elseif key=="space" then
        x, y = Player.body:getLinearVelocity( )

        print(x,y)
        if y==0 then
            Player.body:applyLinearImpulse(0, -600)
            
        end
    end
 end



function love.update(dt)
    World:update(dt)
end
function love.draw()
    love.graphics.setColor(0.28, 0.63, 0.05)
    love.graphics.polygon("fill", Floor.body:getWorldPoints(Floor.shape:getPoints()))
  
    love.graphics.setColor(0.76, 0.18, 0.05)
    love.graphics.circle("fill", Player.body:getX(),Player.body:getY(), Player.shape:getRadius())
  
   
end
