extends Node

class_name game_manager

signal player_on_stone
signal player_not_on_stone
signal player_on_lava
signal player_not_on_lava
signal player_on_ice
signal player_not_on_ice
signal sword_swing
signal enemy_dead

var dead_enemies : Dictionary = {}

func mark_enemy_dead(id: String):
	dead_enemies[id] = true
	emit_signal("enemy_dead")

func _ready() -> void:
	pass


func _on_poison_hit() -> void:
	pass # Replace with function body.
