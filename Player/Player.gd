extends KinematicBody2D

var motion = Vector2(0,0)

const SPEED = 1500
const GRAVITY = 150
const UP = Vector2(0,-1)
const JUMP_SPEED = 3500
const WORLD_LIMIT = 3000

var lives = 3

signal animate

func _physics_process(delta):
	apply_gravity()
	jump()
	move()
	animate()
	move_and_slide(motion, UP)
	
	
func apply_gravity():
	if position.y > WORLD_LIMIT:
		game_over()
	if  is_on_floor():
		motion.y = 0
	elif is_on_ceiling():
		motion.y = 1
	else:
		motion.y += GRAVITY
		

func jump():
	if Input.is_action_pressed("jump") and is_on_floor():
		motion.y -= JUMP_SPEED
		$JumpSFX.play()

func move():
	if Input.is_action_pressed("left") and not Input.is_action_pressed("right"):
		motion.x = -SPEED
	elif Input.is_action_pressed("right") and not Input.is_action_pressed("left"):
		motion.x = SPEED
	else:
		motion.x = 0
		

func animate():
	emit_signal("animate", motion)
#
#
func game_over():
	get_tree().change_scene("res://Levels/GameOver.tscn")


func hurt():
	# Move up a pixel to bypass gravity
	motion.y -= 1
	# Stop doing anything for one frame only.
	# So we are waiting for a signal from get_tree that is an "idle_frame"
	yield(get_tree(), "idle_frame")
	motion.y -= JUMP_SPEED
	lives -= 1
	$PainSFX.play()
	if lives < 0:
		game_over()
