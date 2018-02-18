extends Node2D

# -- creikey
# Bassic enemy spawner

# The enemy path to spawn
export (PackedScene) var enemy
# The ship
export (NodePath) var ship

# The spawn timer
var timer = Timer.new()

func _ready():
	timer.set_wait_time(1.0)
	add_child(timer)
	timer.connect("timeout", self, "spawnEnemy")
	timer.start()

func spawnEnemy():
	timer.stop()
	var en = enemy.instance()
	en.create(get_node(ship))
	en.set_position(Vector2(rand_range(0.0, OS.get_window_size().x-en.get_sprite_width()-10), 0))
	add_child(en)
	timer.start()