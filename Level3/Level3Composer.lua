
--Level 3

local composer = require( "composer" )
 
local scene = composer.newScene()
 
-- -----------------------------------------------------------------------------------
-- Code outside of the scene event functions below will only be executed ONCE unless
-- the scene is removed entirely (not recycled) via "composer.removeScene()"
-- -----------------------------------------------------------------------------------
local physics = require( "physics" )
physics.start()
physics.setGravity(0, 0)

local Doggo
local background
local Path1
local Path2
local Path3
local drag_direction
local bounds
local Path4
local Path5
local redZone, redZone1, redZone2, redZone3, redZone4
local GreenZone
local time = 1000000
local timeText
local StartingPosition, StartingPosition1
local Start = "begin"
local Objective
local d = 'up'
local a = 'up'
local s = 'up'
local w = 'up'
local up = 'up'
local down = 'up'
local space = 'up'
local right = 'up'
local left = 'up'
local d1 = 'up'
local a1 = 'up'
local s1 = 'up'
local w1 = 'up'
local up1 = 'up'
local down1 = 'up'
local space1 = 'up'
local right1 = 'up'
local left1 = 'up'
local terence


local function endLevel()
    composer.removeScene("Level3Composer")
    composer.gotoScene("Menu", { time = 800, effect = "crossFade"})
end

--Function that moves the map
local function moveTilesUp()
    background.y = background.y + 10
    Path1.y = Path1.y + 10
    Path2.y = Path2.y + 10
    Path3.y = Path3.y + 10
    Path4.y = Path4.y + 10
    Path5.y = Path5.y + 10
    Path6.y = Path6.y + 10
    Path7.y = Path7.y + 10
    Path8.y = Path8.y + 10
    redZone.y = redZone.y + 10
    redZone1.y = redZone1.y + 10
    redZone2.y = redZone2.y + 10
    redZone3.y = redZone3.y + 10
    redZone4.y = redZone4.y + 10
    GreenZone.y = GreenZone.y + 10
    StartingPosition.y = StartingPosition.y + 10
    StartingPosition1.y = StartingPosition1.y + 10
    Objective.y = Objective.y + 10
end

--Function that moves the map
local function moveTilesDown()
    background.y = background.y - 10
    Path1.y = Path1.y - 10
    Path2.y = Path2.y - 10
    Path3.y = Path3.y - 10
    Path4.y = Path4.y - 10
    Path5.y = Path5.y - 10
    Path6.y = Path6.y - 10
    Path7.y = Path7.y - 10
    Path8.y = Path8.y - 10
    redZone.y = redZone.y - 10
    redZone1.y = redZone1.y - 10
    redZone2.y = redZone2.y - 10
    redZone3.y = redZone3.y - 10
    redZone4.y = redZone4.y - 10
    GreenZone.y = GreenZone.y - 10
    StartingPosition.y = StartingPosition.y - 10
    StartingPosition1.y = StartingPosition1.y - 10
    Objective.y = Objective.y - 10
end

--Function that moves the map
local function moveTilesLeft()
    background.x = background.x - 10
    Path1.x = Path1.x - 10
    Path2.x = Path2.x - 10
    Path3.x = Path3.x - 10
    Path4.x = Path4.x - 10
    Path5.x = Path5.x - 10
    Path6.x = Path6.x - 10
    Path7.x = Path7.x - 10
    Path8.x = Path8.x - 10
    redZone.x = redZone.x - 10
    redZone1.x = redZone1.x - 10
    redZone2.x = redZone2.x - 10
    redZone3.x = redZone3.x - 10
    redZone4.x = redZone4.x - 10
    GreenZone.x = GreenZone.x - 10
    StartingPosition.x = StartingPosition.x - 10
    StartingPosition1.x = StartingPosition1.x - 10
    Objective.x = Objective.x - 10
end

