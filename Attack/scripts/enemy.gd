extends Area2D

signal died

@export var speed = 300
@onready var visibleNotifier = $VisibleNotifier
 
func _ready():
	visibleNotifier.connect("screen_exited", _on_screen_exited)

func _physics_process(delta):
	global_position.x -= speed*delta # how many pixels per seconds

func _on_screen_exited():
	queue_free()

func die():
	emit_signal("died")
	queue_free()

func _on_body_entered(body): # Body is a physics
	body.take_damage()
	die()
