extends Node2D

var lives = 1
var score = 0

@onready var player = $Player
@onready var hud = $UI/HUD
@onready var ui = $UI
@onready var enemyHitSound = $EnemyHitSound
@onready var playerHitSound = $PlayerHitSound

var gosScene = preload("res://scenes/game_over_screen.tscn")

func _ready():
	hud.setScoreLabel(score)
	hud.setLivesLabel(lives)

func _on_player_took_damage():
	playerHitSound.play()
	lives -= 1
	hud.setLivesLabel(lives)
	
	if lives == 0:
		player.die()
		
		await get_tree().create_timer(1.5).timeout
		
		var gos = gosScene.instantiate()
		gos.setScore(score)
		ui.add_child(gos)


func _on_enemy_spawner_enemy_spawend(enemy_instance):
	enemy_instance.connect("died", on_enemy_died)
	add_child(enemy_instance)

func on_enemy_died():
	score += 10
	hud.setScoreLabel(score)
	enemyHitSound.play()
