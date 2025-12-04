class_name Day2Pt1
extends Node

var regex: RegEx

func _init() -> void:
	# Find the invalid IDs by looking for any ID which is made only of some sequence of digits repeated twice.
	# So, 55 (5 twice), 6464 (64 twice), and 123123 (123 twice) would all be invalid IDs.
	regex = RegEx.new()
	# ^(\d{1,})\1{1}$ - https://regex101.com/
	regex.compile("^(\\d{1,})\\1{1}$")


func prepare_input_row(raw: String) -> Array:
	return Array(raw.split("-")).map(func(value): return int(value))


func prepare_input(string: String):
	return Array(string.split(",", false)).map(prepare_input_row)


func calc_range(start_to: Array) -> Array:
	return range(start_to[0], start_to[1] + 1)


func is_invalid_id(raw: int) -> bool:
	return !!regex.search(str(raw))

func only_invalid_ids(row: Array) -> Array:
	return row.filter(is_invalid_id)

func parse_raw_to_id_ranges(raw: String) -> Array:
	return prepare_input(raw).map(calc_range)

func raw_to_sum_of_invalid_ids(raw: String) -> int:
	var sum = 0
	for range_row in parse_raw_to_id_ranges(raw):
		for id in only_invalid_ids(range_row):
			sum += id
	return sum

func get_text_file_content(file_path):
	var file = FileAccess.open(file_path, FileAccess.READ)
	var content = file.get_as_text()
	file.close()
	return content
