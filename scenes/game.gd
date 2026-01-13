extends Node2D
var score
var bpm = 120
var song_position = 0.0
var song_pos_in_beats = 0
var last_spawned_beat = 0
var sec_per_beat = 60.0 / bpm


func _process(delta: float) -> void:
	var time = $AudioPlayer.get_playback_position() + AudioServer.get_time_since_last_mix()
	time -= AudioServer.get_output_latency()
	var count = time as int
	$dialogue_frame/Dialogue.clear()
	$dialogue_frame/Dialogue.add_text(str(count))
	if $Player.position.y < $Player_Bounds_Up.position.y:
		$Player.move_up_allowed = false
	if $Player.position.y > $Player_Bounds_Down.position.y:
		$Player.move_down_allowed = false
		
	if $Player.position.y > $Player_Bounds_Up.position.y:
		$Player.move_up_allowed = true
	if $Player.position.y < $Player_Bounds_Down.position.y:
		$Player.move_down_allowed = true
