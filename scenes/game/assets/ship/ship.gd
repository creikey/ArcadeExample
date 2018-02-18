extends KinematicBody2D

# Movespeed
export var moveSpeed = 10.0

# The sprite node
onready var sprite = get_node("shipSprite")
# The are node
onready var area = get_node("deathArea")

func _ready():
	area.connect("body_entered", self, "body_enter" )
	# Start processing
	set_process(true)

func _process(delta):
	# Go to default not moving frame
	sprite.set_frame( 0 )
	# Move left if left key is pressed
	if( Input.is_action_pressed("ui_left") ):
		move_and_collide(Vector2(-moveSpeed,0))
		sprite.set_frame(1)
	# Move right if right key is pressed
	if( Input.is_action_pressed("ui_right") ):
		move_and_collide(Vector2(moveSpeed,0))
		sprite.set_frame(2)

# Manages entry
func body_enter(obj):
	if(obj.is_in_group("enemies")):
		obj.queue_free()
		queue_free()

# Returns player's size
func get_sprite_size():
	return $shipSprite.get_sprite_frames().get_frame("move", 0).get_width()