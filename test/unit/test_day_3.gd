extends GutTest


func test_find_largest_joltage_sample() -> void:
	var grid_sample: Array = Day3.populate_grid(
		Helpers.get_text_file_content("res://day_3_input_sample.txt")
	)
	var expected: Array = [98, 89, 78, 92]
	for i in grid_sample.size():
		var actual: int = Day3.find_largest_joltage(grid_sample[i])
		assert_eq(actual, expected[i], "should match the sample row sum")


func test_total_output_joltage_sample() -> void:
	var grid_sample: Array = Day3.populate_grid(
		Helpers.get_text_file_content("res://day_3_input_sample.txt")
	)
	var actual_sum: int = Day3.total_output_joltage(grid_sample)
	assert_eq(actual_sum, 357, "should match the sample maximum joltage sum")


func test_total_output_joltage() -> void:
	var grid_sample: Array = Day3.populate_grid(
		Helpers.get_text_file_content("res://day_3_input.txt")
	)
	var actual_sum: int = Day3.total_output_joltage(grid_sample)
	assert_eq(actual_sum, 17535, "should match the input maximum joltage sum")
