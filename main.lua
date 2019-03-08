-----------------------------------------------------------------------------------------
--
-- main.lua
--
-----------------------------------------------------------------------------------------
-- Your code here
local background = display.newImageRect( "Backgroud.png", 1280, 720 )
background.x = display.contentCenterX
background.y = display.contentCenterY

local platform = display.newImageRect( "platform.png", 100, 50 )
platform.x = display.contentCenterX
platform.y = display.contentHeight-100

local platform2 = display.newImageRect( "platform.png", 100, 50 )
platform2.x = display.contentCenterX+300
platform2.y = display.contentHeight-100

local platform3 = display.newImageRect( "platform.png", 100, 50 )
platform3.x = display.contentCenterX-200
platform3.y = display.contentHeight-100

local platform4 = display.newImageRect( "platform.png", 100, 50 )
platform4.x = display.contentCenterX+450
platform4.y = display.contentHeight-100


local Sprite = display.newImageRect ("Sprite1.png", 30, 100)
Sprite.x = display.contentCenterX
Sprite.y = display.contentHeight-200

local physics = require( "physics" )
physics.start()
physics.setGravity(0, 50)

physics.addBody( platform, "static" )
physics.addBody( platform2, "static" )
physics.addBody( platform3, "static" )
physics.addBody( platform4, "static" )
physics.addBody( Sprite, "dynamic", {friction = 1.0} )

Sprite.isFixedRotation = true

local function walkPerson(event)
  if (event.keyName == 'd' and event.phase == 'down') then
    while ((event.keyName == 'd' and event.phase == 'down') == true) do
    Sprite:setLinearVelocity(200,0)
    return true
    end
  end
  if (event.keyName == 'a' and event.phase == 'down') then
    Sprite:setLinearVelocity(-200, 0)
    return true
  end
  if(event.keyName == 'space') then
    Sprite:applyLinearImpulse(0, -.25)
  end
end

Runtime:addEventListener( "key", walkPerson )
