extends Area2D

func _on_body_entered(body: Node2D) -> void:
	if body is Player:
		body.scale *= 1.5
		queue_free()
