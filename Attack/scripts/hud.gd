extends Control

@onready var score = $Score

func setScoreLabel(newScore):
	score.text = "SCORE: " + str(newScore)
