extends KinematicBody2D

const UP = Vector2(0,-1)
const GRAVITY = 20
const SPEED = 200
const JUMP_HEIGHT = -650

var motion = Vector2()
onready var sprite = get_node('Sprite')

func _physics_process(delta):
	motion.y += GRAVITY

	if Input.is_action_pressed("ui_left"):
		motion.x = -SPEED
	elif  Input.is_action_pressed("ui_right"):
		motion.x = SPEED
	else:
		motion.x = 0

	if is_on_floor():
		if Input.is_action_pressed("ui_jump"):
			sprite.play("jump")
			motion.y = JUMP_HEIGHT
		else:
			sprite.play("stopped")

	motion = move_and_slide(motion, UP)


func _on_notifier_screen_exited():
	print("Player exited");
	queue_free()
