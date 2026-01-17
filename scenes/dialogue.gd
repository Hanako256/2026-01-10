extends Node2D
var txt: String = ""
var tween: Tween = create_tween()

func _ready():
	pass

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("hit_note"):
		$Typewriter.typing_speed = 20.0
		$Typewriter.typewrite("It's always been 'P03 do this!' 'P03 do that!' Well now who's the tutorial man? Who's the tutorial man? It's me golden freddy.")
