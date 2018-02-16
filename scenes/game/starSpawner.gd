extends Node2D

# -- creikey
# Spawns stars given an input star node

# The star path to spawn
export (PackedScene) var star
# The range of values to wait in seconds for
export var spawnDelay = Vector2(0.0, 1.0)
# The range of sizes 
export var spawnSizeRange = Vector2(0.75, 1.5)
# The range of colors ( from black == 0.0 to white == 1.0 )
export var spawnColorRange = Vector2(0.0, 1.0)
# The star size
export var starBaseSize = Vector2(50,100)
# The star speed range
export var starSpeedRange = Vector2(1.0, 5.0)

# The spawn timer
var timer = Timer.new()

# The star node used in programming
#onready var star = load(star)

func _ready():
	timer.set_wait_time(rand_range(spawnDelay.x, spawnDelay.y))
	add_child(timer)
	timer.connect( "timeout", self, "_spawnStar" )
	timer.start()

func wait_spawn_seconds(tmr, sec):
	tmr.set_wait_time(sec)
	tmr.start()
	yield(tmr, "timeout")
	tmr.stop()

# Spawns star
func _spawnStar():
	timer.stop()
	var toSpawn = star.instance()
	var starSpeed = rand_range(starSpeedRange.x, starSpeedRange.y)
	var starGreyScale = rand_range(spawnColorRange.x, spawnColorRange.y)
	var starColor = Color(starGreyScale, starGreyScale, starGreyScale)
	var starSize = starBaseSize*rand_range(spawnSizeRange.x, spawnSizeRange.y)
	var initPosition = Vector2(rand_range( 0.0, OS.get_window_size().x ) - starSize.x/2, -starSize.y)
	var yLimit = OS.get_window_size().y+starSize.y
	toSpawn.create( starSpeed, starColor, starSize, initPosition, yLimit )
	add_child( toSpawn )
	timer.set_wait_time(rand_range(spawnDelay.x, spawnDelay.y))
	timer.start()

#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass
