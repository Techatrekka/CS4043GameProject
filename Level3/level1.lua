-- coins and arrows remain on screen on level end/game over but fly off
-- boundaries aren't working in level1 or 2
-- sprite not reappearing after collision (but is in level 2)

local composer = require ("composer")
local scene = composer.newScene()

local physics = require( "physics" )
physics.start()
physics.setGravity(0, 50)

local lives = 3
local score = 0
local livesText, scoreText
local Sprite, Enemy
local died = false
local bg1, bg2, bg3, bg4
local gameLoopTimer
local platformTable = {}
local coinsTable = {}
--local circle
local platform, platform2, platform3, platform4
local moveSwitch = 1
local kaching, deathSound

-- Set Variables
_W = display.contentWidth; -- Get the width of the screen
_H = display.contentHeight; -- Get the height of the screen
scrollSpeed = 2; -- Set Scroll Speed of background

local function updateText()
    livesText.text = "Lives: " .. lives
    scoreText.text = "Score: " .. score
end

function update( event )
--updateBackgrounds will call a function made specifically to handle the background movement
updateBackgrounds()
updatePlatforms()
end

function updateBackgrounds()
--far background movement
bg1.x = bg1.x - scrollSpeed
bg2.x = bg2.x - scrollSpeed
bg3.x = bg3.x - scrollSpeed
bg4.x = bg4.x - scrollSpeed

-- Set up listeners so when backgrounds hits a certain point off the screen,
-- move the background to the right off screen

if (bg1.x <= -2000) then
  bg1.x = 1500
end
if (bg2.x <= -2000) then
  bg2.x = 1500
end
if (bg3.x <= -2000) then
  bg3.x = 1500
end
if (bg4.x <= -2000) then
  bg4.x = 1500
end
end

function updatePlatforms()
    platform.x = platform.x - scrollSpeed
    platform2.x = platform2.x - 3
    platform3.x = platform3.x - 4
    platform4.x = platform4.x - 2

    if(platform.x <= 0) then
        platform.x = display.contentWidth
    end
    if(platform2.x <= 0) then
        platform2.x = display.contentWidth
    end
    if(platform3.x <= 0) then
        platform3.x = display.contentWidth
    end
    if(platform4.x <= 0) then
        platform4.x = display.contentWidth
    end
end


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

                if ((event.keyName == 'space' or event.keyName == 'w' or event.keyName == 'up') and event.phase == 'down' ) then
                                space = 'down'
    w = 'down'
    up = 'down'
                else
                                space = 'up'
    w = 'up'
    up = 'up'
                end
end

local function death()
print(false)
died = true

end

local function walkPerson(event)
  if (d == 'down' or right == 'down') then
    Sprite:setLinearVelocity(200, 0)
  elseif (a == 'down' or left == 'down') then
    Sprite:setLinearVelocity(-200, 0)
  end
  if(space == 'down') then
    Sprite:applyLinearImpulse(0, -.2)
   end
if (Sprite.x >= display.contentWidth or Sprite.x <= 0) then
  print(Sprite.x)
    lives = lives - 1
    livesText.text = "Lives: " .. lives
    Sprite.x = 640
    Sprite.y = 360
end
end

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

--local function moveCircle()
--circle.x = display.contentWidth*1.2
--transition.to(circle, {time = 8000, x = -240, onComplete = moveCircle})
--end

local function createCoins()

    local newCoin = display.newImageRect( "Coin.png", 200, 150 )
    table.insert( coinsTable, newCoin )
    physics.addBody( newCoin, "static", { radius = 40 } )
    newCoin.myName = "Coin"

    local whereFrom = math.random( 1 )

    if ( whereFrom == 1 ) then
        -- From the right
        newCoin.x = display.contentWidth + 60
        newCoin.y = math.random( 500 )
      transition.to(newCoin, {time = 3500, x = -20})
    end
end

local function createPlatform()

    local newPlatform = display.newImageRect( "Level1/Platform.png", 100, 10 )
    table.insert( platformTable, newPlatform )
    physics.addBody( newPlatform, "static" )
    newPlatform.myName = "Platform"

    local whereFrom = math.random( 1 )

    if ( whereFrom == 1 ) then
        -- From the left
        newPlatform.x = display.contentWidth + 60
        newPlatform.y = math.random( 500 )
      transition.to(newPlatform, {time = 5500, x = 1380})
  end
end

