extends CharacterBody2D

class_name Player

@onready var anim: AnimatedSprite2D = $AnimatedSprite2D
@export var speed : float = 50



func _physics_process(_delta: float) -> void:
	var input = Input.get_vector("left", "right", "up", "down")
	velocity = input * speed
	move_and_slide()

func play_animation(anim_name: String) -> void:
	if anim.animation != anim_name or !anim.is_playing():
		anim.play(anim_name)
		
func current_animation() -> String:
	return anim.animation

func is_animation_finished() -> bool:
	return anim.frame == anim.sprite_frames.get_frame_count(anim.animation) - 1 
