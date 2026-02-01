extends Area2D

class_name sword

signal enemy_hit
signal sword_direction
signal not_enemy_hit

var targets : Array[enemy_eye] = []

var mouse_position
var can_hit : bool = false
var allowed_to_hit : bool = false

var sword_direction_vector

@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D

func facing() -> void:
	Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)
	mouse_position = get_global_mouse_position()
	look_at(mouse_position)
	sword_direction_vector = (mouse_position - global_position).normalized()
	emit_signal("sword_direction", sword_direction_vector)

func _on_body_entered(body: Node2D) -> void:
	if (body is enemy_eye):
		if not targets.has(body):
			targets.append(body)
		print("Enemy added to target list. Count: ", targets.size())
		
func attacking() -> void:
	if (targets.size() > 0):
		if Input.is_action_just_pressed("attack"):
			GameManager.emit_signal("sword_swing")
			animated_sprite_2d.play("swing")
			for enemy in targets:
				if (is_instance_valid(enemy)):
					enemy._on_player_hitting_enemy(sword_direction_vector)
			emit_signal("enemy_hit")
			
func _on_player_attack_entered() -> void:
	animated_sprite_2d.visible = true
	allowed_to_hit = true
	
func _on_player_attack_exited() -> void:
	animated_sprite_2d.visible = false
	allowed_to_hit = false
	
func _on_body_exited(body: Node2D) -> void:
	if (body is enemy_eye):
		targets.erase(body)
		print("Enemy removed. Remaining: ", targets.size())
	
func _ready() -> void:
	animated_sprite_2d.visible = false

func _process(delta: float) -> void:
	if (allowed_to_hit):
		facing()
		attacking()
	else:
		return
