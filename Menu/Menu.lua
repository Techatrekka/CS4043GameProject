-----------------------------------------------------------------------------------------
--
-- main.lua
--
-----------------------------------------------------------------------------------------

 

local Background = display.newImageRect("Background.png", 1280, 720)
Background.x = display.contentCenterX
Background.y = display.contentCenterY 

local ULMAP = display.newImageRect("ULMAP.png", 300, 200)
ULMAP.x = display.contentCenterX -150
ULMAP.y = display.contentCenterY +100

local playButton = display.newImageRect("playButton.png", 250, 120)
playButton.x = display.contentCenterX+250
playButton.y = display.contentCenterY -70

local quitButton = display.newImageRect("quitButton.png", 250, 120)
quitButton.x = display.contentCenterX +250
quitButton.y = display.contentCenterY +75

local Lepresean = display.newImageRect("Lepresean.png", 100, 150)
Lepresean.x = display.contentCenterX -130
Lepresean.y = display.contentCenterY +150

local Lepresean2 = display.newImageRect("newLabel.png", 500, 350)
Lepresean2.x = display.contentCenterX -180
Lepresean2.y = display.contentCenterY -100

local timer1 
local timer2

--timer 1 = os.time()

local function pushPlayButton() 
    local pressedPlay = display.newImageRect("pressedPlay.png", 250, 120)
    pressedPlay.x = display.contentCenterX +250
    pressedPlay.y = display.contentCenterY -70

end

--timer2 = os.time()

local function pushQuitButton()
    local pressedQuit = display.newImageRect("pressedQuit.png", 250, 120)
    pressedQuit.x = display.contentCenterX +250
    pressedQuit.y = display.contentCenterY +75

    


end

playButton:addEventListener("tap", pushPlayButton)
quitButton:addEventListener("tap", pushQuitButton)



