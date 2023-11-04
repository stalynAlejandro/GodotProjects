extends Node2D

signal enemySpawend(enemy_instance)

var enemyScene = preload("res://scenes/enemy.tscn")

@onready var spawnPositions = $SpawnPositions

func spawn_enemy():
	var spawnPositionsArray = spawnPositions.get_children()
	var randomPosition = spawnPositionsArray.pick_random()
	
	var enemyInstance = enemyScene.instantiate()
	enemyInstance.global_position = randomPosition.global_position
	emit_signal("enemySpawend", enemyInstance)
#	add_child(enemyInstance)

func _on_timer_timeout():
	spawn_enemy()
