extends KinematicBody2D

onready var bullet_path = preload("res://Scenes/Bullet.tscn")
var speed = 250
var velocity = Vector2()
var screen_size

func _ready():
	screen_size = get_viewport_rect().size

func get_input():
	# Detect up/down/left/right keystate and only move when pressed.
	velocity = Vector2()
	if Input.is_action_pressed('ui_right'):
		velocity.x += 1
	if Input.is_action_pressed('ui_left'):
		velocity.x -= 1
	if Input.is_action_pressed('ui_down'):
		velocity.y += 1
	if Input.is_action_pressed('ui_up'):
		velocity.y -= 1
	velocity = velocity.normalized() * speed
	
	if Input.is_action_pressed("shoot_weapon") and $CooldownTimer.is_stopped():
		print("I'm shooting")
		shoot()
	

func shoot():
	var bullet = bullet_path.instance()
	
	get_parent().add_child(bullet)
	
	bullet.rotate(-1.570796)
	bullet.speed = 200
	bullet.position = $Position2D.global_position
	$CooldownTimer.start()

func _physics_process(delta):
	get_input()
	position += velocity * delta
	position.x = clamp(position.x, 0, screen_size.x)
	position.y = clamp(position.y, 0, screen_size.y)
	
	



func _on_CooldownTimer_timeout():
	$CooldownTimer.stop()
