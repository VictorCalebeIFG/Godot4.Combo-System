extends Node

@export var AnimPlayer : AnimationPlayer

var cmb = 0 # Variable that checks if it' in a combo loop or not

var debug_text

var attacking = false

var reset_animation = 'T3/iddle'
var reset_speed_scale = 1.0

var combo_flow = [
	
	{"key":'z' , "cmb":0 ,
		"currentAnim": [reset_animation,'T3/Run'],  'nextAnim':'T3/z1',
		'zone':0.0 ,"cmb_":1 , "speed_scale": 1.5 },
	
	{"key":'z' , "cmb":1 ,
		"currentAnim": ['T3/z1'],'nextAnim':'T3/z2',
		'zone':0.7 ,"cmb_":1 , "speed_scale": 1.5 },
	
	{"key":'z' , "cmb":1 ,
		"currentAnim": ['T3/z2'],'nextAnim':'T3/z1',
		'zone':0.7 ,"cmb_":1 , "speed_scale": 1.5 },
	
	{"key":'x' , "cmb":1 ,
		"currentAnim": ['T3/z2'],'nextAnim':'T3/zx3',
		'zone':0.7 ,"cmb_":0 , "speed_scale": 1.5},
	
	#---------------------------------------------------------------------
	{"key":'x' , "cmb":0 ,
		"currentAnim": [reset_animation,'T3/Run'],  'nextAnim':'T3/x1',
		'zone':0.0 ,"cmb_":1 , "speed_scale": 1.0 },
	
	{"key":'x' , "cmb":1 ,
		"currentAnim": ['T3/x1'],  'nextAnim':'T3/x2',
		'zone':0.7 ,"cmb_":1 , "speed_scale": 1.0 },
	
	{"key":'x' , "cmb":1 ,
		"currentAnim": ['T3/x2'],  'nextAnim':'T3/x3',
		'zone':0.7 ,"cmb_":1 , "speed_scale": 1.5 },
		
	{"key":'x' , "cmb":1 ,
		"currentAnim": ['T3/x3'],  'nextAnim':'T3/x2',
		'zone':0.7 ,"cmb_":1 , "speed_scale": 1.5 },
]

func _ready() -> void:
	#If animation is fineshed the combo is reseted
	AnimPlayer.connect('animation_finished',reset_combo)

func reset_combo(animation:String):
	cmb = 0
	AnimPlayer.speed_scale = reset_speed_scale
	AnimPlayer.play(reset_animation,0.3)
	attacking = false

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
		if Input.is_action_just_pressed(flow.key) and cmb == flow.cmb and AnimPlayer.current_animation in flow.currentAnim and check_zone(flow.zone):
			attacking = true
			cmb  = flow.cmb_
			AnimPlayer.speed_scale = flow.speed_scale
			AnimPlayer.play(flow.nextAnim,0.3)

			debug_text = ('Combo System: '+flow.key + ' : ' + AnimPlayer.current_animation)
			pass
	
