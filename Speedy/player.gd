extends RigidBody2D

func _ready():
	print(add(5,59))

func _physics_process(delta):
	var force = 1000
	if Input.is_action_pressed("move_right"):
		apply_force(Vector2(force, 0))
	if Input.is_action_pressed("move_left"):
		apply_force(Vector2(-force, 0))
	if Input.is_action_pressed("move_up"):
		apply_force(Vector2(0, -force))
	if Input.is_action_pressed("move_down"):
		apply_force(Vector2(0, force))
	if Input.is_action_pressed("stop"):
		print('stop')
		print(linear_velocity)
		get_node(".").set_linear_velocity(Vector2(0,0))
		apply_central_force(Vector2(0, 0))

func add(num1, num2):
	return num1 + num2


func _on_area_2d_body_exited(body):
	get_tree().reload_current_scene()
