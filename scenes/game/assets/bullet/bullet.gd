extends KinematicBody2D

# The delta in the bullet's movement per frame 
var bulletDelta = Vector2()
# The bullet's initial size
var bulletInitSize = 1.0
# The bullet's size delta
var bulletSizeDelta = -0.01

# The bullet's sprite
onready var bulletSprite = get_node("bulletSprite")

func _ready():
	pass

func create(inBulletDelta, inBulletInitSize, inBulletSizeDelta):
	# Set class variables
	bulletDelta = inBulletDelta
	bulletInitSize = inBulletInitSize
	bulletSizeDelta = inBulletSizeDelta
	# Start processing
	set_process(true)

func _process(delta):
	move_and_collide(bulletDelta)
	bulletSprite.set_scale(bulletSprite.get_scale()+bulletSizeDelta)
	if( bulletSprite.get_scale().x <= 0 ):
		queue_free()