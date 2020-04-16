-- Title: WhackAMole
-- Name: Your Name
-- Course: ICS2O
-- This program places a random object on the screen (in this case pizza). 
-- If the user clicks it on time, the score in creases by 1.

-- hide the status bar
display.setStatusBar(display.HiddenStatusBar)

-----------------------------------------------------------------------------

-- creating background
local bkg = display.newRect( 0, 0, display.contentWidth, display.contentHeight )
	
	-- set the background color
	bkg:setFillColor(255/255, 144/255, 33/255)

	-- setting position
	bkg.anchorX = 0
	bkg.anchorY = 0
	bkg.x = 0
	bkg.y = 0

-----------------------------------------------------------------------------

-- creating the pizza slice
local pizza = display.newImage( "Images/pizza slice.png", 0, 0 )

	-- setting position		
	pizza.x = display.contentCenterX		
	pizza.y = display.contentCenterY	

	-- change the size of the pizza
    pizza:scale( 0.4, 0.4 )

    -- make the pizza invisible
    pizza.isVisible = false

------------------------------------------------------------------------------

-- variable to keep track of the score
local score = 0

-- Text to display the score on the screen
local scoreText = display.newText( " Score: " .. score, display.contentWidth/8, display.contentHeight/11, nil, 50)

-- create the sound effect
local nom = audio.loadSound( "Sounds/nom.mp3")

-- create the (beautiful) background music
local bkgMusic = audio.loadSound( "Sounds/minecraft music.mp3")

-----------------------------------Functions----------------------------------------------------

-- This function calls the PopUp function after 3 seconds
function PopUp()

	-- Choosing a random position on the screen
	pizza.x = math.random( 0, display.contentWidth )
	pizza.y = math.random( 0, display.contentHeight )

	-- make the pizza visible
	pizza.isVisible = true

	timer.performWithDelay( 500, Hide )
end

-- this function calls the PopUp function after 3 seconds
function PopUpDelay()
	timer.performWithDelay( 3000, PopUp )
end

-- this function makes the pizza invisible and then calls the PopUpDelay function
function Hide()

	-- changing visibility 
	pizza.isVisible = false

	PopUpDelay()
end

-- this function starts the game
function GameStart()
	PopUpDelay()
end

-- this function updates the score only if the pizza is clicked.
-- it then displays the new score.
function Whacked( event )

	-- if touch phase just started
	if (event.phase == "began" ) then
		score = score + 1
		scoreText.text = " Score: " .. score
		audio.play(nom)
	end
end

-- play background music
audio.play(bkgMusic)

---------------------------------Event Listeners---------------------------------
-- I add the event listener to the pizza so that if the pizza is touched, the whacked
-- function is called
pizza:addEventListener( "touch", Whacked )

-----------------------------------Start Game-------------------------------------
GameStart()