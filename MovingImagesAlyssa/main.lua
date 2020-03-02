-- Title: MovingObjects
-- Name: Alyssa
-- Course: ICS2O/3C
-- This program moves a beetleship across the screen and then makes it fade in. 
	-- i added a second object that moves in a different direction, fades out and grows in size

-- hide the status bar
display.setStatusBar(display.HiddenStatusBar)

-- global variables
scrollSpeed = 7

-- background image with width and height 
local backgroundImage = display.newImageRect("Images/background.png", 2048, 1536)

-- character image with width and height
local beetleship = display.newImageRect("Images/beetleship.png", 200, 200)

-- set the image to be transparent
beetleship.alpha = 0

-- set the initial x and y position of beetleship
beetleship.x = 0
beetleship.y = display.contentHeight/3

-- Functon: MoveShip
-- Input: this function accepts an event listener
-- output: none
-- description: This function adds the scroll speed to the x-value of the ship
local function MoveShip(event)
	-- add the scroll speed to the x-value of the ship
	beetleship.x = beetleship.x + scrollSpeed
	-- change the transparency of the ship every timeit moves sp that it fades out
	beetleship.alpha = beetleship.alpha + 0.025
end

-- MoveShip wil be called over and over again
Runtime:addEventListener("enterFrame", MoveShip)

-- second character image with width and height
local rocketship = display.newImageRect("Images/rocketship.png", 300, 300)

-- set image to be fully visable
rocketship.alpha = 1

-- set the initial x and y position of rocketship
rocketship.x = 2024
rocketship.y = display.contentHeight