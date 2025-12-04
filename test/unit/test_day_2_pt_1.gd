extends GutTest

const ADVENT_TEST = "11-22,95-115,998-1012,1188511880-1188511890,222220-222224,1698522-1698528,446443-446449,38593856-38593862,565653-565659,824824821-824824827,2121212118-2121212124"
const ADVENT_TEST_INVALID_IDS = [
	11,
	22,
	99,
	1010,
	1188511885,
	222222,
	446446,
	38593859
]

var calculator: Day2Pt1

func before_all():
	calculator = Day2Pt1.new()

func test_prepare_input_row():
	var result = calculator.prepare_input_row("11-22")
	assert_eq(result, [11, 22])


func test_prepare_input():
	var result = calculator.prepare_input(ADVENT_TEST)
	assert_eq(
		result,
		[
			[11, 22],
			[95, 115],
			[998, 1012],
			[1188511880, 1188511890],
			[222220, 222224],
			[1698522, 1698528],
			[446443, 446449],
			[38593856, 38593862],
			[565653, 565659],
			[824824821, 824824827],
			[2121212118, 2121212124]
		]
	)


func test_calc_range():
	var result = calculator.calc_range([11, 22])
	assert_eq(result, [11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22])

func test_is_invalid_id():
	for id in ADVENT_TEST_INVALID_IDS:
		assert_true(calculator.is_invalid_id(id), "%s should be invalid" % id)
	assert_false(calculator.is_invalid_id(12))

func test_only_valid_ids():
	var result = calculator.only_invalid_ids(calculator.calc_range([11, 22]))
	assert_eq(result, [11, 22])

func test_parse_raw_to_id_ranges():
	var result = calculator.parse_raw_to_id_ranges("11-22,95-115")
	assert_eq(result, [
		[11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22],
		[95, 96, 97, 98, 99, 100, 101, 102, 103, 104, 105, 106, 107, 108, 109, 110, 111, 112, 113, 114, 115]
	])

func test_raw_to_sum_of_invalid_ids():
	assert_eq(calculator.raw_to_sum_of_invalid_ids("11-22"), 33)
	assert_eq(calculator.raw_to_sum_of_invalid_ids("95-115"), 99)
	assert_eq(calculator.raw_to_sum_of_invalid_ids("11-22,95-115"), 132)
	assert_eq(calculator.raw_to_sum_of_invalid_ids(calculator.get_text_file_content("res://day_2_input_sample.txt")), 1227775554)
	assert_eq(calculator.raw_to_sum_of_invalid_ids(calculator.get_text_file_content("res://day_2_input.txt")), 12586854255)
