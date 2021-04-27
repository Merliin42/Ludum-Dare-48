extends Area2D


func _on_Octopus_body_entered(body):
	$AudioStreamPlayer2D.play()
