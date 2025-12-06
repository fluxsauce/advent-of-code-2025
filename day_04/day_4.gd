class_name Day4
extends Node


static func sparse_grid_from_raw(raw: String) -> Dictionary:
	var sparse_grid: Dictionary = {}
	var raw_rows: PackedStringArray = raw.split("\n")
	var y: int = 0
	for raw_row in raw_rows:
		var x: int = 0
		for character in raw_row:
			sparse_grid[Vector2i(x, y)] = character
			x += 1
		y += 1
	return sparse_grid


static func get_neighbors(location: Vector2i) -> Array[Vector2i]:
	var neighbors: Array[Vector2i] = []
	var offsets: Array[Vector2i] = [
		Vector2(0, -1),  # North
		Vector2(1, -1),  # North-East
		Vector2(1, 0),  # East
		Vector2(1, 1),  # South-East
		Vector2(0, 1),  # South
		Vector2(-1, 1),  # South-West
		Vector2(-1, 0),  # West
		Vector2(-1, -1)  # North-West
	]
	for offset in offsets:
		neighbors.append(location + offset)

	return neighbors


static func minesweeper_render(sparse_grid: Dictionary) -> String:
	var ret_val: String = ""
	var last_y: int = 0
	for location: Vector2i in sparse_grid:
		if location.y != last_y:
			ret_val += "\n"
			last_y = location.y
		if sparse_grid[location] == "@":
			ret_val += str(neighbor_adjacent_roll_count(sparse_grid, location))
		else:
			ret_val += sparse_grid[location]
	return ret_val + "\n"


static func neighbor_adjacent_roll_count(sparse_grid: Dictionary, location: Vector2i) -> int:
	var potential_neighbors: Array[Vector2i] = get_neighbors(location)
	var adjacent_roll_count: int = 0
	for neighbor_location in potential_neighbors:
		if neighbor_location in sparse_grid and sparse_grid[neighbor_location] == "@":
			adjacent_roll_count += 1
	return adjacent_roll_count


static func roll_can_be_accessed(sparse_grid: Dictionary, location: Vector2i) -> bool:
	var adjacent_roll_count: int = neighbor_adjacent_roll_count(sparse_grid, location)
	return adjacent_roll_count < 4


static func count_rolls(sparse_grid: Dictionary, accessible: bool = false) -> int:
	var count: int = 0
	for location: Vector2i in sparse_grid:
		if sparse_grid[location] == "@":
			if !accessible or (accessible and roll_can_be_accessed(sparse_grid, location)):
				count += 1
	return count


static func remove_accessible_rolls(sparse_grid: Dictionary) -> Dictionary:
	var locations_to_remove: Array[Vector2i] = []
	for location: Vector2i in sparse_grid:
		if sparse_grid[location] == "@":
			if roll_can_be_accessed(sparse_grid, location):
				locations_to_remove.append(location)
	if locations_to_remove.size() > 0:
		for location: Vector2i in locations_to_remove:
			sparse_grid[location] = "x"
	return sparse_grid


static func clean_up_removals(sparse_grid: Dictionary) -> Dictionary:
	for location: Vector2i in sparse_grid:
		if sparse_grid[location] == "x":
			sparse_grid[location] = "."
	return sparse_grid


static func remove_until_empty(sparse_grid: Dictionary) -> Dictionary:
	while count_rolls(sparse_grid, true) > 0:
		sparse_grid = clean_up_removals(remove_accessible_rolls(sparse_grid))
	return sparse_grid
