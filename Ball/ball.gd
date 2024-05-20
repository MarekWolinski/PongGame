extends CharacterBody2D

var speed = 400
var velo = Vector2.ZERO

func _ready():
	randomize()
	velo.x = [-1,1][randi() % 2]
	velo.y = [-0.8,0.8][randi() % 2]

func _physics_process(delta):
	var collision_object = move_and_collide(velo * speed * delta)
	if collision_object:
		velo = velo.bounce(collision_object.get_normal())
		$CollisionSound.play()

func stop_ball():
	speed = 0

func restart_ball():
	speed = 400
	velo.x = [-1,1][randi() % 2]
	velo.y = [-0.8,0.8][randi() % 2]
