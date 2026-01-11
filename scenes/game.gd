extends Node2D

func _process(delta: float) -> void:
	var time = $AudioPlayer.get_playback_position() + AudioServer.get_time_since_last_mix()
	time -= AudioServer.get_output_latency()
	var count = time as int
	$dialogue_frame/Dialogue.clear()
	$dialogue_frame/Dialogue.add_text(str(count))
