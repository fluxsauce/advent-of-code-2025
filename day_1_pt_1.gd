extends Node2D

var input = "res://day_1_input.txt"


func _ready() -> void:
	var zero_count = 0
	var current = 50.0
	for move in get_text_file_content(input):
		if move:
			var multiplier = -1 if move[0] == "L" else 1
			current = wrapf(current + float(move.lstrip(move[0])) * multiplier, 0, 100)
			if current == 0.0:
				zero_count += 1
	print_debug("Zero count: %s" % zero_count)
	get_tree().quit()


func get_text_file_content(file_path):
	var file = FileAccess.open(file_path, FileAccess.READ)
	var content = file.get_as_text()
	file.close()
	return content.split("\n")
