extends CharacterBody2D

var move_direction : Vector2
var wander_time : float
var speed : float = 1000

func _ready() -> void:
	randomize_wander()

func _physics_process(delta: float) -> void:
	update_wander(delta)
	velocity = move_direction * speed

func randomize_wander():
	move_direction = Vector2(randf_range(-1,1),randf_range(-1,1)).normalized()
	wander_time = randf_range(1,3)

func update_wander(meme):
	if (wander_time > 0):
		wander_time -= meme
	else:
		randomize_wander()
