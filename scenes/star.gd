extends Node2D



# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var rng = RandomNumberGenerator.new()
	var width = get_viewport().get_visible_rect().size[0]
	var height = get_viewport().get_visible_rect().size[1]
	
	var pos_x = rng.randi_range(0, width)
	var pos_y = rng.randi_range(0, height)
	position = Vector2(pos_x,pos_y)
	
	var new_scale = rng.randf_range(0.2, 1.5)
	scale = Vector2(new_scale,new_scale)
	
	var new_speed = rng.randf_range(0.5,2.5)
	$AnimatedSprite2D.speed_scale = new_speed
	
	
	
	
	
