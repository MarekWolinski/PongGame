extends CharacterBody2D

var speed = 3
var ball

func _ready():
	ball = get_parent().find_child("Ball")

func _physics_process(delta):
	move_and_collide(Vector2(0,get_opponent_direction()) * speed)

func get_opponent_direction():
	if abs(ball.position.y - position.y) > 40:
		if ball.position.y > position.y: return 1
		else: return -1
	else: return 0
