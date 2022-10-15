extends Area2D

#Global Variables
onready var bullet_scene     = preload("res://Scenes/Bullet.tscn")   #Loads the bullet into the scene
var gun_cooldown             = false                                 #Boolean to check if gun is cooling
var cooldown_time:float      = 0.1                                   #The amount of time that the gun needs to cooldown


#Makes Kapitan Shoot 3 bullets
func shoot():
	gun_cooldown             = true                                  #Lets the program know that the gun needs cooling
	var bullet_left          = bullet_scene.instance()               #Creates instance of the bullet on the left
	var bullet_straight      = bullet_scene.instance()               #Creates instance of the bullet that's going straight
	var bullet_right         = bullet_scene.instance()               #Creates instance of the bullet on the right
	get_parent().add_child(bullet_left)                              #Spawns in bullet_left
	bullet_left.rotate(1.396263)                                     #Rotates bullet_left 80 degrees based on the direction of the Position2D node
	bullet_left.speed        = 200                                   #Makes bullet_left's speed 200
	get_parent().add_child(bullet_straight)                          #Spawns in bullet_straight
	bullet_straight.rotate(1.570796)                                 #Rotates bullet_straight 80 degrees based on the direction of the Position2D node
	bullet_straight.speed    = 200                                   #Makes bullet_straight's speed 200
	get_parent().add_child(bullet_right)                             #Spawns in bullet_right
	bullet_right.rotate(1.745329)                                    #Rotates bullet_right 100 degrees based on the direction of the Position2D node
	bullet_right.speed       = 200                                   #Makes bullet_right's speed 200
	bullet_left.position     = $Position2D.global_position           #Makes the position of bullet_left's the same as Position2D
	bullet_right.position    = $Position2D.global_position           #Makes the position of bullet_right's the same as Position2D
	bullet_straight.position = $Position2D.global_position           #Makes the position of bullet_straight's the same as Position2D
	yield(get_tree().create_timer(cooldown_time), "timeout")         #Stops the function until the cooldown time end
	gun_cooldown             = false                                 #Lets the program know that the gun finished cooling
	
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if not gun_cooldown:                                             #if statement that runs when gun isn't cooling
		shoot()                                                      #Makes Soldier Boy shoot 2 bullets in 80 and 100 degrees
