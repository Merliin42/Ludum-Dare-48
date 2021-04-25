extends Area2D

export var SPEED : int = 100

func _ready():
	$Timer.wait_time = rand_range(1, 4)
	$Timer.start()


func _process(delta):
	position.y -= SPEED*delta


func _on_Bubble_area_entered(area):
	queue_free()


func _on_Timer_timeout():
	queue_free()
