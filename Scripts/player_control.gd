extends Node


@onready var player: Player = get_parent()

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.



enum STATE {
	IDLE,
	WALK,
	ATTACK,
	DEATH,
	HURT
}

var current_state :STATE = STATE.IDLE

func _process(_delta):
	var moving := Input.is_action_pressed("left") or Input.is_action_pressed("right")
	var attack:= Input.is_action_just_pressed("mouse_left")
	match current_state:
		STATE.IDLE:
			player.velocity.x=0
			player.play_animation("idle")
			if moving:
				current_state=STATE.WALK
			elif attack:
				current_state=STATE.ATTACK
			pass
		STATE.WALK:
			player.play_animation("walk")
			if !moving:
				current_state=STATE.IDLE
			elif attack:
				current_state=STATE.ATTACK
			pass
		STATE.ATTACK:
			player.play_animation("attack")
			if player.current_animation() == "attack" and player.is_animation_finished():
				current_state = STATE.WALK if moving else STATE.IDLE
			pass
		STATE.DEATH:
			pass
		STATE.HURT:
			pass
