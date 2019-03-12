-----------------------------------------------------------------------------------------
--
-- main.lua
--
-----------------------------------------------------------------------------------------
-- Your code here
--local background = display.newImageRect( "Background.png", 1280, 720 )
--background.x = display.contentCenterX
--background.y = display.contentCenterY

-- Set Variables
_W = display.contentWidth; -- Get the width of the screen
_H = display.contentHeight; -- Get the height of the screen
scrollSpeed = 2; -- Set Scroll Speed of background

-- Add First Background
local bg1 = display.newImageRect("background-with-clouds.jpg", 1300, 1080)
bg1.x = _W*0.5; bg1.y = _H/2;

-- Add Second Background
local bg2 = display.newImageRect("background-with-clouds.jpg", 1300, 1080)
bg2.x = bg1.x + 1000; bg2.y =_H/2;

-- Add Third Background
local bg3 = display.newImageRect("background-with-clouds.jpg", 1300, 1080)
bg3.x = bg2.x + 1000; bg3.y = _H/2;

--local function move(event)
-- move backgrounds to the left by scrollSpeed, default is 2

local function update( event )
--updateBackgrounds will call a function made specifically to handle the background movement
updateBackgrounds()
end

function updateBackgrounds()
--far background movement
bg1.x = bg1.x - scrollSpeed
bg2.x = bg2.x - scrollSpeed
bg3.x = bg3.x - scrollSpeed

-- Set up listeners so when backgrounds hits a certain point off the screen,
-- move the background to the right off screen
-- there is some clipping at the moment, need to find the right numbers
-- will be easier when we have our own backgrounds

  if (bg1.x < -370) then
    bg1.x = 1300
  end
  if (bg2.x < -370) then
    bg2.x = 1300
  end
  if (bg3.x < -370) then
    bg3.x = 1300
  end
end

timer.performWithDelay(1, update, -1)

-- Create a runtime event to move backgrounds
--Replaced with timer above, seems more effective
--Runtime:addEventListener( "enterFrame", move )

local platform = display.newImageRect( "Platform.png", 1500, 10 )
platform.x = display.contentCenterX
platform.y = display.contentHeight-50

local platform2 = display.newImageRect( "Platform.png", 100, 10 )
platform2.x = display.contentCenterX+300
platform2.y = display.contentHeight-100

local platform3 = display.newImageRect( "Platform.png", 100, 10 )
platform3.x = display.contentCenterX-200
platform3.y = display.contentHeight-100

local platform4 = display.newImageRect( "Platform.png", 100, 10 )
platform4.x = display.contentCenterX+450
platform4.y = display.contentHeight-100

local Sprite = display.newImageRect ("Sprite1.png", 30, 100)
Sprite.x = display.contentWidth-200
Sprite.y = display.contentHeight-200

local Enemy = display.newImageRect ("Enemy.png", 30, 50)
Enemy.x = display.contentCenterX
Enemy.y = display.contentHeight-100

local physics = require( "physics" )
physics.start()
physics.setGravity(0, 50)

physics.addBody( platform, "static" )
physics.addBody( platform2, "static" )
physics.addBody( platform3, "static" )
physics.addBody( platform4, "static" )

physics.addBody( Sprite, "dynamic", {friction = 1.0, bounce = 0.0 } )
physics.addBody( Enemy, "dynamic", {bounce = 0})

Sprite.isFixedRotation = true
Enemy.isFixedRotation = true

local moveSwitch = 1

local function movementSwitch( event )
	if (moveSwitch == 1) then
		moveSwitch = 2
	else
		moveSwitch = 1
	end
end

local function enemyMovement(event)
	if (moveSwitch == 1) then
		Enemy.x = Enemy.x - 1
	else
		Enemy.x = Enemy.x + 1
	end
end

Runtime:addEventListener( "enterFrame", enemyMovement)
timer.performWithDelay(3000, movementSwitch, 100)

local d = 'up'
local a = 'up'
local space = 'up'
local right = 'up'
local left = 'up'

