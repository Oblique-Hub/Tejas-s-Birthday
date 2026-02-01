extends CanvasLayer

@onready var without_mask_1: Panel = $"without mask 1"
@onready var without_mask_2: Panel = $"without mask 2"
@onready var without_mask_3: Panel = $"without mask 3"
@onready var mask_1: Panel = $"mask 1"
@onready var mask_2: Panel = $"mask 2"
@onready var mask_3: Panel = $"mask 3"

func _on_game_manager_blue_mask() -> void:
	without_mask_2.visible = false
	mask_2.visible = true
	GameManager.blue_mask_vis = true


func _on_game_manager_green_mask() -> void:
	without_mask_3.visible = false
	mask_3.visible = true
	GameManager.green_mask_vis = true


func _on_game_manager_red_mask() -> void:
	without_mask_1.visible = false
	mask_1.visible = true
	GameManager.red_mask_vis = true

func _ready() -> void:
	mask_1.visible = false
	mask_2.visible = false
	mask_3.visible = false
	GameManager.green_mask.connect(_on_game_manager_green_mask)
	GameManager.red_mask.connect(_on_game_manager_red_mask)
	GameManager.blue_mask.connect(_on_game_manager_blue_mask)