local function gameLoop()

    createPlatform()
    createCoins()

    for i = #platformTable, 1, -1 do
        local thisPlatform = platformTable[i]

        if ( thisPlatform.x <= -10) or
             (thisPlatform.x > 1380)
        then
            display.remove( thisPlatform )
            table.remove( platformTable, i )
        end
    end
    for i = #coinsTable, 1, -1 do
        local thisCoin = coinsTable[i]

        if ( thisCoin.x <= -10) or
             (thisCoin.x > 1380)
        then
            display.remove( thisCoin )
            table.remove( coinsTable, i )
        end
    end

    if ( died == true ) then
      print(false)
      died = false
      lives = lives - 1 -- update lives
      livesText.text = "Lives: " .. lives
      if ( lives <= 2 ) then
        print("if")
        Runtime:removeEventListener( "key", movementKeys )
        Runtime:removeEventListener( "enterFrame", walkPerson )
        Runtime:removeEventListener( "enterFrame", enemyMovement)
        Runtime:removeEventListener( "collision", onCollision )
        Runtime:removeEventListener( "collision", onEnemyCollision )
        display.remove( scoreText )
        display.remove( livesText )
        timer.performWithDelay(3000, endGame)
    else
      print("else")
      Sprite.alpha = 0
      timer.performWithDelay( 1000, restoreSprite)
    end
  end
end
end

local function restoreSprite()
print(working)
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

local function endGame()
    composer.gotoScene("Menus.GameOver", { time = 800, effect = "crossFade"})
end

local function nextLevel()
    composer.gotoScene("Level2.Level2Cutscene", { time = 800, effect = "crossFade"})
end

local function onCollision( event )

        if ( event.phase == "began" ) then

            local obj1 = event.object1
            local obj2 = event.object2

            if (obj1.myName == "sprite" and obj2.myName == "Coin" ) then
              audio.play(kaching)
              display.remove(obj2)
              score = score + 200
             scoreText.text = "Score: " .. score
            end
            if (obj1.myName == "Coin" and obj2.myName == "sprite") then
            audio.play(kaching)
            score = score + 200
            scoreText.text = "Score: " .. score
            display.remove(obj1)
            end
              if( score == 1000) then
              Runtime:removeEventListener( "key", movementKeys )
              Runtime:removeEventListener( "enterFrame", walkPerson )
              Runtime:removeEventListener( "enterFrame", enemyMovement)
              Runtime:removeEventListener( "collision", onCollision )
              Runtime:removeEventListener( "collision", onEnemyCollision )
                    display.remove( scoreText )
                    display.remove( livesText )
                    timer.performWithDelay(1000, nextLevel)
              end
        end
end

local function onEnemyCollision( event )

        if ( event.phase == "began" ) then
            local obj1 = event.object1
            local obj2 = event.object2

            if (obj1.myName == "sprite" and obj2.myName == "Enemy" ) or
            (obj1.myName == "Enemy" and obj2.myName == "sprite") then
                death()
            end
            if (obj1.myName == "sprite" and obj2.myName == "Arrow" ) then
                display.remove(obj2)
                audio.play(deathSound)
                death()
            end
            if (obj1.myName == "Arrow" and obj2.myName == "sprite") then
              display.remove(obj1)
              audio.play(deathSound)
              death()
        end
    end
end

