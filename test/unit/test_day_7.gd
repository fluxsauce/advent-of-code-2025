extends GutTest


func test_sparse_grid() -> void:
	var sparse_grid: Dictionary = Helpers.sparse_grid_from_raw(
		Helpers.get_text_file_content("res://day_07/day_7_input_sample.txt")
	)
	print(Helpers.sparse_grid_render(sparse_grid))
	assert_eq(sparse_grid[Vector2i(7, 0)], "S")


func test_get_sparse_grid_max_x_y() -> void:
	var sparse_grid: Dictionary = Helpers.sparse_grid_from_raw(
		Helpers.get_text_file_content("res://day_07/day_7_input_sample.txt")
	)
	assert_eq(Helpers.get_sparse_grid_max_x_y(sparse_grid), [14, 15])


func test_process_line() -> void:
	var sparse_grid: Dictionary = Helpers.sparse_grid_from_raw(
		Helpers.get_text_file_content("res://day_07/day_7_input_sample.txt")
	)
	sparse_grid = Day7.process_line(0, sparse_grid)
	assert_eq(sparse_grid[Vector2i(7, 1)], "|")


func test_process_all_lines() -> void:
	var sparse_grid: Dictionary = Helpers.sparse_grid_from_raw(
		Helpers.get_text_file_content("res://day_07/day_7_input_sample.txt")
	)
	sparse_grid = Day7.process_all_lines(sparse_grid)
	assert_eq(sparse_grid[Vector2i(0, 15)], "|")
	assert_eq(sparse_grid[Vector2i(1, 15)], ".")
	assert_eq(sparse_grid[Vector2i(2, 15)], "|")
	assert_eq(sparse_grid[Vector2i(3, 15)], ".")
	assert_eq(sparse_grid[Vector2i(4, 15)], "|")
	assert_eq(sparse_grid[Vector2i(5, 15)], ".")
	assert_eq(sparse_grid[Vector2i(6, 15)], "|")
	assert_eq(sparse_grid[Vector2i(7, 15)], ".")
	assert_eq(sparse_grid[Vector2i(8, 15)], "|")
	assert_eq(sparse_grid[Vector2i(9, 15)], ".")
	assert_eq(sparse_grid[Vector2i(10, 15)], "|")
	assert_eq(sparse_grid[Vector2i(11, 15)], "|")
	assert_eq(sparse_grid[Vector2i(12, 15)], "|")
	assert_eq(sparse_grid[Vector2i(13, 15)], ".")
	assert_eq(sparse_grid[Vector2i(14, 15)], "|")


func test_count_splits_sample() -> void:
	var sparse_grid: Dictionary = Helpers.sparse_grid_from_raw(
		Helpers.get_text_file_content("res://day_07/day_7_input_sample.txt")
	)
	sparse_grid = Day7.process_all_lines(sparse_grid)
	assert_eq(Day7.count_splits(sparse_grid), 21)


func test_count_splits() -> void:
	var sparse_grid: Dictionary = Helpers.sparse_grid_from_raw(
		Helpers.get_text_file_content("res://day_07/day_7_input.txt")
	)
	sparse_grid = Day7.process_all_lines(sparse_grid)
	#print(Helpers.sparse_grid_render(sparse_grid))
	assert_eq(Day7.count_splits(sparse_grid), 1687)


func test_build_tree_from_grid_sample() -> void:
	var sparse_grid: Dictionary = Helpers.sparse_grid_from_raw(
		Helpers.get_text_file_content("res://day_07/day_7_input_sample.txt")
	)
	sparse_grid = Day7.process_all_lines(sparse_grid)
	var root: SimpleTree = Day7.build_tree_from_grid(sparse_grid)
	assert_eq(root.count_paths_from_this_node(), 40)


func test_build_tree_from_grid() -> void:
	var sparse_grid: Dictionary = Helpers.sparse_grid_from_raw(
		Helpers.get_text_file_content("res://day_07/day_7_input.txt")
	)
	sparse_grid = Day7.process_all_lines(sparse_grid)
	var root: SimpleTree = Day7.build_tree_from_grid(sparse_grid)
	assert_eq(root.count_paths_from_this_node(), 390684413472684)
