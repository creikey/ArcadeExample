extends KinematicBody2D

# Movespeed
export var moveSpeed = 10.0

# The sprite node
onready var sprite = get_node("shipSprite")

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	set_process(true)

func _process(delta):
	sprite.set_frame( 0 )
	if( Input.is_action_pressed("ui_left") ):
		move_and_collide(Vector2(-moveSpeed,0))
		sprite.set_frame(1)
	if( Input.is_action_pressed("ui_right") ):
		move_and_collide(Vector2(moveSpeed,0))
		sprite.set_frame(2)
		# print("Left was pressed!")
		
	# InputMap.get_action_list( "ui_up" )

#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass
