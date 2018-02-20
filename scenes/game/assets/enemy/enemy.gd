extends KinematicBody2D

# Player node to track
var player
# Sprite frames node to animate
onready var spriteFrames = get_node("enemySprite")
# Move speed
var moveSpeed
# Max acceleration
var maxAccel
# Movement direction enum
enum direction { RIGHT, LEFT }
# Movement direction
var dir = direction.RIGHT
# Current speed
var curSpeed = 0.0
# Dampening
var dampening
# Y acceleration
var yAccel

func _ready():
	pass

func create(toFollow, inMoveSpeed, inMaxAccel, inDampening, inYAccel):
	player = toFollow
	moveSpeed = inMoveSpeed
	maxAccel = inMaxAccel
	dampening = inDampening
	yAccel = inYAccel
	# Make movespeed faster than the dampening
	moveSpeed = moveSpeed + dampening
	set_process(true)

func _process(delta):
	# Get the direction
	dir = getMovementDirection(player)
	if(dir == direction.LEFT):
		# Move right on screen, left to the enemy
		curSpeed += moveSpeed
	if(dir == direction.RIGHT):
		# Move left on screen, right to the enemy
		curSpeed -= moveSpeed
	# Clamp the movespeed
	curSpeed = clamp(curSpeed, -maxAccel, maxAccel)
	# Dampen the curspeed
	curSpeed = subtractCurSpeed(curSpeed, dampening)
	# Move the curspeed
	move_and_collide(Vector2(curSpeed,yAccel))
	# If it's out of bounds...
	if(get_position().y > OS.get_window_size().y):
		# Add more score
		score.setScore(score.getScore()+1)
		# Destroy itself!
		queue_free()

# Brings inCurSpeed closer to zero based on damp, then returns it
func subtractCurSpeed(inCurSpeed, damp):
	if( inCurSpeed <= damp && inCurSpeed >= -damp ):
		return 0.0
	if(inCurSpeed > 0):
		inCurSpeed -= damp
	elif(inCurSpeed < 0):
		inCurSpeed += damp
	return inCurSpeed

# Get movement direction based on player position
func getMovementDirection(plyr):
	if( plyr.get_position().x+plyr.get_sprite_size().x/2+$enemySprite.get_sprite_frames().get_frame("move",0).get_width()  > get_position().x ):
		return direction.LEFT
	else:
		return direction.RIGHT

# Gets sprite width
func get_sprite_width():
	return $enemySprite.get_sprite_frames().get_frame("move", 0).get_width()