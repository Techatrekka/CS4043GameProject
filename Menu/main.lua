-----------------------------------------------------------------------------------------
--
-- main.lua
--
-----------------------------------------------------------------------------------------

 

local Background = display.newImageRect("Background.png", 360, 570)
Background.x = display.contentCenterX
Background.y = display.contentCenterY 

local ULMAP = display.newImageRect("ULMAP.png", 300, 200)
ULMAP.x = display.contentCenterX+20
ULMAP.y = display.contentCenterY -90


local playButton = display.newImageRect("playButton.png", 180, 100)
playButton.x = display.contentCenterX
playButton.y = display.contentCenterY +70

local quitButton = display.newImageRect("quitButton.png", 180, 100)
quitButton.x = display.contentCenterX
quitButton.y = display.contentCenterY +200

local Lepresean = display.newImageRect("Lepresean.png", 100, 150)
Lepresean.x = display.contentCenterX +70
Lepresean.y = display.contentCenterY -70

local Lepresean2 = display.newImageRect("Lepresean2.png", 250, 100)
Lepresean2.x = display.contentCenterX 
Lepresean2.y = display.contentCenterY -225



local function pushPlayButton()
    


end

local function pushQuitButton()
    


end

playButton:addEventListener("tap", pushPlayButton)
quitButton:addEventListener("tap", pushQuitButton)



