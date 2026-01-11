extends Area2D
@export var reg_speed: = 200
var speed = reg_speed
var slow_speed = reg_speed * 0.4
var acceleration = 1
@export var acc_mult = 1.005
var velocity = Vector2.ZERO

func _process(delta: float) -> void:
	
	if (Input.is_action_pressed("move_up")):
		velocity.y = -speed * acceleration
		acceleration *= acc_mult
	if (Input.is_action_pressed("move_down")):
		velocity.y = speed * acceleration
		acceleration *= acc_mult
		
	if (Input.is_action_pressed("slow")):
		speed = slow_speed
	else:
		speed = reg_speed
	if(!Input.is_action_pressed("move_up") and !Input.is_action_pressed("move_down")):
		velocity.y = 0
	if (Input.is_action_just_pressed("move_down") or Input.is_action_just_pressed("move_up")):
		acceleration = 1

	position += velocity * delta



func _on_area_entered(area: Area2D) -> bool:
	return true
