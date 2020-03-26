-- Title: MathFun
-- Name: Alyssa
-- Course: ICS2O
-- This program asks the user random addition, subtraction, multiplication and division 
-- questions.

-- hide status bar
display.setStatusBar(display.HiddenStatusBar)

-- set the background color
display.setDefault("background", 229/255, 243/255, 255/255)

-------------------------------------------------------------------------------------------
-- VARIABLES
-------------------------------------------------------------------------------------------

-- create the variables
local questionObject                                                                        
local correctObject                                                                       
local incorrectObject
local numericField                                                                        
local randomNumber1
local randomNumber2
local userAnswer
local correctAnswer
local correctSound
local incorrectSound
local points = 0
local pointsText
local randomOperator                                                                                 

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
correctSound = audio.loadSound( "Sounds/Correct Answer Sound Effect.mp3" )
incorrectSound = audio.loadSound( "Sounds/Wrong Buzzer Sound Effect.mp3" )

-------------------------------------------------------------------------------------------
-- LOCAL FUNCTIONS
-------------------------------------------------------------------------------------------

local function AskQuestion()
	-- generate a random number between 1 and 4
	randomOperator = math.random(1,4)

	-- generate 2 random numbers
	randomNumber1 = math.random(0,5)
	randomNumber2 = math.random(5,10)

	-- if the random operator is 1, then do addition
	if (randomOperator == 1) then
        -- calculate the correct answer
		correctAnswer = randomNumber1 + randomNumber2

		-- create question in text object
		questionObject.text = randomNumber1 .. " + " .. randomNumber2 .. " = "

	-- if the random operator is 2, do subtraction
	elseif (randomOperator == 2) then
		-- calculate the correct answer
		correctAnswer = randomNumber2 - randomNumber1

		-- create question in text object
		questionObject.text = randomNumber2 .. " - " .. randomNumber1 .. " = "

    -- if the random operator is 3, then do multiplication
	elseif (randomOperator == 3) then
		-- calculate the correct answer
		correctAnswer = randomNumber1 * randomNumber2

		-- create question in text object
		questionObject.text = randomNumber1 .. " x " .. randomNumber2 .. " = "

     -- if the random operator is 4, then do division
	elseif (randomOperator == 4) then
		-- calculate the correct answer
		correctAnswer = randomNumber1 / randomNumber2

		-- round to 1 decimal place
		math.round(correctAnswer)


		-- create question in text object
		questionObject.text = randomNumber1 .. " / " .. randomNumber2 .. " = "
	end
end

local function HideCorrect()
	correctObject.isVisible = false
	AskQuestion()
end

local function HideIncorrect()
	incorrectObject.isVisible = false
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

			-- give the user a point
			points = points + 1

			--update the text
			pointsText.text = "Points: " .. points

		-- if the user gets the answer Wrong
		else incorrectObject.isVisible = true
			timer.performWithDelay( 1500, HideIncorrect )
			audio.play( incorrectSound )
			event.target.text = ""
		end
	end
end

------------------------------------------------------------------------------------------
-- FUNCTION CALLS
------------------------------------------------------------------------------------------

-- call the function to ask the question
AskQuestion()

-- add the event listenr to the numeric field
numericField:addEventListener( "userInput", NumericFieldListener )