extends Node2D

onready var spawner = 
#var screenSize = Vector2(0,0)
var screenSize_width = get_viewport().get_visible_rect().size.x # Get Width
#screenSize.y = get_viewport().get_visible_rect().size.y # Get Height
onready var scout  = preload("res://Scenes/Scout.tscn")
var spawn_time     = 5
var spawning       = false


func spawn3():
	spawning = true
	var temp = scout.instance()
	$SpawnPoints.add_child(temp)
	temp.position = $SpawnPoints.global_position
	temp.position.x = temp.position.x + 
	var text = "{s} spawned from {d}"
	print(text.format({"s": "scout", "d": temp.position}))
	yield(get_tree().create_timer(spawn_time), "timeout")
	spawning = false
	


func _physics_process(delta):
	if not spawning:
		spawn3()
