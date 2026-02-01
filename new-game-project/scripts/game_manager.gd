extends Node

class_name game_manager

@onready var health_2d: AnimatedSprite2D = $Area2D/AnimatedSprite2D

signal player_on_stone
signal player_not_on_stone
signal player_on_lava
signal player_not_on_lava
signal player_on_ice
signal player_not_on_ice
signal sword_swing
signal enemy_dead
signal take_poison_damage
signal stop_poison_damage
signal health_regen

var health : float = 100

var scene_points : Array = []
var dead_enemies : Dictionary = {}


func scene_path_points(coin_node_name: String, scene_path: String):
	var unique_id = scene_path + "/" + coin_node_name
	if not unique_id in scene_points:
		scene_points.append(unique_id)
		

func mark_enemy_dead(id: String):
	dead_enemies[id] = true
	emit_signal("enemy_dead")
	
func damage(amount : float) -> void:
	health -= amount
	health = max(health, 0)
	print(health)
	
func player_health() -> float:
	return health
