extends enemy_eye

var player_ref: CharacterBody2D = null

func _on_poison_detection_body_entered(body: Node2D) -> void:
	if body.name == "player":
		body.poison_duration = 3.0

func _on_poison_detection_body_stay(body: Node2D) -> void:
	if body.name == "player":
		body.poison_duration = 3.0
		