local function movementKeys( event )
	if ((event.keyName == 'd' or event.keyName == 'right') and event.phase == 'down' ) then
		d = 'down'
		right = 'down'
	else
		d = 'up'
		right = 'up'
	end
	if ((event.keyName == 'a' or event.keyName == 'left') and event.phase == 'down' ) then
		a = 'down'
		left = 'down'
	else
		a = 'up'
		left = 'up'
	end
	if (event.keyName == 'space' and event.phase == 'down' ) then
		space = 'down'
	else
		space = 'up'
	end
end

local function walkPerson(event)
  if (d == 'down' or right == 'down') then
    Sprite:setLinearVelocity(200, 0)
  elseif (a == 'down' or left == 'down') then
    Sprite:setLinearVelocity(-200, 0)
  end
  if(space == 'down') then
    Sprite:applyLinearImpulse(0, -.1)
   end
end

Runtime:addEventListener( "key", movementKeys )
Runtime:addEventListener( "enterFrame", walkPerson )

local lives = 3
local score = 0
local livesText
local scoreText

-- Display lives and score
livesText = display.newText("Lives: " .. lives, 200, 100, native.systemFont, 36 )
scoreText = display.newText("Score: " .. score, 400, 100, native.systemFont, 36 )

-- local function updateText()
    livesText.text = "Lives: " .. lives
    scoreText.text = "Score: " .. score
-- end

--Create global screen boundaries
local topWall = display.newRect( 500, -2, 2000, 5 )
local leftWall = display.newRect(0, 300, 2, display.contentHeight + 250)
local rightWall = display.newRect (display.contentWidth, 300, 2, display.contentHeight + 250)
local bottomWall = display.newRect(500, display.contentHeight, 2000, 5)

physics.addBody(leftWall, "static", {bounce = 0.1})
physics.addBody(rightWall, "static", {bounce = 0.1})
physics.addBody(topWall, "static", {bounce = 0.1})
physics.addBody(bottomWall, "static", {bounce = 0.1})

-- create circle, can replace with arrows later, for collisions
local circle = display.newCircle(0,20, 50)
circle.x = display.contentWidth*1.2
circle.y = 200

local function moveCircle()
circle.x = display.contentWidth*1.2
transition.to(circle, {time = 8000, x = -240, onComplete = moveCircle})
end

physics.addBody(circle, "static", {bounce = 0.1})
moveCircle()

local died = false
circle.myName = "circle"
Sprite.myName = 'Sprite'
Enemy.myName = 'Enemy'

local function restoreSprite()

    Sprite.isBodyActive = false
    Sprite.x = display.contentCenterX
    Sprite.y = display.contentHeight - 200

    -- Fade in the Sprite
    transition.to( Sprite, { alpha=1, time=4000,
        onComplete = function()
            Sprite.isBodyActive = true
            died = false
        end
    } )
end

local function onCollision( event )

        if ( event.phase == "began" ) then

            local obj1 = event.object1
            local obj2 = event.object2

            if (obj1.myName == "Sprite" and obj2.myName == "circle" ) then
              if ( died == false ) then
                died = true
                lives = lives - 1 -- update lives
                livesText.text = "Lives: " .. lives

            if ( lives == 0 ) then
                    display.remove( Sprite )
                    -- need game over screen here, otherwise if
                    -- you click a button, there's an error
                else
                    Sprite.alpha = 0
                    timer.performWithDelay( 1000, restoreSprite )
                end
            end
         end
         end
         end

local function onEnemyCollision( event )

        if ( event.phase == "began" ) then

            local obj1 = event.object1
            local obj2 = event.object2

            if (obj1.myName == "Sprite" and obj2.myName == "Enemy" ) then
              if ( died == false ) then
                died = true
                lives = lives - 1 -- update lives
                livesText.text = "Lives: " .. lives

            if ( lives == 0 ) then
                    display.remove( Sprite )
                    -- need game over screen here, otherwise if
                    -- you click a button, there's an error
                else
                    Sprite.alpha = 0
                    timer.performWithDelay( 1000, restoreSprite )
                end
            end
         end
         end
         end
Runtime:addEventListener( "collision", onCollision )
Runtime:addEventListener( "collision", onEnemyCollision )
