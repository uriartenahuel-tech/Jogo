extends CharacterBody2D

var speed = 70

func _ready() -> void:
	pass

func _physics_process(delta: float) -> void:
	move_and_slide()
	pass
