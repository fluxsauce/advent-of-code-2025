class_name Day7
extends Node


static func process_line(y: int, sparse_grid: Dictionary) -> Dictionary:
	var max_x_y:Array = Helpers.get_sparse_grid_max_x_y(sparse_grid)
	for x in range(max_x_y[0] + 1):
		var location: Vector2i = Vector2i(x, y)
		# Beam start
		if sparse_grid[location] == 'S':
			sparse_grid[location + Vector2i(0, 1)] = '|'
		# Beam split
		if sparse_grid[location] == '^' && sparse_grid[location + Vector2i(0, -1)] == '|':
			sparse_grid[location + Vector2i(-1, 0)] = '|'
			sparse_grid[location + Vector2i(1, 0)] = '|'
		# Beam propagation
		if y > 0 and sparse_grid[location] == '.' && sparse_grid[location + Vector2i(0, -1)] == '|':
			sparse_grid[location] = '|'
	return sparse_grid

static func process_all_lines(sparse_grid: Dictionary) -> Dictionary:
	var max_x_y:Array = Helpers.get_sparse_grid_max_x_y(sparse_grid)
	for y in range(max_x_y[1] + 1):
		sparse_grid = process_line(y, sparse_grid)
	return sparse_grid

static func count_splits(sparse_grid: Dictionary) -> int:
	var count:int = 0
	var max_x_y:Array = Helpers.get_sparse_grid_max_x_y(sparse_grid)
	for x in range(1, max_x_y[0]):
		for y in range(1, max_x_y[1] + 1):
			var location: Vector2i = Vector2i(x, y)
			if sparse_grid[location] == '^':
				if sparse_grid[location + Vector2i(0, -1)] == '|':
					if sparse_grid[location + Vector2i(-1, 0)] == '|':
						if sparse_grid[location + Vector2i(1, 0)] == '|':
							count += 1
	return count
