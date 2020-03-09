
	-- body
-----------------------------------------------------------------------------------------
--
-- main.lua
--
-----------------------------------------------------------------------------------------

-- Your code here
-- print "Hello, world" to the command terminal
print ("****Hello, world!")

-- hide the status bar 
display.setStatusBar(display.HiddenStatusBar)

-- set the color of the background
display.setDefault("background", 255/255, 208/255, 208/255) 

-- create a local variable
local textObject
local textObjectSignature

-- displays text on the screen at position x = 500 and y = 500 with
-- a default font style and font size of 50
textObject = display.newText( "Hi, world!", 500, 250, nil, 100)

-- sets the color of the text 
textObject:setTextColor(107/255, 76/255, 76/255)

-- the signiture 
textSigniture = display.newText("By: Alyssa.", 500, 370, nil, 50)

-- set the color of the sgnature
textSignature:setTextColor(81/255, 81/255, 81/255)
