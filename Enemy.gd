extends KinematicBody2D

var loc=Vector2()

onready var sprite = $AnimatedSprite

var player_dir = ""
var proximity = false

func _ready():
	pass
	
func _physics_process(delta):
	
	find_player_dir()
	
	loc= Vector2(0,0)
	
	if proximity == false:
	
		if player_dir == "right":
			sprite.flip_h= false
			sprite.play("Run")
			loc.x= 125
		
		elif player_dir == "left":
			sprite.flip_h= true
			sprite.play("Run")
			loc.x= -125
		
		else:
			sprite.play("Idle")
	
	else:
		sprite.play("Attack")
#		if proximity:
#			get_tree().change_scene("res://Game_Over.tscn")
	
	move_and_slide(loc,Vector2(0,-1))

func find_player_dir():
	
	var Player = get_parent().get_child(0)
	
	var player_pos = Player.global_position
	
	if player_pos.x < global_position.x:
		player_dir = "left"
	elif player_pos.x > global_position.x:
		player_dir = "right"


func _on_Proximity_body_entered(body):
	if body.name == "Player":
		proximity = true

func _on_Proximity_body_exited(body):
	if body.name == "Player":
		proximity = false