--Function that moves the map
local function moveTilesRight()
    background.x = background.x + 10
    Path1.x = Path1.x + 10
    Path2.x = Path2.x + 10
    Path3.x = Path3.x + 10
    Path4.x = Path4.x + 10
    Path5.x = Path5.x + 10
    Path6.x = Path6.x + 10
    Path7.x = Path7.x + 10
    Path8.x = Path8.x + 10
    redZone.x = redZone.x + 10
    redZone1.x = redZone1.x + 10
    redZone2.x = redZone2.x + 10
    redZone3.x = redZone3.x + 10
    redZone4.x = redZone4.x + 10
    GreenZone.x = GreenZone.x + 10
    StartingPosition.x = StartingPosition.x + 10
    StartingPosition1.x = StartingPosition1.x + 10
    Objective.x = Objective.x + 10
end

--dragging function to move doggo into red zone
local function moveTilesUpAgainst()
    background.y = background.y + 1
    Path1.y = Path1.y + 1
    Path2.y = Path2.y + 1
    Path3.y = Path3.y + 1
    Path4.y = Path4.y + 1
    Path5.y = Path5.y + 1
    Path6.y = Path6.y + 1
    Path7.y = Path7.y + 1
    Path8.y = Path8.y + 1
    redZone.y = redZone.y + 1
    redZone1.y = redZone1.y + 1
    redZone2.y = redZone2.y + 1
    redZone3.y = redZone3.y + 1
    redZone4.y = redZone4.y + 1
    GreenZone.y = GreenZone.y + 1
    StartingPosition.y = StartingPosition.y + 1
    StartingPosition1.y = StartingPosition1.y + 1
    Objective.y = Objective.y + 1
end

--dragging function to move doggo into red zone
local function moveTilesDownAgainst()
    background.y = background.y - 1
    Path1.y = Path1.y - 1
    Path2.y = Path2.y - 1
    Path3.y = Path3.y - 1
    Path4.y = Path4.y - 1
    Path5.y = Path5.y - 1
    Path6.y = Path6.y - 1
    Path7.y = Path7.y - 1
    Path8.y = Path8.y - 1
    redZone.y = redZone.y - 1
    redZone1.y = redZone1.y - 1
    redZone2.y = redZone2.y - 1
    redZone3.y = redZone3.y - 1
    redZone4.y = redZone4.y - 1
    GreenZone.y = GreenZone.y - 1
    StartingPosition.y = StartingPosition.y - 1
    StartingPosition1.y = StartingPosition1.y - 1
    Objective.y = Objective.y - 1
end

--dragging function to move doggo into red zone
local function moveTilesLeftAgainst()
    background.x = background.x - 1
    Path1.x = Path1.x - 1
    Path2.x = Path2.x - 1
    Path3.x = Path3.x - 1
    Path4.x = Path4.x - 1
    Path5.x = Path5.x - 1
    Path6.x = Path6.x - 1
    Path7.x = Path7.x - 1
    Path8.x = Path8.x - 1
    redZone.x = redZone.x - 1
    redZone1.x = redZone1.x - 1
    redZone2.x = redZone2.x - 1
    redZone3.x = redZone3.x - 1
    redZone4.x = redZone4.x - 1
    GreenZone.x = GreenZone.x - 1
    StartingPosition.x = StartingPosition.x - 1
    StartingPosition1.x = StartingPosition1.x - 1
    Objective.x = Objective.x - 1
end

--dragging function to move doggo into red zone
local function moveTilesRightAgainst()
    background.x = background.x + 1
    Path1.x = Path1.x + 1
    Path2.x = Path2.x + 1
    Path3.x = Path3.x + 1
    Path4.x = Path4.x + 1
    Path5.x = Path5.x + 1
    Path6.x = Path6.x + 1
    Path7.x = Path7.x + 1
    Path8.x = Path8.x + 1
    redZone.x = redZone.x + 1
    redZone1.x = redZone1.x + 1
    redZone2.x = redZone2.x + 1
    redZone3.x = redZone3.x + 1
    redZone4.x = redZone4.x + 1
    GreenZone.x = GreenZone.x + 1
    StartingPosition.x = StartingPosition.x + 1
    StartingPosition1.x = StartingPosition1.x + 1
    Objective.x = Objective.x + 1
end

