
--composer version of Level2

local composer = require( "composer" )
 
local scene = composer.newScene()

local physics = require( "physics" )
physics.start()

local ground
local tree
local tree2
local tree3
local tree4
local bird
local bg1
local bg2
local bg3
local lives = 3
local died = false
local livesText
local scoreText 
local updateTimer
scrollSpeed = 1

function update( event )
    updateObjects()
end

function updateObjects()
--Updates IngameObstacles
    print(ground.x)
    ground.x = ground.x - scrollSpeed
    tree.x = tree.x - scrollSpeed
    tree2.x = tree2.x - scrollSpeed
    tree3.x = tree3.x - scrollSpeed
    tree4.x = tree4.x - scrollSpeed

  if (ground.x < -600) then
    ground.x = 1280
    tree.x = 1400
    end
end

local function BirdFlight( event )    
    bird:applyLinearImpulse(0, -.1)
end

 -- Set Scroll Speed of background    

-- create()
function scene:create( event )
 
    local sceneGroup = self.view
    physics.pause()
    
    ground = display.newImageRect("Level2BackGround.png", 3840, 70)
    ground.y = display.contentCenterY+360;
    ground.x = display.contentCenterX+1280;
    sceneGroup:insert(ground)
    print(ground.x)
   -- ground.myName = "ground"
    
    tree = display.newImageRect("GameTree.png", 216, 324)
    tree.x = display.contentCenterX-250
    tree.y = display.contentCenterY+164
    sceneGroup:insert(tree)
    tree.myName = "tree"

    tree2 = display.newImageRect("GameTree.png", 216, 324)
    tree2.x = display.contentCenterX+400
    tree2.y = display.contentCenterY+164
    sceneGroup:insert(tree2)
    tree2.myName = "tree2"

    tree3 = display.newImageRect("GameTree.png", 216, 324)
    tree3.x = display.contentCenterX+1000
    tree3.y = display.contentCenterY+164
    sceneGroup:insert(tree3)

    tree4 = display.newImageRect("GameTree.png", 216, 324)
    tree4.x = display.contentCenterX+1500
    tree4.y = display.contentCenterY+164
    sceneGroup:insert(tree4)

    bird = display.newImageRect("GameBird.png", 50, 55 )
    bird.x = display.contentCenterX-550
    bird.y = display.contentCenterY
    sceneGroup:insert(bird)
    bird.myName = "bird"

    physics.addBody(ground, "static")
    physics.addBody(bird, "dynamic", {friction = 1.0})
    bird.isFixedRotation = true
    
end
 
-- show()
function scene:show( event )
 
    local sceneGroup = self.view
    local phase = event.phase
 
    if ( phase == "will" ) then
        -- Code here runs when the scene is still off screen (but is about to come on screen)
            physics.start()

    elseif ( phase == "did" ) then
        -- Code here runs when the scene is entirely on screen
        --Runtime:addEventListener("collision", onCollision)
        updateTimer = timer.performWithDelay(1, update, -1)
        --Runtime:addEventListener("tap", BirdFlight)
        
    end
end
 
 
-- hide()
function scene:hide( event )
 
    local sceneGroup = self.view
    local phase = event.phase
 
    if ( phase == "will" ) then
        -- Code here runs when the scene is on screen (but is about to go off screen)
 
    elseif ( phase == "did" ) then
        -- Code here runs immediately after the scene goes entirely off screen
    physics.pause()
    composer.removeScene("Level2Composer")
    end
end
 
 
-- destroy()
function scene:destroy( event )
 
    local sceneGroup = self.view
    -- Code here runs prior to the removal of scene's view
    
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
