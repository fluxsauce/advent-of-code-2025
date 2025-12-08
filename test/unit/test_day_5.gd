extends GutTest


func test_parse_fresh_ranges() -> void:
	var input: String = Helpers.get_text_file_content("res://day_05/day_5_input_sample.txt")
	var actual: Array = Day5.parse_fresh_ranges(input)
	var expected: Array = [[3, 5], [10, 14], [16, 20], [12, 18]]
	assert_eq(actual, expected)


func test_pack_fresh_range() -> void:
	assert_eq(Day5.pack_fresh_range(0, [[1, 3], [2, 4], [10, 12]]), [[1, 4], [10, 12]])
	assert_eq(Day5.pack_fresh_range(0, [[1, 5], [2, 4], [10, 12]]), [[1, 5], [10, 12]])
	assert_eq(Day5.pack_fresh_range(0, [[2, 6], [1, 3], [10, 12]]), [[1, 6], [10, 12]])
	assert_eq(Day5.pack_fresh_range(0, [[10, 14], [12, 18]]), [[10, 18]])
	assert_eq(Day5.pack_fresh_range(0, [[1, 2], [3, 4]]), [[1, 4]])
	assert_eq(Day5.pack_fresh_range(0, [[3, 4], [1, 2]]), [[1, 4]])
	assert_eq(Day5.pack_fresh_range(0, [[1, 3], [3, 4]]), [[1, 4]])
	assert_eq(Day5.pack_fresh_range(0, [[3, 4], [1, 3]]), [[1, 4]])


func test_pack_fresh_ranges() -> void:
	var input: String = Helpers.get_text_file_content("res://day_05/day_5_input_sample.txt")
	assert_eq(Day5.pack_fresh_ranges(Day5.parse_fresh_ranges(input)), [[3, 5], [10, 20]])


func test_parse_available_ids() -> void:
	var input: String = Helpers.get_text_file_content("res://day_05/day_5_input_sample.txt")
	var actual: Array = Day5.parse_available_ids(input)
	var expected: Array = [1, 5, 8, 11, 17, 32]
	assert_eq(actual, expected)


func test_count_fresh_sample() -> void:
	var input: String = Helpers.get_text_file_content("res://day_05/day_5_input_sample.txt")
	assert_eq(Day5.count_fresh(input), 3)


func test_count_fresh() -> void:
	var input: String = Helpers.get_text_file_content("res://day_05/day_5_input.txt")
	assert_eq(Day5.count_fresh(input), 563)


func test_count_from_ranges_sample() -> void:
	var input: Array = Day5.parse_fresh_ranges(
		Helpers.get_text_file_content("res://day_05/day_5_input_sample.txt")
	)
	var packed: Array = Day5.pack_fresh_ranges(input)
	#for row:Array in packed:
	#print(row)
	assert_eq(Day5.count_from_packed_ranges(packed), 14)


func test_count_from_ranges() -> void:
	var input: Array = Day5.parse_fresh_ranges(
		Helpers.get_text_file_content("res://day_05/day_5_input.txt")
	)
	var packed: Array = Day5.pack_fresh_ranges(input)
	#for row:Array in packed:
	#print(row)
	assert_eq(Day5.count_from_packed_ranges(packed), 338693411431456)
