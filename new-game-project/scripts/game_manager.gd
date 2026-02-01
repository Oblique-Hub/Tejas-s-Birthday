extends Node

class_name game_manager

@onready var health_2d: AnimatedSprite2D = $Area2D/AnimatedSprite2D

signal player_on_stone
signal player_not_on_stone
signal player_on_lava
signal player_not_on_lava
signal player_on_ice
signal player_not_on_ice
signal sword_swing
signal enemy_dead
signal take_poison_damage
signal stop_poison_damage
signal health_regen
signal death_of_player
signal ladder
signal not_ladder
signal level_cleared
signal red_mask
signal green_mask
signal blue_mask

var red_mask_vis : bool
var green_mask_vis : bool
var blue_mask_vis : bool

var health : float = 100

var scene_points : Array = []
var dead_enemies : Dictionary = {}
var scenes : Dictionary = {}


func scene_path_points(coin_node_name: String, scene_path: String):
	var unique_id = scene_path + "/" + coin_node_name
	if not unique_id in scene_points:
		scene_points.append(unique_id)
		
func mark_enemy_dead(id: String):
	if dead_enemies.has(id):
		return
	dead_enemies[id] = true
	await get_tree().process_frame 
	var all_nodes = get_tree().get_nodes_in_group("enemies")
	var still_alive = 0
	for node in all_nodes:
		if node is enemy_eye:
			var enemy_id = get_tree().current_scene.scene_file_path + "/" + node.name
			if not dead_enemies.has(enemy_id):
				still_alive += 1
	print("Enemy confirmed dead: ", id)
	print("Enemies remaining: ", still_alive)
	if still_alive == 0:
		print("Room Clear! Signaling level_cleared...")
		level_cleared.emit()
		
func get_living_enemy_count() -> int:
	var count = 0
	for enemy in get_tree().get_nodes_in_group("enemies"):
		if not enemy.is_queued_for_deletion():
			count += 1
	return count
	
func damage(amount : float) -> void:
	health -= amount
	health = max(health, 0)
	print(health)
	if (health <= 0):
		emit_signal("death_of_player")
	
# Add this variable to your existing script
var current_scene_path : String = ""

# Add this function
func register_current_scene() -> void:
	var tree = get_tree()
	if tree and tree.current_scene:
		current_scene_path = tree.current_scene.scene_file_path
		if not scenes.has(current_scene_path):
			scenes[current_scene_path] = {
				"visited": true,
				"enemies_cleared": 0,
				"chests_opened": []
			}
		print("Registered scene: ", current_scene_path)
		
func get_enemy_count() -> int:
	return get_tree().get_nodes_in_group("enemies").size()

func get_all_enemies() -> Array:
	return get_tree().get_nodes_in_group("enemies")
		
func reset_health() -> void:
	health = 100.0
	print("Health reset to: ", health)
	
func player_health() -> float:
	return health
	
func _process(delta: float) -> void:
	if (blue_mask_vis == true):
		emit_signal("blue_mask")
	elif (green_mask_vis == true):
		emit_signal("green_mask")
	elif (red_mask_vis == true):
		emit_signal("red_mask")
