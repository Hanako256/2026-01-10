extends Area2D
var elevation = 0
@export var speed = 20
var hit = false

const TARGET_X = 45
const SPAWN_X = -20
const DIST_TO_TARGET = TARGET_X - SPAWN_X

func _physics_process(delta: float) -> void:
	if !hit:
		position.x -= speed * delta
		if position.x < 0:
			queue_free()
			print("WORKS!")

func initialize(y):
	position = Vector2(SPAWN_X, y)
	speed = DIST_TO_TARGET / 2.0

func destroy():
	hit = true
	$DeathTimer.start()


func _on_death_timer_timeout():
	print("works")
	queue_free()
