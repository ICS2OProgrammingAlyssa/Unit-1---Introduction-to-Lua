-- Ttle: AreaofRectangleAndCircle
-- Name: Alyssa
-- Course: ICS2O/3C
-- This program displays a circle and shows its area 
-----------------------------------------------------------------------------------------

-- Your code here

-- create my local variables
local areaText
local textSize = 50
local myCircle
local PI = 3.14
local radiusOfCircle = 169
local areaOfCircle

-- set the background color of my screen. colors are between 0 and 1
display.setDefault("background", 240/255, 255/255, 240/255)

-- to remove status bar
display.setStatusBar(display.HiddenStatusBar)
-- draw the circle that is half the width and height of the screen size.
myCircle = display.newCircle(0, 0, radiusOfCircle)


-- anchor the circle in the top left corner of the screen and set its (x,y) position
myCircle.anchorX = 0
myCircle.anchorY = 0 
myCircle.x = 20
myCircle.y = 20

-- set the width of the border
myCircle.strokeWidth = 14

-- set the color of the circle
myCircle:setFillColor(1, 0.7, 0.7)

-- set color of the border
myCircle:setStrokeColor(0.3, 0.3, 0.3)

-- calculate the area
areaOfCircle = radiusOfCircle * radiusOfCircle * PI

-- write the text on the screen
areaText = display.newText("The area of this circle with a radius of \n" ..
	radiusOfCircle .. " is " ..
	areaOfCircle .. "pixels squared.",0, 0, Arial, textSize)

-- anchor the text and set its (x,y) position.
areaText.anchorY = 0
areaText.anchorX = 0
areaText.x = 20
areaText.y = display.contentHeight/2

-- set the color of the new text
areaText:setTextColor(0, 0, 0)