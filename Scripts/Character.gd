extends KinematicBody2D


export var SPEED : int = 200
signal enemyCollided
signal octopusCollided
var weight : int = 0
var movement : int = 0
onready var _animated_sprite = $AnimatedSprite


# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if movement == 0 :
		_normal_Movement()
	elif movement == 1 :
		_sinking_Movement()
	else:
		_sinking_and_cant_go_up()
		


func _normal_Movement():
	var direction : Vector2 = Vector2()
	if Input.is_action_pressed("left"):
		direction.x = -1
	elif Input.is_action_pressed("right"):
		direction.x = +1
	if Input.is_action_pressed("down"):
		direction.y = +1
	elif Input.is_action_pressed("up"):
		direction.y = -1
	_handle_Animation(direction)
	move_and_slide(direction.normalized()*SPEED)
	
func _sinking_Movement():
	var direction : Vector2 = Vector2()
	var sinking : Vector2 = Vector2()
	sinking.y = +1
	move_and_slide(sinking.normalized() * weight)
	if Input.is_action_pressed("left"):
		direction.x = -1
	elif Input.is_action_pressed("right"):
		direction.x = +1
	if Input.is_action_pressed("down"):
		direction.y = +1
	elif Input.is_action_pressed("up"):
		direction.y = -1
	_handle_Animation(direction)
	move_and_slide(direction.normalized()*SPEED)
	
func _sinking_and_cant_go_up():
	var direction : Vector2 = Vector2()
	var sinking : Vector2 = Vector2()
	var straining: Vector2 = Vector2()
	sinking.y = +1
	if Input.is_action_pressed("up"):
		straining.y = -1
		move_and_slide(straining.normalized() * weight)
	move_and_slide(sinking.normalized() * weight)
	if Input.is_action_pressed("left"):
		direction.x = -1
	elif Input.is_action_pressed("right"):
		direction.x = +1
	if Input.is_action_pressed("down"):
		direction.y = +1
	_handle_Animation(direction)
	move_and_slide(direction.normalized()*SPEED)

func _handle_Animation(direction):
	if direction.x > 0:
		_animated_sprite.flip_h = true
		_animated_sprite.flip_v = false
		if direction.y > 0:
			_animated_sprite.play("moveDownLeft")
		else:
			_animated_sprite.play("moveUpLeft")
	elif direction.x == 0:
		if direction.y == 1:
			_animated_sprite.flip_v = true
			_animated_sprite.play("moveUp")
		elif direction.y == -1:
			_animated_sprite.flip_v = false
			_animated_sprite.play("moveUp")
	elif direction.x < 0:
		_animated_sprite.flip_h = false
		_animated_sprite.flip_v = false
		if direction.y <=0:
			_animated_sprite.play("moveUpLeft")
		else:
			_animated_sprite.play("moveDownLeft")
		

func _on_Enemy_Colliding(area):
	emit_signal("enemyCollided")
	print("ouch")


func _on_Gold_Colliding(area):
	print("nouvelle pièce d'or")
	weight += 40
	print(weight)
	movement = 1


func _on_depression_level(area):
	movement = 2


func _on_Octopus_Colliding(area):
	emit_signal("octopusCollided")
