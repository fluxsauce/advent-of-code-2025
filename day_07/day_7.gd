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

static func build_tree_from_grid(sparse_grid: Dictionary) -> SimpleTree:
	var max_x_y:Array = Helpers.get_sparse_grid_max_x_y(sparse_grid)
	var root: SimpleTree
	var node_cache: Dictionary = {}

	for x in range(0, max_x_y[0]):
		for y in range(0, max_x_y[1] + 1):
			var location: Vector2i = Vector2i(x, y)
			if sparse_grid[location] == 'S':
				root = SimpleTree.new(location)
				node_cache[location] = root

	build_children(root, sparse_grid, node_cache)
	return root

static func build_children(node: SimpleTree, grid: Dictionary, node_cache: Dictionary) -> void:
	var location:Vector2i = node.id
	var below:Vector2i = location + Vector2i(0, 1)

	if not grid.has(below):
		return

	elif grid[below] == '|':
		node.children.append(get_child_node(below, grid, node_cache))
	elif grid[below] == '^':
		node.children.append(get_child_node(location + Vector2i(-1, 0), grid, node_cache))
		node.children.append(get_child_node(location + Vector2i(1, 0), grid, node_cache))

static func get_child_node(location: Vector2i, grid: Dictionary, node_cache: Dictionary) -> SimpleTree:
	if node_cache.has(location):
		return node_cache[location]
	var node:SimpleTree = SimpleTree.new(location)
	node_cache[location] = node
	build_children(node, grid, node_cache)
	return node
