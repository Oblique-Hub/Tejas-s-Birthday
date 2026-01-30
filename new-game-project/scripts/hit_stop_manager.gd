extends Node

class_name hit_stop_manager

func hit_stop() -> void:
	Engine.time_scale = 0
	await get_tree().create_timer(0.10, true, false, true).timeout
	Engine.time_scale = 1
