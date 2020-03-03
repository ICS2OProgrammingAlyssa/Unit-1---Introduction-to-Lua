-- Title: TouchAndDrag
-- Name: Alyssa
-- Course: ICS2O
-- This program displays images that react to a preson's finger.

-- hide the status bar
display.setStatusBar(display.HiddenStatusBar)

-- local Variables
local backgroundImage = display.newImageRect("Images/background.png", 2048,1536)

local pinkGirl = display.newImageRect("Images/girl1.png", 150, 150)
local pinkGirlWidth = pinkGirl.width
local girl1Height = pinkGirl.height 

local blueGirl = display.newImageRect("Images/girl5.png", 200, 200)
local blueGirlWidth = blueGirl.width 
local blueGirlHeight = blueGirl.height 

local star = display.newImageRect("Images/star.png", 100, 100)
local starWidth = star.width 
local starHeight = star.height 

-- my boolean variables to keep track of which object i touched first
local alreadyTouchedPinkGirl = false 
local alreadyTouchedBlueGirl = false
local alreadyTouchedStar = false

-- set the initial x and y position of my image 
pinkGirl.x = 765
pinkGirl.y = 189

blueGirl.x = 329
blueGirl.y = 345

star.x = 512
star.y = 368

-- Function: PinkGirlListener
-- Input: touch listener 
-- Output: none
-- Description: when pink girl is touched, move her
local function PinkGirlListener(touch)

	if(touch.phase == "began") then
		if (alreadyTouchedBlueGirl == false) and (alreadyTouchedStar == false) then 
			alreadyTouchedPinkGirl = true
		end
	end
	
	if ( (touch.phase == "moved") and (alreadyTouchedPinkGirl ==  true) ) then
		pinkGirl.x = touch.x
		pinkGirl.y = touch.y
	end

	if (touch.phase == "ended") then
		alreadyTouchedPinkGirl = false
		alreadyTouchedStar = false
		alreadyTouchedBlueGirl = false
	end
end

-- add the resceptive listener
pinkGirl:addEventListener("touch", PinkGirlListener)

-- Function: BlueGirlListener
-- Input: touch listener
-- Output: none
-- Description: when blue girl is touched, move her
local function BlueGirlListener(touch)

	if(touch.phase == "began") then 
		if (alreadyTouchedStar == false) and (alreadyTouchedPinkGirl == false) then
			alreadyTouchedBlueGirl = true
		end
	end

	if ( (touch.phase == "moved") and (alreadyTouchedBlueGirl == true) ) then
		blueGirl.x = touch.x
		blueGirl.y = touch.y
	end

	if (touch.phase == "ended") then
		alreadyTouchedBlueGirl = false
		alreadyTouchedStar = false
		alreadyTouchedPinkGirl = false
	end
end

-- add the receptive listener
blueGirl:addEventListener("touch", BlueGirlListener)

-- Function: StarListener
-- Input: touch listener
-- Output: none
-- Description: when star is touched, move it
local function StarListener(touch)

	if(touch.phase == "began") then
		if (alreadyTouchedBlueGirl == false) and (alreadyTouchedPinkGirl == false) then
			alreadyTouchedStar = true
		end
	end

	if ( (touch.phase == "moved") and (alreadyTouchedStar == true) ) then
		star.x = touch.x
		star.y = touch.y
	end

	if (touch.phase == "end") then
		alreadyTouchedStar = false
		alreadyTouchedPinkGirl = false
		alreadyTouchedBlueGirl = false
	end
end

-- add the receptive listener
star:addEventListener("touch", StarListener)