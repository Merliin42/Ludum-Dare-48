extends Node2D


func remove_bad():
	$Octopus.queue_free()
	$Coins.queue_free()
