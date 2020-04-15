-- Title: LivesAndTimers
-- Name: Alyssa
-- Course: ICS2O
-- This program gives the user a certain amount of time to answer the question
-- and loses a life if the they get the question wrong or run out of time.


-- hide status bar
display.setStatusBar(display.HiddenStatusBar)

-- set the background color
display.setDefault("background", 229/255, 243/255, 255/255)

-------------------------------------------------------------------------------------------
-- VARIABLES
-------------------------------------------------------------------------------------------

--variables for timer
local totalSeconds = 10
local secondsLeft = 10
local clockText
local countDownTimer
local lives = 4
local heart1
local heart2
local heart3
local heart4
local gameOver
local questionObject                                                                        
local correctObject                                                                       
local incorrectObject
local numericField                                                                        
local randomNumber1Add
local randomNumber1Sub
local randomNumber2Sub
local randomNumber2Add
local randomNumber1Multi
local randomNumber2Multi
local randomNumber1Devi
local randomNumber2Devi
local userAnswer
local correctAnswer
local correctSound
local incorrectSound
local points = 0
local pointsText
local randomOperator                                                                                 
local backgroundMusic
local backgroundMusicChannel

-------------------------------------------------------------------------------------------
-- OBJECT CREATION              
-------------------------------------------------------------------------------------------

-- displays a  question and sets the color
questionObject = display.newText( "", display.contentWidth/3, display.contentHeight/2, nil, 75)
questionObject:setTextColor(98/255, 98/255, 98/255)

-- create the correct answer text object, make it invisible, and set the color
correctObject = display.newText( "Correct!! :)", display.contentWidth/2, display.contentHeight*2/3, nil, 50)
correctObject:setTextColor(15/255, 243/255, 10/255)
correctObject.isVisible = false

-- create the incorrect answer text object, make it invisible, and set the color
incorrectObject = display.newText( "Incorrect. :(", display.contentWidth/2, display.contentHeight*2/3, nil, 50)
incorrectObject:setTextColor(245/255, 10/255, 10/255)
incorrectObject.isVisible = false

-- create a numeric text field
numericField = native.newTextField( display.contentWidth*3/5, display.contentHeight/2, 200, 80)
numericField.inputType = "decimal"

-- display the points text and change to color
pointsText = display.newText("Points: " .. points, display.contentWidth/6, display.contentHeight/7, nil, 50)
pointsText:setTextColor(98/255, 98/255, 98/255)

-- create the correct and incorrect correct sound 
correctSound = audio.loadSound( "Sounds/Correct sound.mp3" )
incorrectSound = audio.loadSound( "Sounds/Wrong sound.mp3" )

-- create the background music
backgroundMusic = audio.loadSound( "Sounds/bensound-littleidea.mp3" )

-- create the lives to display on the screen
heart1 = display.newImageRect("Images/heart.png", 100, 100)
heart1.x = display.contentWidth * 7/8
heart1.y = display.contentHeight * 1/7
heart1.isVisible = true

heart2 = display.newImageRect("Images/heart.png", 100, 100)
heart2.x = display.contentWidth * 6/8
heart2.y = display.contentHeight * 1/7
heart2.isVisible = true

heart3 = display.newImageRect("Images/heart.png", 100, 100)
heart3.x = display.contentWidth * 5/8
heart3.y = display.contentHeight * 1/7
heart3.isVisible = true

heart4 = display.newImageRect("Images/heart.png", 100, 100)
heart4.x = display.contentWidth * 4/8
heart4.y = display.contentHeight * 1/7
heart4.isVisible = true

-- create the clock object
clockText = display.newText( secondsLeft .. "", display.contentWidth/2, display.contentHeight*6/7, nil, 50 )
clockText:setTextColor(98/255, 98/255, 98/255)

-------------------------------------------------------------------------------------------
-- LOCAL FUNCTIONS
-------------------------------------------------------------------------------------------

-- play background music
backgroundMusicChannel = audio.play(backgroundMusic)

