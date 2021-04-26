extends Node2D

export var denial : AudioStream
export var anger : AudioStream
export var bargain : AudioStream
export var depression : AudioStream
export var acceptance : AudioStream

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
#	print("Anger")
	$AudioStreamPlayer.stop()
	$AudioStreamPlayer.stream = anger
	$AudioStreamPlayer.play()
	$Anger.queue_free()


func _on_Bargain_body_entered(body):
#	print("Bargain")
	$AudioStreamPlayer.stop()
	$AudioStreamPlayer.stream = bargain
	$AudioStreamPlayer.play()
	$Bargain.queue_free()


func _on_Depression_body_entered(body):
#	print("Depression")
	$AudioStreamPlayer.stop()
	$AudioStreamPlayer.stream = depression
	$AudioStreamPlayer.play()
	$Depression.queue_free()

func play_acceptance():
	$AudioStreamPlayer.stop()
	$AudioStreamPlayer.stream = acceptance
	$AudioStreamPlayer.play()
