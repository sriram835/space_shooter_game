extends CanvasLayer

static var image = load("res://assets/PNG/UI/playerLife1_red.png")
var time_elapsed := 0

# Called when the node enters the scene tree for the first time.
func set_health(amount)->void:
	for child in $MarginContainer2/HBoxContainer.get_children():
		child.queue_free()
		
	for i in amount:
		var text_rect = TextureRect.new()
		text_rect.texture = image
		text_rect.stretch_mode = TextureRect.STRETCH_KEEP
		$MarginContainer2/HBoxContainer.add_child(text_rect)
		


func _on_score_timer_timeout() -> void:
	time_elapsed += 1
	$MarginContainer/Label.text = str(time_elapsed)
	Global.score = time_elapsed
