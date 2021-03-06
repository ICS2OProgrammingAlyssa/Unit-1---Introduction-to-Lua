-- Title: MovingObjects
-- Name: Alyssa
-- Course: ICS2O/3C
-- This program moves a beetleship across the screen and then makes it fade in. 
	-- i added a second object that moves in a different direction, fades out and grows in size

-- hide the status bar
display.setStatusBar(display.HiddenStatusBar)

-- global variables
scrollSpeedBeetleship = 7
scrollSpeedRocketship = 6

-- background image with width and height 
local backgroundImage = display.newImageRect("Images/background.png", 2048, 1536)

-- background music
local backgroundMusic = audio.loadSound( "Sounds/bensound-straight.mp3" )
local backgroundMusicChannel

-- character image with width and height
local beetleship = display.newImageRect("Images/beetleship.png", 200, 200)

-- set the image to be transparent
beetleship.alpha = 0

-- set the initial x and y position of beetleship
beetleship.x = 0
beetleship.y = display.contentHeight/3

-- play background music
backgroundMusicChannel = audio.play(backgroundMusic)

-- Functon: MoveBeetleship
-- Input: this function accepts an event listener
-- output: none
-- description: This function adds the scroll speed to the x-value of the ship
local function MoveBeetleship(event)
	-- add the scroll speed to the x-value of the ship
	beetleship.x = beetleship.x + scrollSpeedBeetleship
	-- change the transparency of the ship every time it moves so that it fades in
	beetleship.alpha = beetleship.alpha + 0.025
end

-- MoveBeetleship wil be called over and over again
Runtime:addEventListener("enterFrame", MoveBeetleship)

-- second character image with width and height
local rocketship = display.newImageRect("Images/rocketship.png", 300, 300)

-- set image to be fully visable
rocketship.alpha = 1

-- set the initial x and y position of rocketship
rocketship.x = 2024
rocketship.y = display.contentHeight * 2/3

-- changes direction of the ship
rocketship:scale (-1, 1)

-- Function: MoveRocketship
-- Input: this function accepts an event listener
-- Output: none
-- Description: this function adds the scroll speed to the x-value of the ship
local function MoveRocketship(event)
	-- add the scroll speed to the x-valaue of the ship
	rocketship.x = rocketship.x - scrollSpeedRocketship
	-- change the transparencyof the ship so that it fades out
	rocketship.alpha = rocketship.alpha - 0.000001
	-- changes the scale of the ship
	rocketship.xScale = 2
	rocketship.yScale = 2
end

-- MoveRocketship over and over again
Runtime:addEventListener("enterFrame", MoveRocketship)
