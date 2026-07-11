extends Area2D

var speed: int
var rotation_speed: int
var direction_x: float

signal collision

func get_random_file(folder_path: String) -> String:
	var dir := DirAccess.open(folder_path)
	if dir == null:
		push_error("Could not open folder: " + folder_path)
		return ""

	var files: Array[String] = []

	dir.list_dir_begin()
	while true:
		var file := dir.get_next()
		if file == "":
			break

		# Ignore "." and ".." and subdirectories
		if !dir.current_is_dir():
			files.append(file)
	dir.list_dir_end()

	if files.is_empty():
		return ""
	return folder_path.path_join(files.pick_random())

func _ready()-> void:
	
	var rng := RandomNumberGenerator.new()
	
	var paths = ["res://assets/PNG/Meteors/meteorBrown_big1.png","res://assets/PNG/Meteors/meteorBrown_big2.png","res://assets/PNG/Meteors/meteorBrown_big4.png","res://assets/PNG/Meteors/meteorGrey_big1.png","res://assets/PNG/Meteors/meteorGrey_big2.png","res://assets/PNG/Meteors/meteorGrey_big4.png"]
	var path = paths[rng.randi_range(0, paths.size()-1)]
	
	$Sprite2D.texture = load(path)
	
	var width = get_viewport().get_visible_rect().size[0]
	
	var random_x = rng.randi_range(0,width)
	var random_y = rng.randi_range(-150,50)
	
	position = Vector2(random_x, random_y)
	
	speed = rng.randi_range(200,500)
	direction_x = rng.randf_range(-1,1)
	rotation_speed = rng.randi_range(40,100)



func _process(delta):
	position+= Vector2(direction_x, 1.0)*speed*delta
	rotation_degrees+=rotation_speed*delta

func _on_body_entered(body: Node2D) -> void:
	collision.emit()
	


func _on_area_entered(area: Area2D) -> void:
	area.queue_free()
	queue_free()
