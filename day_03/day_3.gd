class_name Day3
extends RefCounted


static func populate_grid(raw: String) -> Array:
	var raw_rows: PackedStringArray = raw.split("\n")
	var grid: Array = []
	for raw_row in raw_rows:
		var row: Array = []
		for character in raw_row:
			row.append(int(character))
		grid.append(row)
	return grid


static func find_largest_joltage(row: Array, places: int) -> int:
	var digits: Array = []
	var last_position: int = -1
	# Keep track of how many of these scans we should do.
	for place in range(0, places):
		# Start the search after the last thing found.
		last_position += 1
		# Scan from the last position found to the end, but with padding.
		for position in range(last_position, row.size() - (places - digits.size()) + 1):
			var current_digit: int = row[position]
			# Haven't found anything yet.
			if digits.size() == place:
				digits.append(current_digit)
				last_position = position
			elif current_digit > digits[place]:
				# Overwrite.
				digits[place] = current_digit
				# Track.
				last_position = position

	return int("".join(digits))


static func total_output_joltage(grid: Array, places: int) -> int:
	var sum: int = 0
	for i in grid.size():
		sum += find_largest_joltage(grid[i], places)
	return sum
