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
physics.addBody( Sprite, "dynamic" )

local function walkPerson(event)
  if (event.keyName == 'd' and event.phase == 'down') then
    Sprite.x = Sprite.x + 15
    return true
  end
  if (event.keyName == 'a' and event.phase == 'down') then
    Sprite.x = Sprite.x - 15
    return true
  end
  if(event.keyName == 'space') then
    Sprite:applyLinearImpulse(0, -.2)
  end
end

Runtime:addEventListener( "key", walkPerson )

local testObj = display.newRect( display.contentCenterX, display.contentCenterY, 20, 20 )
testObj.deltaPerFrame = { 0, 0 }

local function frameUpdate()
    testObj.x = testObj.x + testObj.deltaPerFrame[1]
    testObj.y = testObj.y + testObj.deltaPerFrame[2]
end
Runtime:addEventListener( "enterFrame", frameUpdate )

local function handleController( event )

    local touchOverButton = detectKey( event )

    if ( event.phase == "began" ) then

        if ( touchOverButton ~= nil ) then
            if not ( buttonGroup.touchID ) then
                -- Set/isolate this touch ID
                buttonGroup.keyID = event.id
                -- Set the active button
                buttonGroup.activeButton = touchOverButton
                -- Take proper action based on button ID
                if ( buttonGroup.activeButton.ID == "left" ) then
                    testObj.deltaPerFrame = { -2, 0 }
                elseif ( buttonGroup.activeButton.ID == "right" ) then
                    testObj.deltaPerFrame = { 2, 0 }
                end
            end
            return true
        end

    elseif ( event.phase == "moved" ) then
end
end
