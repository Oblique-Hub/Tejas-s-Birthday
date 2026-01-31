extends Camera2D

class_name camera2D

@export var player: CharacterBody2D

@export var look_ahead_distance := 12.0
@export var follow_speed := 10.0
@onready var camera_2d: camera2D = %Camera2D

var shake_intensity : float = 0.0
var shake_active_time : float = 0.0
var shake_decay : float = 0.0
var shake_time : float = 0.0
var shake_time_speed : float = 20.0
var noise := FastNoiseLite.new()
var offset_value
var running : bool

func _on_player_hit_stop() -> void:
	screen_shake(4, 0.25)

func screen_shake(intensity : int, time : float) -> void:
	randomize()
	noise.seed = randi()
	noise.frequency = 2.0
	shake_intensity = intensity
	shake_active_time = time
	shake_time = 0.0
	
func shaking(_delta : float) -> void:
	if (shake_active_time > 0):
		shake_time += _delta * shake_time_speed
		shake_active_time -= _delta
		offset = Vector2(
			noise.get_noise_2d(shake_time, 0) * shake_intensity,
			noise.get_noise_2d(shake_time, 0) * shake_intensity
		)
		shake_intensity = max(shake_intensity - shake_decay * _delta, 0)
	else:
		offset = lerp(offset, Vector2.ZERO, 10.5 * _delta)
		
func _ready():
	pass

func _process(delta: float) -> void:
	shaking(delta)
	var target := player.global_position + player.velocity.normalized() * look_ahead_distance
	global_position = global_position.lerp(target, delta * follow_speed)
