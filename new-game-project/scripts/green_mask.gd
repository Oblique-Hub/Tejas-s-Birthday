extends Area2D

@onready var sprite_2d: Sprite2D = $Sprite2D

func _on_body_entered(body: Node2D) -> void:
	if (body.name == "player"):
		GameManager.emit_signal("green_mask")
		print("green_working")
		

func _on_body_exited(body: Node2D) -> void:
	queue_free()
