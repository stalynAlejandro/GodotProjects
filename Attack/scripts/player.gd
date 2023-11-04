extends CharacterBody2D

signal took_damage

var rocketScene = preload("res://scenes/rocket.tscn")

@onready var rocketContainer = $RocketContainer #get_node("RocketContainer")

func shoot():
	var rocketInstance = rocketScene.instantiate()
	rocketInstance.global_position = global_position
	rocketInstance.global_position.x += 70
	rocketContainer.add_child(rocketInstance)

func _process(delta):
	if Input.is_action_just_pressed("shoot"):
		shoot()

func _physics_process(delta):
	var speed = 400
	velocity = Vector2(0,0)
	if Input.is_action_pressed("move_right"):
		velocity.x = speed
	if Input.is_action_pressed("move_left"):
		velocity.x = -speed 
	if Input.is_action_pressed("move_up"):
		velocity.y = -speed
	if Input.is_action_pressed("move_down"):
		velocity.y = speed

	move_and_slide()
	
	var screen_size = get_viewport_rect().size
	global_position = global_position.clamp(Vector2(0,0), screen_size)

func take_damage():
	emit_signal("took_damage")
	
func die():
	queue_free()