local function UpdateTime()

	-- decrement the number of seconds
	secondsLeft = secondsLeft - 1

	-- display the number of seconds left in the clock object
	clockText.text = secondsLeft .. ""

	if (secondsLeft == 0) then 
		-- reset the number of seconds left
		secondsLeft = totalSeconds
		lives = lives - 1

		if (lives == 3) then
			heart4.isVisible = false
		elseif (lives == 2) then
			heart3.isVisible = false
		elseif (lives == 1) then
			heart2.isVisible = false
		elseif (lives == 0) then
			heart1.isVisible = false
		end
	 
	end

end


local function AskQuestion()
	-- create the timer
	countDownTimer = timer.performWithDelay( 1000, UpdateTime, 0)
	-- generate a random number between 1 and 4
	randomOperator = math.random(1,4)

	-- generate 2 random numbers for each operation possibility
	randomNumber1Add = math.random(1,20)
	randomNumber2Add = math.random(1,20)
	randomNumber1Sub = math.random(1,10)
	randomNumber2Sub = math.random(11,20)
	randomNumber1Multi = math.random(1,10)
	randomNumber2Multi = math.random(1,10)
	randomNumber1Devi = math.random(1,100)
	randomNumber2Devi = math.random(1,100)

	-- if the random operator is 1, then do addition
	if (randomOperator == 1) then
        -- calculate the correct answer
		correctAnswer = randomNumber1Add + randomNumber2Add

		-- create question in text object
		questionObject.text = randomNumber1Add .. " + " .. randomNumber2Add .. " = "

	-- if the random operator is 2, do subtraction
	elseif (randomOperator == 2) then
		-- calculate the correct answer
		correctAnswer = randomNumber2Sub - randomNumber1Sub

		-- create question in text object
		questionObject.text = randomNumber2Sub .. " - " .. randomNumber1Sub .. " = "

    -- if the random operator is 3, then do multiplication
	elseif (randomOperator == 3) then
		-- calculate the correct answer
		correctAnswer = randomNumber1Multi * randomNumber2Multi

		-- create question in text object
		questionObject.text = randomNumber1Multi .. " x " .. randomNumber2Multi .. " = "

     -- if the random operator is 4, then do division
	elseif (randomOperator == 4) then
		-- calculate the correct answer
		correctAnswer = randomNumber1Devi / randomNumber2Devi

		-- round to 1 decimal place
		correctAnswer = correctAnswer * 10
		correctAnswer = math.round(correctAnswer)
		correctAnswer = correctAnswer / 10


		-- create question in text object
		questionObject.text = randomNumber1Devi .. " / " .. randomNumber2Devi .. " = "
	end
end

local function HideCorrect()
	correctObject.isVisible = false
	AskQuestion()
end

local function HideIncorrect()
	incorrectObject.isVisible = false
	correctAnswerObject.isVisible = false
	AskQuestion()
end

local function NumericFieldListener( event )

	-- user begins editing "numericField"
	if ( event.phase == "began" ) then

		-- clear text field
		event.target.text = ""

	elseif ( event.phase == "submitted" ) then

		-- when the answer is submitted (enter key is pressed) set user input to users answer
		userAnswer = tonumber(event.target.text)

		-- if the users answer is correct:
		if (userAnswer == correctAnswer) then
			correctObject.isVisible = true
			timer.performWithDelay( 1500, HideCorrect )
            audio.play( correctSound )
			event.target.text = ""
			timer.cancel(countDownTimer)

			-- give the user a point
			points = points + 1

			--update the text
			pointsText.text = "Points: " .. points

		-- if the user gets the answer Wrong
		else incorrectObject.isVisible = true
			timer.performWithDelay( 1500, HideIncorrect )
			audio.play( incorrectSound )
			event.target.text = ""
			timer.cancel(countDownTimer)
		end
	end
end

------------------------------------------------------------------------------------------
-- FUNCTION CALLS
------------------------------------------------------------------------------------------

-- call the function to ask the question
AskQuestion()
UpdateTime()

-- add the event listener to the numeric field
numericField:addEventListener( "userInput", NumericFieldListener )


