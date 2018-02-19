extends Label

func _ready():
	set_text("Score: " + str(score.getScore()))
	score.connect("scoreChanged", self, "onScoreChange")

func onScoreChange(inScore):
	set_text("Score: " + str(inScore))
