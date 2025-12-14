extends GutTest


func test_find_closest_points() -> void:
	var points: Array = Day8.parse_points(
		Helpers.get_text_file_content("res://day_08/day_8_input_sample.txt")
	)
	assert_eq(Day8.find_closest_points(points), [Vector3i(162, 817, 812), Vector3i(425, 690, 689)])
