extends Area2D

@export var speed = 300

func _physics_process(delta):
	global_position.x += speed*delta # how many pixels per seconds
	print(speed*delta)
	# 120px 60fps by 2 each frame, after 60 frames we move 120px
	# 120px 30fps  by 4 each frame, at the end of 30 frames we move 120 px
	
