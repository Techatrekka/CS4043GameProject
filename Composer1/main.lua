
local composer = require( "composer" )

local scene = composer.newScene()

function scene:createScene( event )
	local sceneGroup = self.view
	local Background = display.newImageRect(sceneGroup, "Background.png", 360, 570)
	Background.x = display.contentCenterX
	Background.y = display.contentCenterY 

	local ULMAP = display.newImageRect(sceneGroup, "ULMAP.png", 300, 200)
	ULMAP.x = display.contentCenterX+20
	ULMAP.y = display.contentCenterY -90

	local playButton = display.newImageRect(sceneGroup,"playButton.png", 180, 100)
	playButton.x = display.contentCenterX
	playButton.y = display.contentCenterY +70

	local quitButton = display.newImageRect(sceneGroup,"quitButton.png", 180, 100)
	quitButton.x = display.contentCenterX
	quitButton.y = display.contentCenterY +200

	local Lepresean2 = display.newImageRect(sceneGroup,"Lepresean2.png", 250, 100)
	Lepresean2.x = display.contentCenterX 
	Lepresean2.y = display.contentCenterY -225
end

function scene:enterScene( event )
end

function scene:exitScene( event )

end

function scene:destroyScene( event )

end

local function pushPlayButton( event )
    composer.removeScene("menu")

end

local function pushQuitButton( event )
    


end


scene:addEventListener( "createScene", scene )
scene:addEventListener( "enterScene", scene )
scene:addEventListener( "exitScene", scene )
scene:addEventListener( "destroyScene", scene )


--playButton:addEventListener("tap", pushPlayButton)
--quitButton:addEventListener("tap", pushQuitButton)
 
return scene