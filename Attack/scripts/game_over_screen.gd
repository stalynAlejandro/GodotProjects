extends Control

func setScore(newScore):
	$Panel/Score.text = "SCORE: " + str(newScore)
	

func _on_button_pressed():
	get_tree().reload_current_scene()
