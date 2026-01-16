extends AnimatedSprite2D
@export var reg_speed: = 250
var speed = reg_speed
var slow_speed = reg_speed * 0.4
var acceleration = 1
@export var acc_mult = 1.007
var velocity = Vector2.ZERO
var move_up_allowed:bool = true
var move_down_allowed:bool = true

var perfect:bool = false
var good:bool = false
var okay:bool = false
var current_note = null
var score = 0

var add_perfect = 5
var add_good = 3
var add_okay = 1

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("hit_note"):
		play("hit")
		$HitAnimationTimer.start()
		if  current_note != null:
			if perfect:
				score += add_perfect
				$GainPoints.text = "+ " + str(add_perfect)
				$PointsTimer.start()
			elif good:
				score += add_good
				$GainPoints.text = "+ " + str(add_good)
				$PointsTimer.start()
			elif okay:
				score += add_okay
				$GainPoints.text = "+ " + str(add_okay)
				$PointsTimer.start()
	
	if (Input.is_action_pressed("move_up") and move_up_allowed):
			velocity.y = -speed * acceleration
			acceleration *= acc_mult
	if (Input.is_action_pressed("move_down")):
			velocity.y = speed * acceleration
			acceleration *= acc_mult
		
	if (Input.is_action_pressed("slow")):
		speed = slow_speed
		#acceleration = 1
	else:
		speed = reg_speed
	if(!Input.is_action_pressed("move_up") and !Input.is_action_pressed("move_down")):
		velocity.y = 0
	if (Input.is_action_just_pressed("move_down") or Input.is_action_just_pressed("move_up")):
		acceleration = 1
	
	if (!move_down_allowed):
		if (velocity.y > 0):
			velocity.y = 0
	
	if (!move_up_allowed):
		if (velocity.y < 0):
			velocity.y = 0
	position += velocity * delta

func reset():
	current_note = null
	perfect = false
	good = false
	okay = false
#OkayArea functions
func _on_OkayArea_entered(area: Area2D) -> void:
	if area.is_in_group("note"):
		okay = true
		current_note = area

func _on_OkayArea_exited(area: Area2D) -> void:
	if area.is_in_group("note"):
		okay = false
		current_note = null

#GoodArea functions
func _on_GoodArea_entered(area: Area2D) -> void:
	if area.is_in_group("note"):
		good = true

func _on_GoodArea_exited(area: Area2D) -> void:
	if area.is_in_group("note"):
		good = false

#PerfectArea functions
func _on_PerfectArea_entered(area: Area2D) -> void:
	if area.is_in_group("note"):
		perfect = true

func _on_PerfectArea_exited(area: Area2D) -> void:
	if area.is_in_group("note"):
		perfect = false


func _on_hit_animation_timeout() -> void:
	play("default")


func _on_points_timeout() -> void:
	$GainPoints.text = ""
