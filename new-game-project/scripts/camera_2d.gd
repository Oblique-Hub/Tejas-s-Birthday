extends Camera2D
@export var player: CharacterBody2D

@export var look_ahead_distance := 12.0
@export var follow_speed := 10.0

func _process(delta: float) -> void:
	var target := player.global_position + player.velocity.normalized() * look_ahead_distance
	global_position = global_position.lerp(target, delta * follow_speed)
