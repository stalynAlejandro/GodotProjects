extends Area2D

@export var speed = 300
@onready var visibleNotifier = $VisibleNotifier
 
func _ready():
	visibleNotifier.connect("screen_exited", _on_screen_exited)

func _physics_process(delta):
	global_position.x -= speed*delta # how many pixels per seconds

func _on_screen_exited():
	queue_free()

func die():
	queue_free()
