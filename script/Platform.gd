extends KinematicBody2D

const UP = Vector2(-1,0)
const GRAVITY = 2

var motion = Vector2();

func _physics_process(delta):
	motion.y += (GRAVITY * delta  * 10)
	motion = move_and_slide(motion, UP)
	
	var col = get_slide_collision(0);
	
	# Destroy other platform on collision
	if col && col.collider.is_in_group("platforms"):
		print("Platform COLLISION")
		self.queue_free()
		col.collider.queue_free()
	
func _on_notifier_screen_exited():
	print("Platform exited");
	queue_free()
