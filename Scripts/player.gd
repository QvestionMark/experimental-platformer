class_name Player
extends CharacterBody2D

var animSprite : AnimatedSprite2D
var flashlight : Node2D

func _ready() -> void:
	animSprite = $AnimatedSprite2D
	flashlight = $flashlight

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
		animSprite.pause()
		animSprite.frame = 1
		animSprite.frame_progress = 1
	elif velocity.x != 0:
		if velocity.x > 0:
			animSprite.play("walk_right")
		else:
			animSprite.play("walk_left")
	else:
		if velocity.y > 0:
			animSprite.play("walk_down")
		else:
			animSprite.play("walk_up")
	velocity = velocity.normalized()
	velocity *= 50 * scale.x
	move_and_slide()
	
	flashlight.rotation = flashlight.global_position.direction_to(get_global_mouse_position()).angle()
		
