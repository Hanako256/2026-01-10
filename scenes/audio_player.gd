extends AudioStreamPlayer

@export var bpm = 100
@export var beats = 4

var song_position = 0.0
var song_pos_measures = 1
var seconds_per_measure = 60.0 / bpm
var last_reported_beat = 0
var beats_before_start = 0
var beat = 1

var closest = 0
var time_off_beat = 0.0

signal _beat(position)
signal _measure(position)

func _ready():
	seconds_per_measure = 60.0 / bpm

func _physics_process(delta: float) -> void:
	if playing:
		song_position = get_playback_position() + AudioServer.get_time_since_last_mix()
		song_position -= AudioServer.get_output_latency()
		song_pos_measures = int(floor(song_position / seconds_per_measure)) + beats_before_start
		_report_beat()

func _report_beat():
	if last_reported_beat < song_pos_measures:
		if beat > beats:
			beat = 1
		emit_signal("_measure", song_pos_measures)
		emit_signal("_beat", beat)
		last_reported_beat = song_pos_measures
		beat += 1

#func play_with_beat_offset(num):
#	beats_before_start = num
#	$StartTimer.wait_time = seconds_per_measure
#	$StartTimer.start()
