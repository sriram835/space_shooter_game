extends CharacterBody2D

@export var speed := 500
signal laser(pos)
var ready_to_shoot := true

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var direction = Input.get_vector("Left","Right","Up","Down")
	velocity = direction*speed
	move_and_slide()
	
	if (Input.is_action_pressed("Shoot") and ready_to_shoot):
		laser.emit($LaserStartPos.global_position)
		ready_to_shoot = false
		$LaserTimer.start()



func _on_laser_timer_timeout() -> void:
	ready_to_shoot = true
