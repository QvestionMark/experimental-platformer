extends CharacterBody2D
var animSprite : AnimatedSprite2D

func _ready() -> void:
	animSprite = $AnimatedSprite2D

func _process(delta: float) -> void:
	velocity = Vector2()
	
	if Input.is_action_pressed("walk_up"):
		velocity.y -= 1
	if Input.is_action_pressed("walk_down"):
		velocity.y += 1
	if Input.is_action_pressed("walk_left"):
		velocity.x -= 1
	if Input.is_action_pressed("walk_right"):
		velocity.x += 1
	if velocity.length_squared() == 0:
		animSprite.stop()
		animSprite.frame = 1
	elif velocity.x != 0:
		if velocity.x == 1:
			animSprite.play("walk_right")
		else:
			animSprite.play("walk_left")
	else:
		if velocity.y == 1:
			animSprite.play("walk_down")
		else:
			animSprite.play("walk_up")
	velocity = velocity.normalized()
	velocity *= 50
	move_and_slide()
		
