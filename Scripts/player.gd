extends CharacterBody2D

var speed = 1000
var direction = "right"



func _physics_process(delta: float) -> void:
	if Input.is_action_pressed("ui_right"):
		direction = "right"
		player_animation(1)
		velocity.x = speed * delta
		velocity.y = 0
	elif Input.is_action_pressed("ui_left"):
		direction = "left"
		player_animation(1)
		velocity.x = -speed * delta
		velocity.y = 0
	elif Input.is_action_pressed("ui_up"):
		player_animation(1)
		velocity.x = 0
		velocity.y = -speed * delta
	elif Input.is_action_pressed("ui_down"):
		player_animation(1)
		velocity.x = 0
		velocity.y = speed * delta
	else:
		player_animation(0)
		velocity.x = 0
		velocity.y = 0
	move_and_slide()


func player_animation(movement):
	
	if direction == "right" :
		$AnimatedSprite2D.flip_h = false
	elif direction == "left":
		$AnimatedSprite2D.flip_h = true
	if movement == 1:
		$AnimatedSprite2D.play("walk")
	else:
		$AnimatedSprite2D.play("idle")
		
