extends Node2D

# -- creikey
# star creates a scrolling start that moves down as an ambient effect

# The speed at which the star moves down
var starSpeed = 1.0
# The color of the star
var starColor = Color()
# The size of the star
var starSize = Vector2()
# The initial position of the star
var initPosition = Vector2()
# The limit position at which the star will destroy itself
var yLimit = 0.0

# This function runs once when the star is created
func _ready():
	# This create function was used for debugging
	# create( 3, Color(1,0,0), Vector2(100,50), Vector2(200,0), OS.get_window_size().y)
	pass

# This is a custom function used to 'create' the star and add specific parameters
func create( inStarSpeed, inStarColor, inStarSize, inInitPosition, inYLimit ):
	# Change all of the star's settings to the input for the function
	starSpeed = inStarSpeed
	starColor = inStarColor
	starSize = inStarSize
	initPosition = inInitPosition
	yLimit = inYLimit
	# Move to the initial position
	set_position(initPosition)
	# Start processing
	set_process(true)

# Called every frame
func _process(delta):
	# Moves the star down every frame based on the star's speed
	set_position(get_position() + Vector2(0, starSpeed))
	# If the star is out of bounds, destroy the star
	if( get_position().y > yLimit ):
		# print("Destroying star node")
		queue_free()

# Set the limit at which the star will destroy itself
func setYLimit(inYLimit):
	yLimit = inYLimit

# Actually draw the star, or a rectangle with the correct colors and stuff
func _draw():
	draw_rect(Rect2(get_position(), starSize), starColor)