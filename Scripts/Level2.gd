extends Node2D


func remove_bad():
	$Sharks.queue_free()
	$Mines.queue_free()
