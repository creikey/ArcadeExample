extends Node2D

# -- creikey
# Bassic enemy spawner

# The enemy path to spawn
export (PackedScene) var enemy
# The ship
export (NodePath) var ship
# The wait time delta
export var waitTimeDelta = -0.05
# The base wait time
export var baseWaitTime = 1.0
# The minimum wait time
export var minWaitTime = 0.2
# The ship speed
export var shipSpeed = 0.05
# The ship max acceleration
export var shipMaxAccel = 15.0
# The ship dampening
export var shipDampening = 1.0
# The ship y yacceleration down the screen
export var shipYAccel = 8.0

# The spawn timer
var timer = Timer.new()

func _ready():
	timer.set_wait_time(baseWaitTime)
	add_child(timer)
	timer.connect("timeout", self, "spawnEnemy")
	timer.start()

func spawnEnemy():
	timer.stop()
	var en = enemy.instance()
	en.create(get_node(ship), shipSpeed, shipMaxAccel, shipDampening, shipYAccel)
	en.set_position(Vector2(rand_range(0.0, OS.get_window_size().x-en.get_sprite_width()-10), 0))
	add_child(en)
	if( timer.get_wait_time() > minWaitTime ):
		timer.set_wait_time(timer.get_wait_time()+waitTimeDelta)
	timer.start()