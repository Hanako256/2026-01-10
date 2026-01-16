extends Node2D
var text: String = "Yep, I'm P03. OK?"
var tween: Tween = create_tween()

func _ready():
	pass

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("hit_note"):
		$DialogueText.clear()
		$Typewriter.clear()
		$Typewriter.add_text("Okay, I'm done my gloating!")
		tween.tween_property($Typewriter, "visible_ratio", 1.0, 2.0).from(0.0)
		#$Typewriter.add_text("It's always been 'P03 do this!' 'P03 do that!' Well, now, who's the tutorial man? Who's the tutorial man? It's me.")
