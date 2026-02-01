extends Area2D

@onready var health_2d: AnimatedSprite2D = $AnimatedSprite2D

func _ready() -> void:
	pass

func _process(delta: float) -> void:
	if (GameManager.health < 100 and GameManager.health >= 90):
		health_2d.visible = true
		if (health_2d.animation != "90") : health_2d.play("90")
	elif (GameManager.health <= 90 and GameManager.health >= 80):
		health_2d.visible = true
		if (health_2d.animation != "80") : health_2d.play("80")
	elif (GameManager.health <= 80 and GameManager.health >= 70):
		health_2d.visible = true
		if (health_2d.animation != "70") : health_2d.play("70")
	elif (GameManager.health <= 70 and GameManager.health >= 60):
		health_2d.visible = true
		if (health_2d.animation != "60") : health_2d.play("60")
	elif (GameManager.health <= 60 and GameManager.health >= 50):
		health_2d.visible = true
		if (health_2d.animation != "50") : health_2d.play("50")
	elif (GameManager.health <= 50 and GameManager.health >= 40):
		health_2d.visible = true
		if (health_2d.animation != "40") : health_2d.play("40")
	elif (GameManager.health <= 40 and GameManager.health >= 30):
		health_2d.visible = true
		if (health_2d.animation != "30") : health_2d.play("30")
	elif (GameManager.health <= 30 and GameManager.health >= 20):
		health_2d.visible = true
		if (health_2d.animation != "20") : health_2d.play("20")
	elif (GameManager.health <= 20 and GameManager.health >= 10):
		health_2d.visible = true
		if (health_2d.animation != "10") : health_2d.play("10")
	elif (GameManager.health <= 10 and GameManager.health >= 0):
		health_2d.visible = true
		if (health_2d.animation != "0") : health_2d.play("0")
		health_2d.visible = false
		return
	else:
		health_2d.visible = false
	
		