function scene:create(event)
    local screenGroup = self.view
    physics.pause()
    local topWall = display.newRect( 500, -2, 2000, 5 )
    physics.addBody(topWall, "static", {bounce = 0.1})
      -- Add First Background
      bg1 = display.newImageRect("Level1/Background1.png", 2500, 1080)
      bg1.x = _W*0.5; bg1.y = _H/2;
      screenGroup:insert(bg1)

      -- Add Second Background
      bg2 = display.newImageRect("Level1/Background1.png", 2500, 1080)
      bg2.x = bg1.x + 2500; bg2.y =_H/2;
      screenGroup:insert(bg2)

      -- Add Third Background
      bg3 = display.newImageRect("Level1/Background1.png", 2500, 1080)
      bg3.x = bg2.x + 2500; bg3.y = _H/2;
      screenGroup:insert(bg3)

      bg4 = display.newImageRect("Level1/Background1.png", 2500, 1080)
      bg4.x = bg3.x + 2500; bg4.y = _H/2;
      screenGroup:insert(bg4)

      platform = display.newImageRect( "Level1/Platform.png", 2500, 5 )
      platform.x = display.contentCenterX
      platform.y = display.contentHeight
      screenGroup:insert(platform)

      platform2 = display.newImageRect( "Level1/Platform.png", 75, 10 )
      platform2.x = display.contentCenterX+300
      platform2.y = display.contentHeight-200
      screenGroup:insert(platform2)

      platform3 = display.newImageRect( "Level1/Platform.png", 90, 10 )
      platform3.x = display.contentCenterX-200
      platform3.y = display.contentHeight-150
      screenGroup:insert(platform3)

      platform4 = display.newImageRect( "Level1/Platform.png", 100, 10 )
      platform4.x = display.contentCenterX+450
      platform4.y = display.contentHeight-220
      screenGroup:insert(platform4)

      physics.addBody( platform, "static" )
      physics.addBody( platform2, "static" )
      physics.addBody( platform3, "static" )
      physics.addBody( platform4, "static" )

      -- Display lives and score
      livesText = display.newText("Lives: " .. lives, 200, 100, native.systemFont, 36 )
      livesText:setFillColor( 0, 1, 0 )
      scoreText = display.newText("Score: " .. score, 400, 100, native.systemFont, 36 )
      scoreText:setFillColor( 0, 1, 0 )

      Sprite = display.newImageRect ("Level1/LepreseanSprite1.png", 75, 100)
      screenGroup:insert(Sprite)
      Sprite.x = display.contentCenterX-200
      Sprite.y = display.contentHeight-200
      physics.addBody( Sprite, "dynamic", {friction = 1.0, bounce = 0.0 } )
      Sprite.isFixedRotation = true
      Sprite.myName = "sprite"

      Enemy = display.newImageRect ("Level1/Enemy.png", 30, 50)
      screenGroup:insert(Enemy)
      Enemy.x = display.contentCenterX
      Enemy.y = display.contentHeight-100
      physics.addBody( Enemy, "dynamic", {bounce = 0})
      Enemy.isFixedRotation = true
      Enemy.myName = "Enemy"

      circle = display.newCircle(0,20, 50)
      circle.x = display.contentWidth*1.2
      circle.y = 200
      circle.myName = "circle"
      physics.addBody(circle, "static", {bounce = 0.1})

      updateTimer = timer.performWithDelay(1, update, -1)
      Runtime:addEventListener( "key", movementKeys )
      Runtime:addEventListener( "enterFrame", walkPerson )
      Runtime:addEventListener( "enterFrame", enemyMovement)
      timer.performWithDelay(3000, movementSwitch, 100)
      Runtime:addEventListener( "collision", onEnemyCollision )
      Runtime:addEventListener( "collision", onCollision )

      kaching = audio.loadSound("Audio/kaching.wav")
      deathSound = audio.loadSound("Audio/death.wav")
end

function scene:show( event )
    local sceneGroup = self.view
    local phase = event.phase

    if (phase == "will") then

    elseif (phase == "did") then
      physics.start()
      gameLoopTimer = timer.performWithDelay( 1500, gameLoop, 0 )
    --  moveCircle()
    end
end

-- hide()
function scene:hide( event )

    local sceneGroup = self.view
    local phase = event.phase

    if ( phase == "will" ) then
        -- Code here runs when the scene is on screen (but is about to go off screen)
        timer.cancel( gameLoopTimer )
        timer.cancel( updateTimer )
    elseif ( phase == "did" ) then
        -- Code here runs immediately after the scene goes entirely off screen
        Runtime:removeEventListener( "key", movementKeys )
        Runtime:removeEventListener( "enterFrame", walkPerson )
        Runtime:removeEventListener( "enterFrame", enemyMovement)
        Runtime:removeEventListener( "collision", onCollision )
        Runtime:removeEventListener( "collision", onEnemyCollision )
        physics.pause()
        audio.stop( 1 )
        composer.removeScene("Level1")
    end
end

-- destroy()
function scene:destroy( event )

                local sceneGroup = self.view
                -- Code here runs prior to the removal of scene's view
    audio.dispose(kaching)
    audio.dispose(deathSound)
    audio.remove(backgroundMusic1)
end


-- -----------------------------------------------------------------------------------
-- Scene event function listeners
-- -----------------------------------------------------------------------------------
scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )
scene:addEventListener( "destroy", scene )
-- -----------------------------------------------------------------------------------

return scene
