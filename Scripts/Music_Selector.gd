extends Node2D

export var denial : AudioStreamMP3
export var anger : AudioStreamMP3
export var bargain : AudioStreamMP3
export var depression : AudioStreamMP3

func _ready():
	$AudioStreamPlayer.stop()
	$AudioStreamPlayer.stream = denial
	$AudioStreamPlayer.play()
	pass

func _process(delta):
	if Input.is_action_just_pressed("ui_accept"):
		$AudioStreamPlayer.play()
#	print($AudioStreamPlayer.playing)
#	print($AudioStreamPlayer.stream)

func _on_Anger_body_entered(body):
	print("Anger")
	$AudioStreamPlayer.stop()
	$AudioStreamPlayer.stream = anger
	$AudioStreamPlayer.play()


func _on_Bargain_body_entered(body):
	print("Bargain")
	$AudioStreamPlayer.stop()
	$AudioStreamPlayer.stream = bargain


func _on_Depression_body_entered(body):
	print("Depression")
	$AudioStreamPlayer.stop()
	$AudioStreamPlayer.stream = depression
