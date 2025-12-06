class_name Day5
extends Node


static func parse_fresh_ranges(raw: String) -> Array[Array]:
	var rows: PackedStringArray = raw.split("\n")
	var fresh_ranges: Array[Array] = []
	var parse: bool = true
	for row in rows:
		if row == "":
			parse = false
		if parse:
			var row_values: PackedStringArray = row.split("-")
			var start: int = int(str(row_values[0]))
			var end: int = int(str(row_values[1]))
			fresh_ranges.append([start, end])
	return fresh_ranges


static func parse_available_ids(raw: String) -> Array[int]:
	var rows: PackedStringArray = raw.split("\n")
	var available: Array[int] = []
	var ready: bool = false
	for row in rows:
		if ready:
			available.append(int(row))
		elif row == "":
			ready = true
	return available


static func check_ranges_if_fresh(id: int, fresh_ranges: Array[Array]) -> bool:
	for fresh_range: Array[int] in fresh_ranges:
		if is_fresh(id, fresh_range):
			return true
	return false

static func get_first_range_index(id: int, fresh_ranges: Array[Array]) -> int:
	var fresh_ranges_size: int = fresh_ranges.size()
	for index:int in range(fresh_ranges_size):
		if is_fresh(id, fresh_ranges[index]):
			return index
	# Impossible to get here
	return -1


static func is_fresh(id: int, fresh_range: Array) -> bool:
	return id >= fresh_range[0] and id <= fresh_range[1]


static func count_fresh(raw: String) -> int:
	var fresh_ranges: Array[Array] = parse_fresh_ranges(raw)
	var available_ids: Array[int] = parse_available_ids(raw)
	var fresh: Array[int] = []
	for id: int in available_ids:
		if check_ranges_if_fresh(id, fresh_ranges):
			fresh.append(id)
	return fresh.size()


static func count_from_ranges(fresh_ranges: Array[Array]) -> int:
	var count:int = 0
	var fresh_ranges_size:int = fresh_ranges.size()
	for index in range(fresh_ranges_size):
		var fresh_range: Array = fresh_ranges[index]
		# See if it's unique.
		# Update: can't do that.
		for id in range(fresh_range[0], fresh_range[1] + 1):
			var first_range_index:int = get_first_range_index(id, fresh_ranges)
			if first_range_index == index:
				count += 1
	return count
