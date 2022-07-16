extends KinematicBody2D

var loc=Vector2()

export var jump_height=-400
var jump_state=false

var gravity=10
var g_velocity=0

onready var sprite = $AnimatedSprite

func _ready():
	pass
	
func _physics_process(delta):
	loc= Vector2(0,0)
	
	if Input.is_action_pressed("ui_right"):
		sprite.flip_h= false
		sprite.play("Run")
		loc.x= 125
	
	elif Input.is_action_pressed("ui_left"):
		sprite.flip_h= true
		sprite.play("Run")
		loc.x= -125
			
	else:
		if jump_state == false:
			sprite.play("Idle")
	
	if is_on_floor():
		g_velocity = 0
		jump_state = false
		if Input.is_action_pressed("jump"):
			g_velocity = -250
			jump_state = true
	
	g_velocity+=gravity
	loc.y+=g_velocity
	
	move_and_slide(loc,Vector2(0,-1))
