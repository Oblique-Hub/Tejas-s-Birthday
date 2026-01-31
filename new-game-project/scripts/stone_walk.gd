extends Area2D

class_name stone_walk_sound

@onready var sprite_2d: Sprite2D = $Sprite2D

func _on_body_entered(body: Node2D) -> void:
	if (body.name == "player"):
		print("found_player")
		GameManager.emit_signal("player_on_stone")
		

func _on_body_exited(body: Node2D) -> void:
	if (body.name == "player"):
		GameManager.emit_signal("player_not_on_stone")
		
func _process(delta: float) -> void:
	pass
