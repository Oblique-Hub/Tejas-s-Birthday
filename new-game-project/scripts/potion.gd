extends Area2D

class_name potion

@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D

var collected : bool = false

func _ready() -> void:
	animated_sprite_2d.play("idle")
	var unique_id = get_tree().current_scene.scene_file_path + "/" + self.name
	if (GameManager.scene_points.has(unique_id)):
		queue_free()


func _on_body_entered(body: Node2D) -> void:
	if (body.name == "player" and collected):
		return
	collected = true
	GameManager.scene_path_points(self.name, get_tree().current_scene.scene_file_path)
	$CollisionShape2D.call_deferred("set_disabled", true)
	animated_sprite_2d.play("taken")


func _on_animated_sprite_2d_animation_finished() -> void:
	GameManager.emit_signal("health_regen")
	if animated_sprite_2d.animation == "taken":
		queue_free()
