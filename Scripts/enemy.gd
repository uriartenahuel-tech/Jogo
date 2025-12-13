extends CharacterBody2D

@onready var anim := $AnimatedSprite2D

func _ready():
	anim.play("idle")
	$Timer.timeout.connect(fire)
	$Timer.start() 



const PROYECTIL = preload("res://Scenes/proyectil.tscn")

func fire():
	
	var player = get_tree().get_first_node_in_group("player")
	if player == null:
		return

	var roc = PROYECTIL.instantiate()
	get_tree().current_scene.add_child(roc)


	var dir = (player.global_position - $ShootPoint.global_position).normalized()


	roc.global_position = $ShootPoint.global_position + dir * 8
	roc.direction = dir
	
	




 
