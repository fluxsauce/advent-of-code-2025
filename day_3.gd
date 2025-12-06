class_name Day3
extends Node


static func populate_grid(raw: String) -> Array:
	var raw_rows: PackedStringArray = raw.split("\n")
	var grid: Array = []
	for raw_row in raw_rows:
		var row: Array = []
		for character in raw_row:
			row.append(int(character))
		grid.append(row)
	return grid


static func find_largest_joltage(row: Array) -> int:
	var digits: Array = []
	var position_first: int = 0
	# Find the first number; it is the highest number between 0 and the second to last position
	for position in range(0, row.size() - 1):
		if digits.size() == 0:
			digits.append(row[position])
			position_first = position
		elif row[position] > digits[0]:
			digits[0] = row[position]
			position_first = position
	# Find the second number;
	for position in range(position_first + 1, row.size()):
		if digits.size() == 1:
			digits.append(row[position])
		elif row[position] > digits[1]:
			digits[1] = row[position]

	return int("".join(digits))


static func total_output_joltage(grid: Array) -> int:
	var sum: int = 0
	for i in grid.size():
		sum += find_largest_joltage(grid[i])
	return sum
