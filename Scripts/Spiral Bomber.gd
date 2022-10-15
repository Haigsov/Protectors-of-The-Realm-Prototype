extends Area2D


const bullet_scene = preload("res://Scenes/Bullet.tscn")
onready var shoot_timer = $ShootTimer
onready var rotater     = $Rotation

#Global Variables.
var rotation_speed          = 100
var spawn_point_count       = 4
var shooter_point_wait_time = 0.2
var radius                  = 10



# Called when the node enters the scene tree for the first time.
func _ready():
	#shoot_timer.connect("timeout", self, "_on_ShootTimer_timeout")
	
	#Makes Spiral Bomber shoot in different direction in 90 degree angles.
	var step = (2 * PI) / spawn_point_count
	
	#Creates the different directions that Spiral Bomber will attack from.
	for i in range(spawn_point_count):
		var spawn_point      = Node2D.new()
		var pos              = Vector2(radius, 0).rotated(step * i)
		spawn_point.position = pos
		spawn_point.rotation = pos.angle()
		rotater.add_child(spawn_point)
		
	shoot_timer.wait_time = shooter_point_wait_time
	shoot_timer.start()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var new_rotation = rotater.rotation_degrees + rotation_speed * delta
	rotater.rotation_degrees = fmod(new_rotation, 360)

func _on_ShootTimer_timeout():
	for s in rotater.get_children():
		var bullet = bullet_scene.instance()
		get_tree().root.add_child(bullet)
		bullet.position = s.global_position
		bullet.rotation = s.global_rotation



