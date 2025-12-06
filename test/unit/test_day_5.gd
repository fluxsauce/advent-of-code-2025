extends GutTest


func test_parse_fresh_ranges() -> void:
	var input: String = Helpers.get_text_file_content("res://day_05/day_5_input_sample.txt")
	var actual: Array[Array] = Day5.parse_fresh_ranges(input)
	var expected: Array[Array] = [[3, 5], [10, 14], [16, 20], [12, 18]]
	assert_eq(actual, expected)


func test_parse_available_ids() -> void:
	var input: String = Helpers.get_text_file_content("res://day_05/day_5_input_sample.txt")
	var actual: Array[int] = Day5.parse_available_ids(input)
	var expected: Array[int] = [1, 5, 8, 11, 17, 32]
	assert_eq(actual, expected)


func test_count_fresh_sample() -> void:
	var input: String = Helpers.get_text_file_content("res://day_05/day_5_input_sample.txt")
	assert_eq(Day5.count_fresh(input), 3)


func test_count_fresh() -> void:
	var input: String = Helpers.get_text_file_content("res://day_05/day_5_input.txt")
	assert_eq(Day5.count_fresh(input), 563)

func test_count_from_ranges_sample() -> void:
	var input: Array[Array] = Day5.parse_fresh_ranges(Helpers.get_text_file_content("res://day_05/day_5_input_sample.txt"))
	assert_eq(Day5.count_from_ranges(input), 14)

func test_count_from_ranges() -> void:
	var input: Array[Array] = Day5.parse_fresh_ranges(Helpers.get_text_file_content("res://day_05/day_5_input.txt"))
	assert_eq(Day5.count_from_ranges(input), 14)
