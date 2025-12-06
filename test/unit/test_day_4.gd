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
	assert_eq(Day4.count_accessible_rolls(sparse_grid), 13)


func test_count_accessible_rolls() -> void:
	var sparse_grid: Dictionary = Day4.sparse_grid_from_raw(
		Helpers.get_text_file_content("res://day_04/day_4_input.txt")
	)
	assert_eq(Day4.count_accessible_rolls(sparse_grid), 1411)
