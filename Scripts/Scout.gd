extends Area2D


const bullet_scene = preload("res://Scenes/Bullet.tscn")
var gun_cooling = false
var cooldown_time:float = 0.3
var speed = 80
var velocity = Vector2()

func move():
	velocity.y += 1
	velocity = velocity.normalized() * speed

func shoot():
	gun_cooling = true
	var bullet = bullet_scene.instance()
	get_parent().add_child(bullet)
	bullet.rotate(1.570796)
	bullet.speed = 200
	bullet.position = $Position2D.global_position
	yield(get_tree().create_timer(cooldown_time), "timeout")
	gun_cooling = false
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	move()
	position += velocity * delta
	if not gun_cooling:
		shoot()
	#var new_rotation = rotater.rotation_degrees + rotation_speed * delta
	#rotater.rotation_degrees = fmod(new_rotation, 360)
