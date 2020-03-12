-- Title: NumTextField
-- Name: Alyssa
-- Course: ISC2O
-- Description: this program asks the user an addition question and displays "correct" if the
-- answer is correct, and displays "incorrect" if the answer is incorrect.
------------------------------------------------------------------------------------------------

-- hide the status bar
display.setStatusBar(display.HiddenStatusBar)

-- set the background color
display.setDefault("background", 239/255, 239/255, 239/255)

---------------------------------------------------------------------------------------------------
--LOCAL VARIABLES
---------------------------------------------------------------------------------------------------

--create local variables
local questionObject
local correctObject
local incorrectObject
local numericField
local randomNumber1
local randomNumber2
local userAnswer
local correctAnswer
local correctSound = audio.loadSound( "Sounds/Correct Answer Sound Effect.mp3" )
local incorectSound = audio.loadSound( "Sounds/Wrong Buzzer Sound Effect.mp3" )
local points = 0
local pointsText
pointsText = display.newText("Points: " .. points, display.contentWidth/6, display.contentHeight/7, nil, 50)
pointsText:setTextColor(0.3, 0.3, 0.3)
-------------------------------------------------------------------------------------------------
-- LOCAL FUNCIONS
-------------------------------------------------------------------------------------------------

local function AskQuestion()
	-- generate 2 random numbers between a max. and a min. number
	randomNumber1 = math.random(0, 8)
	randomNumber2 = math.random(0, 8)

	correctAnswer = randomNumber1 + randomNumber2

	-- create question in text object
	questionObject.text = randomNumber1 .. " + " .. randomNumber2 .. " = "

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

		--if the users answer and the correct answer are the same:
		if (userAnswer == correctAnswer) then
			correctObject.isVisible = true
			timer.performWithDelay(1500, HideCorrect)
			audio.play( correctSound )
			event.target.text = ""
			-- give a ponit to the user
			points = points + 1
			-- update the text
			pointsText.text = "Points: " .. points

		else incorrectObject.isVisible = true
			timer.performWithDelay( 1500, HideIncorrect)
			audio.play( incorrectSound )
			event.target.text = ""
		end

	end
end

----------------------------------------------------------------------------------------------
-- OBJECT CREATION	
----------------------------------------------------------------------------------------------

-- displays a question and sets the color
questionObject = display.newText( "", display.contentWidth/3, display.contentHeight/2, nil, 75 )
questionObject:setTextColor( 20/255, 113/255, 235/255 )

-- create the correct answer text object and make it invisible
correctObject = display.newText( "Correct!! :)", display.contentWidth/2, display.contentHeight*2/3, nil, 50)
correctObject:setTextColor(15/255, 243/255, 45/255)
correctObject.isVisible = false

-- create the incorrect answer text object and make it invisible
incorrectObject = display.newText( "Incorrect. :(", display.contentWidth/2, display.contentHeight*2/3, nil, 50)
incorrectObject:setTextColor(245/255, 10/255, 10/255)
incorrectObject.isVisible = false

-- create a numeric text field
numericField = native.newTextField( display.contentWidth*3/5, display.contentHeight/2, 200, 80)
numericField.inputType = "number"

-- add the event listener for the numeric field
numericField:addEventListener( "userInput", NumericFieldListener )

----------------------------------------------------------------------------------------------------
-- FUNCTION CALLS
----------------------------------------------------------------------------------------------------

-- call the function to ask the question
AskQuestion()
