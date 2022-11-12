extends Node2D

onready var spawner = $Spawner
#var screenSize = Vector2(0,0)
#var screen_width = get_viewport().get_visible_rect().size.x # Get Width
#screenSize.y = get_viewport().get_visible_rect().size.y # Get Height
onready var scout  = preload("res://Scenes/Scout.tscn")
var spawn_time     = 5
var spawning       = false

func _ready():
	$Music.play()

func spawn():
	spawning = true
	var text = "{s} spawned from {d}"
	var temp = scout.instance()
	var temp2 = scout.instance()
	spawner.add_child(temp)
	temp.position = spawner.global_position
	temp.position.x = temp.position.x + 80
	print(text.format({"s": "scout", "d": temp.position}))
	spawner.add_child(temp2)
	temp2.position = spawner.global_position
	temp2.position.x = temp2.position.x + 160 
	print(text.format({"s": "scout", "d": temp2.position}))
	yield(get_tree().create_timer(spawn_time), "timeout")
	spawning = false
	


func _physics_process(delta):
	if not spawning:
		spawn()