--function that checks if the dog is touching the red zone
local function onredZoneCollision(obj1, obj2)

    local con1 = obj1.contentBounds.xMin <= obj2.contentBounds.xMin and obj1.contentBounds.xMax >= obj2.contentBounds.xMin
    local con2 = obj1.contentBounds.xMin >= obj2.contentBounds.xMin and obj1.contentBounds.xMin <= obj2.contentBounds.xMax
    local con3 = obj1.contentBounds.yMin <= obj2.contentBounds.yMin and obj1.contentBounds.yMax >= obj2.contentBounds.yMin
    local con4 = obj1.contentBounds.yMin >= obj2.contentBounds.yMin and obj1.contentBounds.yMin <= obj2.contentBounds.yMax

    if ((con1 and con2) or (con1 and con4) or (con2 and con3) or (con4 and con2)) then
        return true
    end
end

local function onGreenZoneCollision( event )

        if ( event.phase == "began" ) then

            local obj1 = event.object1
            local obj2 = event.object2

            if (obj1.myName == "Doggo" and obj2.myName == "GreenZone" ) then
              
        end
    end
end

--function which checks to see if the dog touches the objective
local function onObjectiveCollision( obj1, obj2 )

    local con1 = obj1.contentBounds.xMin <= obj2.contentBounds.xMin and obj1.contentBounds.xMax >= obj2.contentBounds.xMin
    local con2 = obj1.contentBounds.xMin >= obj2.contentBounds.xMin and obj1.contentBounds.xMin <= obj2.contentBounds.xMax
    local con3 = obj1.contentBounds.yMin <= obj2.contentBounds.yMin and obj1.contentBounds.yMax >= obj2.contentBounds.yMin
    local con4 = obj1.contentBounds.yMin >= obj2.contentBounds.yMin and obj1.contentBounds.yMin <= obj2.contentBounds.yMax

    if ((con1 and con3) or (con1 and con4) or (con2 and con4) or (con2 and con3)) then
        return true
    end
end

--Function that checks if the dog is touching the path
local function onPathCollision( obj1, obj2 )

    local con1 = obj1.contentBounds.xMin <= obj2.contentBounds.xMin and obj1.contentBounds.xMax >= obj2.contentBounds.xMin
    local con2 = obj1.contentBounds.xMin >= obj2.contentBounds.xMin and obj1.contentBounds.xMin <= obj2.contentBounds.xMax
    local con3 = obj1.contentBounds.yMin <= obj2.contentBounds.yMin and obj1.contentBounds.yMax >= obj2.contentBounds.yMin
    local con4 = obj1.contentBounds.yMin >= obj2.contentBounds.yMin and obj1.contentBounds.yMin <= obj2.contentBounds.yMax

    if ((con1 and con2) or (con1 and con4) or (con2 and con3) or (con4 and con2) or (con3 and con4) or (con1 and con2)) then
        return true
    end
end

local function onStartCollision( obj1, obj2 )

    local con1 = obj1.contentBounds.xMin <= obj2.contentBounds.xMin and obj1.contentBounds.xMax >= obj2.contentBounds.xMin
    local con2 = obj1.contentBounds.xMin >= obj2.contentBounds.xMin and obj1.contentBounds.xMin <= obj2.contentBounds.xMax
    local con3 = obj1.contentBounds.yMin <= obj2.contentBounds.yMin and obj1.contentBounds.yMax >= obj2.contentBounds.yMin
    local con4 = obj1.contentBounds.yMin >= obj2.contentBounds.yMin and obj1.contentBounds.yMin <= obj2.contentBounds.yMax

    if ((con1 and con2) or (con1 and con4) or (con2 and con3) or (con4 and con2) or (con3 and con4) or (con1 and con2)) then
        Start = "done"
    end
end

local function gameLoopSecond( event )
   time = time - 1
end
--[[
local function start()
    if (Start == "begin") then
        Path1.isVisible = false
        Path2.isVisible = false
        Path3.isVisible = false
        Path4.isVisible = false
        Path5.isVisible = false
        redZone.isVisible = false
        redZone1.isVisible = false
        redZone2.isVisible = false
        redZone3.isVisible = false
        redZone4.isVisible = false
        GreenZone.isVisible = false
        StartingPosition.isVisible = true
        print("working")
    elseif (onPathCollision(Doggo, StartingPosition)) then
        print("done")
        timer = 400
        Path1.isVisible = true
        Path2.isVisible = true
        Path3.isVisible = true
        Path4.isVisible = true
        Path5.isVisible = true
        redZone.isVisible = true
        redZone1.isVisible = true
        redZone2.isVisible = true
        redZone3.isVisible = true
        redZone4.isVisible = true
        GreenZone.isVisible = true
        StartingPosition.isVisible = false
    end
end
]]--

