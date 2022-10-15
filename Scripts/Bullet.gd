extends Area2D

var speed = 100


# Called when the node enters the scene tree for the first time.
func _ready():
	#Variable for the KillTimer.
	#var kill_timer = get_node("KillTimer")
	$KillTimer.wait_time = 9
	$KillTimer.start() 
	   
	#Connects the KillTimer with the timeout signal.
	#kill_timer.connect("timeout", self, "_on_KillTimer_timeout") 


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	#Moves the bullet node.
	self.position += self.transform.x * delta * speed

func _on_KillTimer_timeout():
	#Removes the bullet from the game.
	queue_free()
