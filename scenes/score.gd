extends Node

signal scoreChanged(newScore)

var score = 0

func _ready():
	pass

func setScore(inScore):
	score = inScore
	emit_signal("scoreChanged", score)

func getScore():
	return score