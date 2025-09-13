extends Node

@export var AnimPlayer : AnimationPlayer

var cmb = 0 # Variable that checks if it' in a combo loop or not

var combo_flow = [
	{"key":'z' , "cmb":0 , "currentAnim": 'A/iddle2',  'nextAnim':'A/fAttack1','zone':0.0 ,"cmb_":1},
	{"key":'z' , "cmb":1 , "currentAnim": 'A/fAttack1','nextAnim':'A/fAttack2','zone':0.7 ,"cmb_":1},
	{"key":'z' , "cmb":1 , "currentAnim": 'A/fAttack2','nextAnim':'A/fAttack1','zone':0.7 ,"cmb_":1},
	{"key":'x' , "cmb":1 , "currentAnim": 'A/fAttack2','nextAnim':'A/fAttack4','zone':0.7 ,"cmb_":0},
]

func _ready() -> void:
	#If animation is fineshed the combo is reseted
	AnimPlayer.connect('animation_finished',reset_combo)

func reset_combo(animation:String):
	cmb = 0
	AnimPlayer.play('A/iddle2',0.3)

func _process(delta: float) -> void:
	play_flow()
	pass
	
func check_zone(zone:float):
	var current = AnimPlayer.current_animation
	var cap = AnimPlayer.current_animation_position
	var cal = AnimPlayer.current_animation_length
	var speed_scale = AnimPlayer.speed_scale
	
	return cap >=  (cal*(zone) / speed_scale)

func play_flow():
	for flow in combo_flow:
		if Input.is_action_just_pressed(flow.key) and cmb == flow.cmb and AnimPlayer.current_animation == flow.currentAnim and check_zone(flow.zone):
			cmb  = flow.cmb_
			AnimPlayer.play(flow.nextAnim,0.3)
			pass
	
