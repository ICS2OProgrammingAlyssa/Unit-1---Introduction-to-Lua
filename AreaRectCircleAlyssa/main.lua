-- Ttle: AreaofRectangleAndCircle
-- Name: Alyssa
-- Course: ICS2O/3C
-- This program displays a circle and shows its area 
-----------------------------------------------------------------------------------------

-- Your code here

-- create my local variables
local areaTextCircle
local textSize = 45
local myCircle
local PI = 3.14
local radiusOfCircle = 169
local areaOfCircle
local myRectangle
local areaTextRectangle
local widthOfRectangle = 300
local heightOfRectangle = 269
local areaOfRectangle


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
areaTextCircle = display.newText("The area of the circle with a radius of \n" ..
	radiusOfCircle .. " is " ..
	areaOfCircle .. "pixels squared.", 0, 0, Arial, textSize)

-- anchor the text and set its (x,y) position.
areaTextCircle.anchorY = 0
areaTextCircle.anchorX = 0
areaTextCircle.x = 20
areaTextCircle.y = display.contentHeight/2

-- set the color of the new text
areaTextCircle:setTextColor(0, 0, 0)

-- draw the rectangle 
myRectangle = display.newRect(0, 0, widthOfRectangle, heightOfRectangle)

-- anchor the rectangle 
myRectangle.anchorX = 0
myRectangle.anchorY = 0
myRectangle.x = 550
myRectangle.y = 50

-- set the width of the border
myRectangle.strokeWidth = 14

-- set the color of the rectangle
myRectangle:setFillColor(175/225, 147/225, 199/255)

-- set the color of the boerder
myRectangle:setStrokeColor(174/255, 174/255, 174/255)

-- calculate the area
areaOfRectangle = widthOfRectangle * heightOfRectangle

-- write the area on the screen. 
areaTextRectangle = display.newText("The area of the rectangle with a width of \n" ..
	widthOfRectangle .. " and a height of " .. heightOfRectangle .. " is " ..
	areaOfRectangle .. " pixels squared.", 0, 0, Arial, textSize)

-- anchor the text and set its (x,y) posistion
areaTextRectangle.anchorX = 0
areaTextRectangle.anchorY = 0
areaTextRectangle.x = 20
areaTextRectangle.y = 500
-- set the color of the text
areaTextRectangle:setTextColor(0, 0, 0)