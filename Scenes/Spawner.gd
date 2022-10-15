extends Node2D

onready var spawn3 = $SpawnPoints/Spawnpoint3
onready var scout  = preload("res://Scenes/Scout.tscn")
var spawn_time     = 3


func spawn3():
	#temporary code will get rid of soon
	enemy = scout.instance()
	yield(get_tree().create_timer(spawn_time), "timeout")
	
	


func _physics_process(delta):
	spawn3()
