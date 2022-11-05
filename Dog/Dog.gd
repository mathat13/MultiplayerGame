extends KinematicBody2D

var player : KinematicBody2D

export (int) var speed = 150

var velocity = Vector2()

func follow_player():
	if player:
		look_at(player.position)
		var distance = position.distance_to(player.position)
		if distance > 100.0:
			velocity = Vector2(speed, 0).rotated(rotation)
			velocity = move_and_slide(velocity)
			
func _physics_process(delta):
	follow_player()
	