--function that checks all game variables
local function gameLoop( event )

    --start()
    if time == 0 then

    end

    if (onObjectiveCollision( Doggo, Objective) == true) then
        endLevel()
    end

    timeText.text = "Time left: " .. time

    if onredZoneCollision( Doggo, redZone) then
        time = time - 1
    end

    if onredZoneCollision( Doggo, redZone1) then
        time = time - 1
    end

    if onredZoneCollision( Doggo, redZone2) then
        time = time - 1
    end

    if onredZoneCollision( Doggo, redZone3) then
        time = time - 1
    end

    if onredZoneCollision( Doggo, redZone4) then
        time = time - 1
    end

    if onPathCollision( Doggo, Path1 ) then
        Path1.isVisible = true
    elseif onPathCollision( Doggo, Path3) then
        Path3.isVisible = true
    elseif onPathCollision( Doggo, Path2) then
        Path2.isVisible = true
    elseif onPathCollision( Doggo, Path4) then
        Path4.isVisible = true
    elseif onPathCollision( Doggo, Path5) then
        Path5.isVisible = true
    elseif onPathCollision( Doggo, Path6) then
        Path6.isVisible = true
    elseif onPathCollision( Doggo, Path7) then
        Path7.isVisible = true
    elseif onPathCollision( Doggo, Path8) then
        Path8.isVisible = true
    else
        Path1.isVisible = false
        Path2.isVisible = false
        Path3.isVisible = false
        Path4.isVisible = false
        Path5.isVisible = false
        Path6.isVisible = false
        Path7.isVisible = false
        Path8.isVisible = false
    end
    return true
end

local function onBackgroundCollision( event )

    if ( event.phase == "began" ) then

            local obj1 = event.object1
            local obj2 = event.object2

            if (obj1.myName == "Doggo" and obj2.myName == "background" ) then
              
        end
    end
end

--movement controls
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
  if ((event.keyName == 'down' or event.keyName == 's') and event.phase == 'down' ) then
    down = 'down'
  else
    down = 'up'
  end
  if ((event.keyName == 'up' or event.keyName == 'w') and event.phase == 'down' ) then
    up = 'down'
  else
    up = 'up'
  end
  if (event.keyName == 'space' and event.phase == 'down') then
    space = 'down'
else
    space = 'up'
end
end

--Basic Doggo movement
local function walkPerson( event )

  if (d == 'down' or right == 'down') then
    Doggo.rotation = 180

    if (background.x ~= -310 and Doggo.x >= 640) then
        moveTilesLeft()
    elseif(background.x == -310 or background.x == 1550) then
        Doggo.x = Doggo.x + 10
    else
        moveTilesLeft()
    end

  elseif (a == 'down' or left == 'down') then
    Doggo.rotation = 0

    if (background.x ~= 1550 and Doggo.x <= 640) then
        moveTilesRight()
    elseif (background.x >= 1550 or background.x <= -310) then
        Doggo.x = Doggo.x - 10
    elseif(Doggo.x > 640 and background.x > -310) then
        moveTilesRight()
    else
        Doggo.x = Doggo.x - 10
    end

  elseif (w == 'down' or up == 'down') then
Doggo.rotation = 90    
    
    if (background.y <= 1550 and Doggo.y <= 360) then
        moveTilesUp()
    else
        Doggo.y = Doggo.y -10
    end

  elseif (s == 'down' or down == 'down') then
Doggo.rotation = -90
    if (background.y ~= -850 and Doggo.y >= 360) then
        moveTilesDown()
    elseif(background.y == -850 or background.y == 1550) then
        Doggo.y = Doggo.y + 10
    else
        moveTilesDown()
    end
        elseif(space == 'down') then
        print("background.x = " .. background.x) 
        print("background.y = " .. background.y)    
        print("Doggo.x = " .. Doggo.x)    
        print("Doggo.y = " .. Doggo.y)       
    end
