extends GutTest


func test_sparse_grid() -> void:
	var sparse_grid: Dictionary = Day4.sparse_grid_from_raw(
		Helpers.get_text_file_content("res://day_04/day_4_input_sample.txt")
	)
	assert_eq(sparse_grid[Vector2i(0, 0)], ".")


func test_get_neighbors() -> void:
	var expected: Array[Vector2i] = [
		Vector2(0, -1),  # North
		Vector2(1, -1),  # North-East
		Vector2(1, 0),  # East
		Vector2(1, 1),  # South-East
		Vector2(0, 1),  # South
		Vector2(-1, 1),  # South-West
		Vector2(-1, 0),  # West
		Vector2(-1, -1)  # North-West
	]
	assert_eq(Day4.get_neighbors(Vector2i(0, 0)), expected)


func test_count_accessible_rolls_sample() -> void:
	var sparse_grid: Dictionary = Day4.sparse_grid_from_raw(
		Helpers.get_text_file_content("res://day_04/day_4_input_sample.txt")
	)
	# print(Day4.minesweeper_render(sparse_grid))
	assert_eq(Day4.count_rolls(sparse_grid, true), 13)


func test_count_accessible_rolls() -> void:
	var sparse_grid: Dictionary = Day4.sparse_grid_from_raw(
		Helpers.get_text_file_content("res://day_04/day_4_input.txt")
	)
	assert_eq(Day4.count_rolls(sparse_grid, true), 1411)


func test_remove_accessible_rolls() -> void:
	var sparse_grid: Dictionary = Day4.sparse_grid_from_raw(
		Helpers.get_text_file_content("res://day_04/day_4_input_sample.txt")
	)
	var removals: Array[int] = [13, 12, 7, 5, 2, 1, 1, 1, 1]
	for expected: int in removals:
		var before: int = Day4.count_rolls(sparse_grid)
		sparse_grid = Day4.remove_accessible_rolls(sparse_grid)
		sparse_grid = Day4.clean_up_removals(sparse_grid)
		var after: int = Day4.count_rolls(sparse_grid)
		assert_eq(before - after, expected)


func test_remove_until_empty_sample() -> void:
	var sparse_grid: Dictionary = Day4.sparse_grid_from_raw(
		Helpers.get_text_file_content("res://day_04/day_4_input_sample.txt")
	)
	var before: int = Day4.count_rolls(sparse_grid)
	sparse_grid = Day4.remove_until_empty(sparse_grid)
	var after: int = Day4.count_rolls(sparse_grid)
	assert_eq(before - after, 43)


func test_remove_until_empty() -> void:
	var sparse_grid: Dictionary = Day4.sparse_grid_from_raw(
		Helpers.get_text_file_content("res://day_04/day_4_input.txt")
	)
	var before: int = Day4.count_rolls(sparse_grid)
	sparse_grid = Day4.remove_until_empty(sparse_grid)
	var after: int = Day4.count_rolls(sparse_grid)
	# print(Day4.minesweeper_render(sparse_grid))
	assert_eq(before - after, 8557)
