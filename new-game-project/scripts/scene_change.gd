extends Area2D

class_name scene_change

@export var target_level : PackedScene
var acc: bool

func _on_body_entered(body: Node2D) -> void:
	if (body.name == "CharacterBody2D"):
		var timer = get_tree().create_timer(0.5)
		await timer.timeout
		get_tree().change_scene_to_packed(target_level)
