-- Title: TouchAndReact
-- Name: Alyssa
-- Course: ICS2O
-- this program does something when I click the button 

-- set the background color
display.setDefault ("background", 187/255, 174/255, 213/255)

-- hide the status bar
display.setStatusBar(display.HiddenStatusBar)

-- create blue button, set its position and make it visible
local blueButton = display.newImageRect("Images/Fast Button Inactive@2x.png", 230, 128)
blueButton.x = display.contentWidth/2
blueButton.y = display.contentHeight/2
blueButton.isVisible = true
-- create red button, set its position and make it invisible
local redButton = display.newImageRect("Images/Fast Button Active@2x.png", 238, 136)
redButton.x = display.contentWidth/2
redButton.y = display.contentHeight/2
redButton.isVisible = false

-- create text object, set its position and make it invisible
local textObject = display.newText ("Clicked!", 0, 0, nil, 55)
textObject.x = display.contentWidth/2
textObject.y = display.contentHeight/3
textObject:setTextColor (0, 1, 0)
textObject.isVisible = false

-- create checkmark, set its position and make it invisible
local checkmark = display.newImageRect("Images/checkmark.png", 130, 130)
checkmark.x = display.contentWidth * 3/4
checkmark.y = display.contentHeight/2
checkmark.isVisible = false

-- create the correct sound effect
local correctSound = audio.loadSound( "Sounds/Correct Answer Sound Effect.mp3" )

-- Function:BlueButtonListener
-- Input: touch listener
-- Output: none
-- Description: when blue button is clicked, it will make the text appear with
-- the red button, and make blue button disappear
local function BlueButtonListener(touch)
	if (touch.phase == "began") then
		blueButton.isVisible = false
		redButton.isVisible = true
		textObject.isVisible = true
		checkmark.isVisible = true
		audio.play( correctSound )
	end

	if (touch.phase == "ended") then
		blueButton.isVisible = true
		redButton.isVisible = false
		textObject.isVisible = false
		checkmark.isVisible = false
	end
end

-- add the receptive listener
blueButton:addEventListener("touch", BlueButtonListener)


-- Function: RedButtonListener
-- Input: touch listener
-- Output: none
-- Description: when blue button is clicked, red button will appear along with the text, 
-- and blue button will disappear
local function RedButtonListener(touch)
	if (touch.phase == "began") then
		blueButton.isVisible = false
		redButton.isVisible = true
		textObject.isVisible = true
		checkmark.isVisible = true
	end

	if (touch.phase == "ended") then
		blueButton.isVisible = true
		redButton.isVisible = false
		textObject.isVisible = false
		checkmark.isVisible = false
	end
end

-- add the receptive listener
redButton:addEventListener("touch", RedButtonListener)


	