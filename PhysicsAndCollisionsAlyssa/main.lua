-----------------------------------------------------------
-- Title: PhysicsAndCollisions
-- Name: Alyssa
-- Course: ICS2O
-- This program...
-------------------------------------------------------------

-- hide the status bar
display.setStatusBar(display.HiddenStatusBar)

-- load physics
local physics = require("physics")

-- start physics
physics.start()

--------------------------------------------------------------------
-- OBJECTS
--------------------------------------------------------------------
-- Ground
local ground = display.newImage("Images/ground.png", 0, 0)

    -- set the x and y position
	ground.x = display.contentWidth/2
	ground.y = 768

	-- change the width to be the same as the screen
	ground.width = display.contentWidth

	-- add to physics
	physics.addBody(ground, "static", {friction=0.5, bounce=0.3})

--------------------------------------------------------------------

-- beam
local beam1 = display.newImage("Images/beam.png", 0, 0)
	
	-- set the x and y position
	beam1.x = display.contentCenterX/5
	beam1.y = display.contentCenterY*1.65

	-- set the beam width and height
	beam1.width = display.contentWidth/2
	beam1.height = display.contentHeight/10

	-- rotate the beam -60 degrees sp it's on an angle
	beam1:rotate(45)

	-- send it to the back layer
	beam1:toBack()

	-- add physics
	physics.addBody(beam1, "static", {friction=0.5, bounce=0.3})

--------------------------------------------------------------------
-- create another beam for the other side
local beam2 = display.newImage("Images/beam.png", 0, 0)
	
	-- set the x and y position
	beam2.x = display.contentWidth
	beam2.y = display.contentHeight/2

	-- set the beam width and height
	beam2.width = display.contentWidth/10
	beam2.height = display.contentHeight

	-- set to back
	beam2:toBack()

	-- add physics
	physics.addBody(beam2, "static", {friction=0.5, bounce=0.3})

---------------------------------------------------------------------

-- create background
local bkg = display.newImage("Images/bkg.png", 0, 0)
	
	-- set the x and y position
	bkg.x = display.contentCenterX
	bkg.y = display.contentCenterY

	-- set the width and height
	bkg.width = display.contentWidth
	bkg.height = display.contentHeight

	-- sned to back
	bkg:toBack()

--------------------------------------------------------------------------------
-- FUNCTIONS
------------------------------------------------------------------------------

-- create the first ball
local function FirstBall()
	-- creating first ball
	local ball1 = display.newImage("Images/super_ball.png", 0, 0)

	-- add physics
	physics.addBody(ball1, {density=1.0, friction=0.5, bounce=0.3, radius=25})
end

-------------------------------------------------------------------------------

-- create second ball
local function SecondBall()
	-- creating second ball
	local ball2 = display.newImage("Images/super_ball.png", 0, 0)

	-- add physics
	physics.addBody(ball2, {density=0.5, friction=0.2, bounce=0.2, radius=12.5})

	-- scale the ball 
	ball2.width = 25
	ball2.height = 25

end

-----------------------------------------------------------------------------

-- create third ball
local function ThirdBall()
	-- creating second ball
	local ball3 = display.newImage("Images/super_ball.png", 0, 0)

	-- add physics
	physics.addBody(ball3, {density=1.0, friction=0.9, bounce=0.1, radius=120})

	-- scale the ball
	ball3.width = 240
	ball3.height = 240

end

---------------------------------------------------------------------------------

-- create fourth ball
local function FourthBall()
	-- creating second ball
	local ball4 = display.newImage("Images/super_ball.png", 0, 0)

	-- add physics
	physics.addBody(ball4, {density=0.3, friction=0.1, bounce=0.5, radius=30})

	-- scale the ball
	ball4.width = 60
	ball4.height = 60
end

--------------------------------------------------------------------------------

-- create fifth ball
local function FifthBall()
	-- creating second ball
	local ball5 = display.newImage("Images/super_ball.png", 0, 0)

	-- add physics
	physics.addBody(ball5, {density=0.2, friction=0.4, bounce=0.3, radius=60})

	-- scale the ball
	ball5.width = 120
	ball5.height = 120
end

--------------------------------------------------------------------------------

-- create fifth ball
local function SixthBall()
	-- creating second ball
	local ball6 = display.newImage("Images/super_ball.png", 0, 0)

	-- add physics
	physics.addBody(ball6, {density=0.6, friction=0.1, bounce=0.5, radius=49})

	-- scale the ball
	ball6.width = 98
	ball6.height = 98
end

--------------------------------------------------------------------------------

-- create fifth ball
local function SeventhBall()
	-- creating second ball
	local ball7 = display.newImage("Images/super_ball.png", 0, 0)

	-- add physics
	physics.addBody(ball7, {density=0.2, friction=0.4, bounce=0.3, radius=28})

	-- scale the ball
	ball7.width = 56
	ball7.height = 56
end

-------------------------------------------------------------------------------
-- TIMER DELAYS - call each function after the given milliseconds
-------------------------------------------------------------------------------
timer.performWithDelay( 0, FirstBall )
timer.performWithDelay( 500, SecondBall )
timer.performWithDelay( 975, ThirdBall )
timer.performWithDelay( 1300, FourthBall )
timer.performWithDelay( 2200, FifthBall )
timer.performWithDelay( 2500, SixthBall )
timer.performWithDelay( 3000, SeventhBall )