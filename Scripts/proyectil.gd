extends RigidBody2D

@export var speed := 100.0
@export var rotation_speed := 10.0 # radians/segundo (probá 5, 10, 20)
@export var visibleOnScreen : VisibleOnScreenNotifier2D
@export var zona : Area2D

var direction := Vector2.ZERO

func _ready():
	gravity_scale = 0
	angular_velocity = -rotation_speed

func _physics_process(_delta):
	linear_velocity = direction * speed
	_visible()


func _visible():
	if (visibleOnScreen.is_on_screen() == false):
		queue_free()

func _on_body_entered(body: Node) -> void:
	if (body.is_in_group("player")):
		queue_free()
