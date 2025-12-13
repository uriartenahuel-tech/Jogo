extends RigidBody2D

@export var speed := 100.0
@export var rotation_speed := 10.0 # radians/segundo (probá 5, 10, 20)

var direction := Vector2.ZERO

func _ready():
	gravity_scale = 0
	angular_velocity = rotation_speed

func _physics_process(_delta):
	linear_velocity = direction * speed
