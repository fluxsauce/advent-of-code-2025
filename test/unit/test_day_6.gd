extends GutTest


func test_parse_numbers_and_symbols() -> void:
	var input: String = Helpers.get_text_file_content("res://day_06/day_6_input_sample.txt")
	var actual: Dictionary = Day6.parse_numbers_and_symbols(input)
	assert_eq(actual.symbols[0], "*")
	assert_eq(actual.symbols[1], "+")
	assert_eq(actual.symbols[2], "*")
	assert_eq(actual.symbols[3], "+")
	assert_eq(actual.numbers[0], ["123", " 45", "  6"])
	assert_eq(actual.numbers[1], ["328", "64 ", "98 "])
	assert_eq(actual.numbers[2], [" 51", "387", "215"])
	assert_eq(actual.numbers[3], ["64 ", "23 ", "314"])


func test_parse_numbers_and_symbols_cephalopod() -> void:
	var input: String = Helpers.get_text_file_content("res://day_06/day_6_input_sample.txt")
	var actual: Dictionary = Day6.parse_numbers_and_symbols(input, true)
	assert_eq(actual.symbols[0], "*")
	assert_eq(actual.symbols[1], "+")
	assert_eq(actual.symbols[2], "*")
	assert_eq(actual.symbols[3], "+")
	assert_eq(actual.numbers[0], ["356", "24 ", "1  "])
	assert_eq(actual.numbers[1], ["8  ", "248", "369"])
	assert_eq(actual.numbers[2], ["175", "581", " 32"])
	assert_eq(actual.numbers[3], ["  4", "431", "623"])


func test_calculate_problem_sample() -> void:
	var input: String = Helpers.get_text_file_content("res://day_06/day_6_input_sample.txt")
	var data: Dictionary = Day6.parse_numbers_and_symbols(input)
	assert_eq(Day6.calculate_problem(data, 0), 33210)
	assert_eq(Day6.calculate_problem(data, 1), 490)
	assert_eq(Day6.calculate_problem(data, 2), 4243455)
	assert_eq(Day6.calculate_problem(data, 3), 401)


func test_calculate_problem_sums_sample() -> void:
	var input: String = Helpers.get_text_file_content("res://day_06/day_6_input_sample.txt")
	var data: Dictionary = Day6.parse_numbers_and_symbols(input)
	assert_eq(Day6.calculate_problem_sums(data), 4277556)


func test_calculate_problem_sums() -> void:
	var input: String = Helpers.get_text_file_content("res://day_06/day_6_input.txt")
	var data: Dictionary = Day6.parse_numbers_and_symbols(input)
	assert_eq(Day6.calculate_problem_sums(data), 5316572080628)


func test_calculate_problem_sample_cephalopod() -> void:
	var input: String = Helpers.get_text_file_content("res://day_06/day_6_input_sample.txt")
	var data: Dictionary = Day6.parse_numbers_and_symbols(input, true)
	assert_eq(Day6.calculate_problem(data, 0), 8544)
	assert_eq(Day6.calculate_problem(data, 1), 625)
	assert_eq(Day6.calculate_problem(data, 2), 3253600)
	assert_eq(Day6.calculate_problem(data, 3), 1058)


func test_calculate_problem_sums_cephalopod() -> void:
	var input: String = Helpers.get_text_file_content("res://day_06/day_6_input.txt")
	var data: Dictionary = Day6.parse_numbers_and_symbols(input, true)
	assert_eq(Day6.calculate_problem_sums(data), 11299263623062)