end

--when player is on path this will drag the player to the red
local function pathDrag( event )
  if (onPathCollision( Doggo, Path5) == true) then
    d1 = 'down'
    right1 = 'down'
  else
    d1 = 'up'
    right1 = 'up'
  end
  if (onPathCollision( Doggo, Path3) == true) then
    a1 = 'down'
    left1 = 'down'
  else
    a1 = 'up'
    left1 = 'up'
  end
  if (onPathCollision( Doggo, Path2) == true) then
    down1 = 'down'
  else
    down1 = 'up'
  end
  if (onPathCollision( Doggo, Path1) == true) then
    up1 = 'down'
  else
    up1 = 'up'
  end
end

--This is the function that drags the dog
local function dragDoggo( event )

  if (d1 == 'down' or right1 == 'down') then
    if (background.x ~= -310 and Doggo.x >= 640) then
        moveTilesLeftAgainst()
    elseif(background.x <= -310 or background.x >= 1550) then
        Doggo.x = Doggo.x + 1
    else
        moveTilesLeftAgainst()
    end

  elseif (a1 == 'down' or left1 == 'down') then

    if (background.x ~= 1550 and Doggo.x <= 640) then
        moveTilesRightAgainst()
    elseif (background.x >= 1550 or background.x <= -310) then
        Doggo.x = Doggo.x - 1
    elseif(Doggo.x > 640 and background.x > -310) then
        moveTilesRightAgainst()
    else
        Doggo.x = Doggo.x - 1
    end

  elseif (w1 == 'down' or up1 == 'down') then

    if (background.y ~= 1550 and Doggo.y <= 360) then
        moveTilesUpAgainst()
    elseif(background.y <= -850 or background.y >= 1550) then
        Doggo.y = Doggo.y - 1
    else
        moveTilesUpAgainst()
    end

  elseif (s1 == 'down' or down1 == 'down') then
    if (background.y ~= -850 and Doggo.y >= 360) then
        moveTilesDownAgainst()
    elseif(background.y <= -850 or background.y >= 1550) then
        Doggo.y = Doggo.y + 1
    else
        moveTilesDownAgainst()
    end
end
end

-- -----------------------------------------------------------------------------------
-- Scene event functions
-- -----------------------------------------------------------------------------------
 
-- create()
function scene:create( event )
 
local sceneGroup = self.view
-- Code here runs when the scene is first created but has not yet appeared on screen
physics.pause()

StartingPosition = display.newImageRect("Path1.png", 200, 200)
StartingPosition.x = display.contentCenterX-1400
StartingPosition.y = display.contentCenterY+1400

StartingPosition1 = display.newImageRect("Path1.png", 400,850)
StartingPosition1.x = display.contentCenterX-1200
StartingPosition1.y = display.contentCenterY+1300
StartingPosition1.alpha = 0

background = display.newImageRect("Level3Background.png", 3200, 3200)
background.x = display.contentCenterX
background.y = display.contentCenterY

GreenZone = display.newImageRect("GrassyArea.png", 2960, 2960)
GreenZone.x = display.contentCenterX
GreenZone.y = display.contentCenterY

--position set
Path1 = display.newImageRect("Path1.png", 800, 200)
Path1.x = display.contentCenterX-1080
Path1.y = display.contentCenterY+1380
Path1.alpha = 0.2

--position set
Path2 = display.newImageRect("Path2.png", 200, 2300)
Path2.x = display.contentCenterX-580
Path2.y = display.contentCenterY+330
Path2.alpha = 0.2

--position set
Path3 = display.newImageRect("Path3.png", 2800, 200)
Path3.x = display.contentCenterX
Path3.y = display.contentCenterY-920
Path3.alpha = 0.2

--position set
Path4 = display.newImageRect("Path4.png", 200, 1000)
Path4.x = display.contentCenterX+300
Path4.y = display.contentCenterY-320
Path4.alpha = 0.2

