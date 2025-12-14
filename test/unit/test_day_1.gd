extends GutTest


func test_dial_count_ends_on_zero_sample() -> void:
	var moves: Array = Helpers.get_text_file_content("res://day_01/day_1_input_sample.txt").split(
		"\n"
	)
	assert_eq(Day1.dial_count_ends_on_zero(moves), 3)


func test_dial_count_ends_on_zero() -> void:
	var moves: Array = Helpers.get_text_file_content("res://day_01/day_1_input.txt").split("\n")
	assert_eq(Day1.dial_count_ends_on_zero(moves), 1165)


func test_calculate_final_position() -> void:
	assert_eq(Day1.calculate_final_position(0, -5), 95)
	assert_eq(Day1.calculate_final_position(0, 105), 5)
	assert_eq(Day1.calculate_final_position(0, -105), 95)
	assert_eq(Day1.calculate_final_position(0, 5), 5)
	assert_eq(Day1.calculate_final_position(0, 0), 0)


func test_count_times_zero_touched() -> void:
	assert_eq(Day1.count_times_zero_touched(0, 5), 0)
	assert_eq(Day1.count_times_zero_touched(0, -5), 0)
	assert_eq(Day1.count_times_zero_touched(0, 105), 1)
	assert_eq(
		Day1.count_times_zero_touched(0, -105),
		1,
	)
	assert_eq(
		Day1.count_times_zero_touched(0, -205),
		2,
	)
	assert_eq(
		Day1.count_times_zero_touched(5, -100),
		1,
	)
	assert_eq(
		Day1.count_times_zero_touched(5, -5),
		1,
	)
	assert_eq(
		Day1.count_times_zero_touched(0, -100),
		1,
	)
	assert_eq(
		Day1.count_times_zero_touched(0, 100),
		1,
	)
	assert_eq(
		Day1.count_times_zero_touched(0, -500),
		5,
	)
	assert_eq(
		Day1.count_times_zero_touched(0, 500),
		5,
	)


func test_count_zeroes_sample() -> void:
	var moves: Array = Helpers.get_text_file_content("res://day_01/day_1_input_sample.txt").split(
		"\n"
	)
	assert_eq(Day1.count_zeroes_from(moves), 6)


func test_count_zeroes() -> void:
	var moves: Array = Helpers.get_text_file_content("res://day_01/day_1_input.txt").split("\n")
	assert_eq(Day1.count_zeroes_from(moves), 6496)
