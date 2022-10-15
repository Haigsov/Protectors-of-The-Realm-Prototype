extends Node2D

onready var animation_player = $AnimationPlayer

func _action():
	print("whatever")
	
	

func _ready():
	animation_player.play("Action 3 times")
