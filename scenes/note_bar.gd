extends Area2D
var velocity = Vector2.ZERO
@export var speed = 20

func _process(delta: float) -> void:
	velocity.x = -speed
	position += velocity * delta
