extends Node2D


onready var sprite = $AnimatedSprite


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	sprite.play("default")

func _on_Area2D_body_entered(body):
	if body is KinematicBody2D:
		get_tree().change_scene("res://Game_Over.tscn")
