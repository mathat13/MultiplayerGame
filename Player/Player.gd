extends KinematicBody2D

onready var sprite = $Sprite

var velocity = Vector2(0,0)
export var accel:float = 6.0
export var max_velocity = 300

func change_direction(flip:bool):
	sprite.flip_h = flip if sprite.flip_h != flip else sprite.flip_h

func get_movement_vector():
	var move_vector = Vector2.ZERO
	move_vector.x = Input.get_action_strength("right") - Input.get_action_strength("left")
	move_vector.y = Input.get_action_strength("down") - Input.get_action_strength("up")
	return move_vector

func _physics_process(_delta):
	var move_vector = get_movement_vector()
	var desired_x = max_velocity * move_vector.x - velocity.x
	var desired_y = max_velocity * move_vector.y - velocity.y
	velocity.x += clamp(desired_x, -accel, accel)
	velocity.y += clamp(desired_y, -accel, accel)
	print(accel, velocity)
	change_direction(velocity.x >= 0)
	velocity = move_and_slide(velocity)
	
