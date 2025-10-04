extends CharacterBody3D


@export var lerp_ = 0.1
@export var SPEED = 70

@export var AnimPlayer : AnimationPlayer
@export var PlayerMesh : Node3D
@export var ComboSystem : Node

const JUMP_VELOCITY = 90

var movement_animations = {
	'Iddle':'T3/iddle',
	'RunFoward':'T3/Run',
	'JumpUp':'T3/J1',
	'JumpDown':'T3/J2'
}

func _physics_process(delta: float) -> void:
	handle_gravity_speed(delta) # Add the gravity.
	jump_event() # Make the player Jump
	jump_animation() # Handle jump Animation
	handle_x_direction(run_animation()) # Make the player move foward
	move_and_slide()


func play_movement(anim:String ,blend:float):
	
	if ComboSystem.attacking == false:
		AnimPlayer.play(anim,0.3)
	

func run_animation():
	var m_a = movement_animations
	var direction
	
	#---------------------------------------
	if Input.is_action_pressed("ui_right"):
		direction = 1
	elif Input.is_action_pressed("ui_left"):
		direction = -1
	else:
		direction = 0
	#--------------------------------------
	
	#--------------------------------------
	if direction == 1:
		PlayerMesh.rotation_degrees.y = 90.0
	if direction == -1:
		PlayerMesh.rotation_degrees.y = -90.0
	#--------------------------------------
	
	if is_on_floor():
		#--------------------------------------
		if direction == 1 or direction == -1:
			play_movement(m_a.RunFoward,0.3)
		else:
			play_movement(m_a.Iddle,0.3)
		#--------------------------------------
	
	return direction

func jump_animation():
	var m_a = movement_animations
	if velocity.y > 0  and (!is_on_floor()):
		play_movement(m_a.JumpUp,0.3)
	if velocity.y < 0  and (!is_on_floor()):
		play_movement(m_a.JumpDown,0.3)

func jump_event():
	if Input.is_action_pressed("ui_up") and is_on_floor():
		velocity.y = JUMP_VELOCITY

func handle_gravity_speed(delta):
	if not is_on_floor():
		velocity += get_gravity() * delta * 30
	
	if (!is_on_floor()) and Input.is_action_pressed("ui_down"):
		velocity += get_gravity() * delta * 200
	
	if velocity.y < 0:
		velocity += get_gravity() * delta * 8

func handle_x_direction(direction):
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = lerp(velocity.x,0.0,lerp_)
		pass
	
	
