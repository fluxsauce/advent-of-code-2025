class_name Day2
extends RefCounted

var regex_invalid: RegEx
var regex_silly: RegEx


func _init() -> void:
	# Find the invalid IDs by looking for any ID which is made only of some sequence of
	# digits repeated twice. So, 55 (5 twice), 6464 (64 twice), and 123123 (123 twice)
	# would all be invalid IDs.
	regex_invalid = RegEx.new()
	if regex_invalid.compile("^(\\d{1,})\\1{1}$") != OK:
		push_error("Broken Invalid ID RegEx")
	# An ID is invalid if it is made only of some sequence of digits repeated at least twice.
	# So, 12341234 (1234 two times), 123123123 (123 three times), 1212121212 (12 five times),
	# and 1111111 (1 seven times) are all invalid IDs.
	regex_silly = RegEx.new()
	if regex_silly.compile("^(\\d{1,})\\1{1,}$") != OK:
		push_error("Broken silly ID RegEx")


func prepare_input_row(raw: String) -> Array:
	return Array(raw.split("-")).map(func(value: String) -> int: return int(value))


func prepare_input(string: String) -> Array:
	return Array(string.split(",", false)).map(prepare_input_row)


func calc_range(start_to: Array) -> Array:
	return range(start_to[0], start_to[1] + 1)


func is_invalid_id(raw: int) -> bool:
	return !!regex_invalid.search(str(raw))


func only_invalid_ids(row: Array) -> Array:
	return row.filter(is_invalid_id)


func is_silly_id(raw: int) -> bool:
	return !!regex_silly.search(str(raw))


func only_silly_ids(row: Array) -> Array:
	return row.filter(is_silly_id)


func parse_raw_to_id_ranges(raw: String) -> Array:
	return prepare_input(raw).map(calc_range)


func raw_to_sum_of_invalid_ids(raw: String) -> int:
	var sum: int = 0
	for range_row: Array in parse_raw_to_id_ranges(raw):
		for id: int in only_invalid_ids(range_row):
			sum += id
	return sum


func raw_to_sum_of_silly_ids(raw: String) -> int:
	var sum: int = 0
	for range_row: Array in parse_raw_to_id_ranges(raw):
		for id: int in only_silly_ids(range_row):
			sum += id
	return sum
