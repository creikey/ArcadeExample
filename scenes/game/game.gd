extends Node2D

# The left border for the player
onready var leftBorderShape = get_node("borderLeft/borderLeftCollider").get_shape()
onready var rightBorderShape = get_node("borderRight/borderRightCollider").get_shape()
# Enemy ( for debugging )
onready var enemy = get_node("enemy")


func _ready():
	# Connect the resize window signal to the resize function
	get_tree().get_root().connect("size_changed", self, "resize")
	# Call resize once just to make sure it's updated
	resize()

# Called whenever the window is resized
func resize():
	# Set the collider to the bottom of the screen
	leftBorderShape.set_a(Vector2())
	leftBorderShape.set_b(Vector2(0, OS.get_window_size().y))
	print("Setting left border a to ", leftBorderShape.get_a())
	print("Setting left border b to ", leftBorderShape.get_b())
	# Set the right segment to the right side of the screen
	rightBorderShape.set_a(Vector2(OS.get_window_size().x,0))
	rightBorderShape.set_b(Vector2(OS.get_window_size().x, OS.get_window_size().y))

#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass
