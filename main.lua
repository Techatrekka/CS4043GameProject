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

local Sprite = display.newImageRect ("Sprite1.png", 30, 100)
Sprite.x = display.contentCenterX
Sprite.y = display.contentHeight-200

local physics = require( "physics" )
physics.start()

physics.addBody( platform, "static" )
physics.addBody( Sprite, "dynamic", { radius=50, bounce=1.001 } )
