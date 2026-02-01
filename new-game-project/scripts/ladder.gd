extends Area2D

func _on_body_entered(body: Node2D) -> void:
	GameManager.emit_signal("ladder")
	
func _on_body_exited(body: Node2D) -> void:
	GameManager.emit_signal("not_ladder")
