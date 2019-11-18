extends KinematicBody2D

var motion = Vector2()
export var speed = 200

signal timeout
const DOWN = Vector2(0,1)

const TIME_PERIOD = 5.0 # 500ms

var time = 0
#onready var sb =  get_tree().get_root().get_node("World").get_node("Floors").get_node("Test")
onready var Repeat = get_tree().get_root().get_child(0).get_child(2).get_child(0)
onready var Stopper = get_tree().get_root().get_child(0).get_child(2).get_child(1)
onready var Stopper2 = get_tree().get_root().get_child(0).get_child(2).get_child(2)
onready var Stopper3 = get_tree().get_root().get_child(0).get_child(2).get_child(3)
onready var Stopper4 = get_tree().get_root().get_child(0).get_child(2).get_child(4)
onready var Rid = get_tree().get_root().get_child(0).get_child(2).get_child(5)
onready var Player = get_tree().get_root().get_child(0).get_child(0)
onready var NPC = get_tree().get_root().get_child(0).get_child(1).get_child(0)
onready var NPC2 = get_tree().get_root().get_child(0).get_child(1).get_child(1)
onready var NPC3 = get_tree().get_root().get_child(0).get_child(1).get_child(2)
onready var NPC4 = get_tree().get_root().get_child(0).get_child(1).get_child(3)


func _ready():
	add_to_group("Player")
	Player.add_to_group("Player")
	add_to_group("NPC")
	NPC.add_to_group("NPC")
	add_to_group("NPC2")
	NPC2.add_to_group("NPC2")
	add_to_group("NPC3")
	NPC3.add_to_group("NPC3")
	add_to_group("NPC4")
	NPC4.add_to_group("NPC4")
	

func _physics_process(delta):
	motion.x = speed
	time += delta


	if (time < TIME_PERIOD):
		if (is_on_wall()):
			position = Vector2(210,200)
		if(Input.is_action_pressed("ui_right")):
			speed += 5
			if (speed >= 600):
				speed = 400
			
		if(Input.is_action_pressed("ui_left")):
			speed -= 5
			if (speed <= 50):
				speed = 70
			
		
	elif(time >= TIME_PERIOD):
		Stopper.position = Vector2(810,200)
		Stopper2.position = Vector2(690,200)
		Stopper3.position = Vector2(570,200)
		Stopper4.position = Vector2(450,200)
		Rid.position = Vector2(330, 200)
		
		
		speed = 0
		
		if (time >= TIME_PERIOD + .2):
			Stopper.position = Vector2(810,100)
			Stopper2.position = Vector2(690,100)
			Stopper3.position = Vector2(570,100)
			Stopper4.position = Vector2(450,100)
			Rid.position = Vector2(330, 100)
			motion.y += 100
			if (time >= TIME_PERIOD + .4):
				if (is_on_ceiling() == true and is_in_group("Player") == true):
					Player.position = Vector2(810,500)
				if (is_on_ceiling() == true and is_in_group("NPC") == true):
					NPC.position = Vector2(690,500)
				if (is_on_ceiling() == true and is_in_group("NPC2") == true):
					NPC2.position = Vector2(570,500)
				if (is_on_ceiling() == true and is_in_group("NPC3") == true):
					NPC3.position = Vector2(450,500)
				if (is_on_ceiling() == true and is_in_group("NPC4") == true):
					NPC4.position = Vector2(100,500)
				if (is_on_ceiling() == false and is_in_group("Player")):
					motion.y += 100
		
		
		
	motion = move_and_slide(motion, DOWN)
	