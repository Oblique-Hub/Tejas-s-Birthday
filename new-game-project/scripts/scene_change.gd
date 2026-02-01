extends Area2D

class_name scene_change

@export var target_level : PackedScene
var acc: bool = false

func _ready() -> void:
	GameManager.level_cleared.connect(_on_game_manager_level_cleared)

func _on_game_manager_level_cleared() -> void:
	acc = true

func _on_body_entered(body: Node2D) -> void:
	if (body.name == "player"):
		if (acc):
			get_tree().change_scene_to_packed(target_level)
		else:
			print("Not allowed")