--position set
Path5 = display.newImageRect("Path5.png", 200, 1000)
Path5.x = display.contentCenterX+1300
Path5.y = display.contentCenterY-320
Path5.alpha = 0.2

--position set
Path6 = display.newImageRect("Path3.png", 800, 200)
Path6.x = display.contentCenterX+800
Path6.y = display.contentCenterY+70
Path6.alpha = 0.2

--position set
Path7 = display.newImageRect("Path4.png", 200, 1100)
Path7.x = display.contentCenterX+650
Path7.y = display.contentCenterY+720
Path7.alpha = 0.2

--position set
Path8 = display.newImageRect("Path5.png", 1800, 200)
Path8.x = display.contentCenterX+560
Path8.y = display.contentCenterY+1370
Path8.alpha = 0.2

--position set
redZone = display.newImageRect("redZone.png", 750, 2050)
redZone.x = display.contentCenterX-1100
redZone.y = display.contentCenterY+250
redZone.alpha = 0.2

--position set
redZone1 = display.newImageRect("redZone.png", 700, 700)
redZone1.x = display.contentCenterX+800
redZone1.y = display.contentCenterY-400
redZone1.alpha = 0.2

--position set
redZone2 = display.newImageRect("redZone.png", 650, 1050)
redZone2.x = display.contentCenterX+1100
redZone2.y = display.contentCenterY+700
redZone2.alpha = 0.2

--position set
redZone3 = display.newImageRect("redZone.png", 850, 1000)
redZone3.x = display.contentCenterX+100
redZone3.y = display.contentCenterY+700
redZone3.alpha = 0.2

--position set
redZone4 = display.newImageRect("redZone.png", 2400, 300)
redZone4.x = display.contentCenterX-200
redZone4.y = display.contentCenterY-1200
redZone4.alpha = 0.2

Objective = display.newImageRect("Path1.png", 100, 100)
Objective.x = display.contentCenterX+1300
Objective.y = display.contentCenterY-1300

timeText = display.newText("Lives: " .. time, 200, 100, native.systemFont, 36 )

bounds = Path1.contentBounds 
print( "xMin: ".. bounds.xMin ) -- xMin: 75
print( "yMin: ".. bounds.yMin ) -- yMin: 75
print( "xMax: ".. bounds.xMax ) -- xMax: 125
print( "yMax: ".. bounds.yMax ) -- yMax: 125

Doggo = display.newImageRect("Doggo.png", 150, 100)
Doggo.x = display.contentCenterX
Doggo.y = display.contentCenterY
Doggo.isFixedRotation = true

physics.addBody( Doggo, "dynamic", {friction = 1.0})
end
 
 
-- show()
function scene:show( event )
 
    local sceneGroup = self.view
    local phase = event.phase
 
    if ( phase == "will" ) then
        -- Code here runs when the scene is still off screen (but is about to come on screen)
 
    elseif ( phase == "did" ) then
        -- Code here runs when the scene is entirely on screen
        Runtime:addEventListener( "key", movementKeys )
        Runtime:addEventListener( "enterFrame", walkPerson )
        Runtime:addEventListener( "enterFrame", gameLoop )
        Runtime:addEventListener("collision", onPathCollision)
        terence = timer.performWithDelay(1000, gameLoopSecond, -1)
        Runtime:addEventListener("enterFrame", dragDoggo)
        Runtime:addEventListener("enterFrame", pathDrag)
    end
end
 
 
-- hide()
function scene:hide( event )
 
    local sceneGroup = self.view
    local phase = event.phase
 
    if ( phase == "will" ) then
        -- Code here runs when the scene is on screen (but is about to go off screen)
    timer.cancel( terence )
    elseif ( phase == "did" ) then
        -- Code here runs immediately after the scene goes entirely off screen
    Runtime:removeEventListener("enterFrame", gameLoop)
    Runtime:removeEventListener("key", movementKeys)
    Runtime:removeEventListener("enterFrame", walkPerson)
    Runtime:removeEventListener("collision" , onPathCollision)
    Runtime:addEventListener("enterFrame", dragDoggo)
    Runtime:addEventListener("enterFrame", pathDrag)
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