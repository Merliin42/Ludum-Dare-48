extends Area2D



func _on_Area2D_body_entered(body):
	$AudioStreamPlayer2D.play()


func _on_AudioStreamPlayer2D_finished():
	queue_free()
