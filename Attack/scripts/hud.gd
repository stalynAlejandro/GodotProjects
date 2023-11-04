extends Control

@onready var score = $Score
@onready var life = $LifeLabel

func setScoreLabel(newScore):
	score.text = "SCORE: " + str(newScore)

func setLivesLabel(newLife):
	life.text = str(newLife)
	
