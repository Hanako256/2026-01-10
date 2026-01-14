extends Node2D
var score
var bpm = 120
var song_position = 0.0
var song_pos_in_beats = 0
var last_spawned_beat = 0
var sec_per_beat = 60.0 / bpm
var OG_pos = 0

func _ready():
	OG_pos = $NoteBar.position.x

func _process(delta: float) -> void:
	var time = $AudioPlayer.get_playback_position() + AudioServer.get_time_since_last_mix()
	time -= AudioServer.get_output_latency()
	if(Input.is_action_just_pressed("hit_note")):
		if($Player.okay):
			$Player.current_note.destroy()
	
	var count = time as int
	if $Player.position.y < $Player_Bounds_Up.position.y:
		$Player.move_up_allowed = false
	if $Player.position.y > $Player_Bounds_Down.position.y:
		$Player.move_down_allowed = false
		
	if $Player.position.y > $Player_Bounds_Up.position.y:
		$Player.move_up_allowed = true
	if $Player.position.y < $Player_Bounds_Down.position.y:
		$Player.move_down_allowed = true

func _note_hit():
	pass
