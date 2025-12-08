extends GutTest


func test_parse_problems_and_operators() -> void:
	var input: String = Helpers.get_text_file_content("res://day_06/day_6_input_sample.txt")
	var actual: Dictionary = Day6.parse_problems_and_operators(input)
	assert_eq(actual.symbols[0], '*')
	assert_eq(actual.symbols[1], '+')
	assert_eq(actual.symbols[2], '*')
	assert_eq(actual.symbols[3], '+')
	assert_eq(actual.numbers[0], [123, 45, 6])
	assert_eq(actual.numbers[1], [328, 64, 98])
	assert_eq(actual.numbers[2], [51, 387, 215])
	assert_eq(actual.numbers[3], [64, 23, 314])

func test_calculate_problem_sample() -> void:
	var input: String = Helpers.get_text_file_content("res://day_06/day_6_input_sample.txt")
	var data: Dictionary = Day6.parse_problems_and_operators(input)
	assert_eq(Day6.calculate_problem(data, 0), 33210)
	assert_eq(Day6.calculate_problem(data, 1), 490)
	assert_eq(Day6.calculate_problem(data, 2), 4243455)
	assert_eq(Day6.calculate_problem(data, 3), 401)

func test_calculate_problem_sums_sample() -> void:
	var input: String = Helpers.get_text_file_content("res://day_06/day_6_input_sample.txt")
	var data: Dictionary = Day6.parse_problems_and_operators(input)
	assert_eq(Day6.calculate_problem_sums(data), 4277556)

func test_calculate_problem_sums() -> void:
	var input: String = Helpers.get_text_file_content("res://day_06/day_6_input.txt")
	var data: Dictionary = Day6.parse_problems_and_operators(input)
	assert_eq(Day6.calculate_problem_sums(data), 5316572080628)
