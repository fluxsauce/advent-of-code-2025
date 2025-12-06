class_name Day1Pt2
extends Node


static func count_times_zero_touched(current, steps) -> int:
	var zero_touches = abs(steps) / 100
	var remainder = steps % 100
	var final = current + remainder
	if (final <= 0 and current != 0) or (final >= 100):
		zero_touches += 1
	return zero_touches


static func calculate_final_position(current, steps) -> int:
	var result = current + steps
	return int(fposmod(result, 100))


static func count_zeroes_from_sequence(sequence) -> int:
	var zero_count = 0
	var current = 50
	for move in sequence:
		if move:
			var steps = int(move.lstrip(move[0])) * (-1 if move[0] == "L" else 1)
			zero_count += count_times_zero_touched(current, steps)
			current = calculate_final_position(current, steps)
	return zero_count


func _ready() -> void:
	print_debug("Zero count: %s" % count_zeroes_from_sequence(get_text_file_content()))


func get_text_file_content():
	var file = FileAccess.open("res://day_01/day_1_input.txt", FileAccess.READ)
	var content = file.get_as_text()
	file.close()
	return content.split("\n")
