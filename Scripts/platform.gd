extends StaticBody2D

var pingpongTime = 0
var bounceTime = 3
var startPosition

func _ready() -> void:
	startPosition = position

func _process(delta: float) -> void:
	pingpongTime += delta
	constant_linear_velocity = Vector2(pingpong(pingpongTime, bounceTime)/bounceTime * 100,0)
