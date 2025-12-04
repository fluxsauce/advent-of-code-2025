extends GutTest


func test_calculate_final_position():
	assert_eq(Day1Pt2.calculate_final_position(0, -5), 95, "should wrap once negative")
	assert_eq(Day1Pt2.calculate_final_position(0, 105), 5, "should wrap once positive")
	assert_eq(Day1Pt2.calculate_final_position(0, -105), 95, "should wrap twice negative")
	assert_eq(Day1Pt2.calculate_final_position(0, 5), 5, "no wrap positive")
	assert_eq(Day1Pt2.calculate_final_position(0, 0), 0, "zero is zero")


func test_count_times_zero_touched():
	assert_eq(Day1Pt2.count_times_zero_touched(0, 5), 0, "shouldn't touch zero from 0 to 5")
	assert_eq(Day1Pt2.count_times_zero_touched(0, -5), 0, "shouldn't touch zero from 0 - 5 to 95")
	assert_eq(Day1Pt2.count_times_zero_touched(0, 105), 1, "should touch zero once from 0 to 105")
	assert_eq(
		Day1Pt2.count_times_zero_touched(0, -105),
		1,
		"should touch zero once starting on 0 and ending on -105"
	)
	assert_eq(
		Day1Pt2.count_times_zero_touched(0, -205),
		2,
		"should touch zero twice starting on 0 and ending on -205"
	)
	assert_eq(
		Day1Pt2.count_times_zero_touched(5, -100),
		1,
		"should touch zero once starting on 5 and ending on -95"
	)
	assert_eq(
		Day1Pt2.count_times_zero_touched(5, -5),
		1,
		"should touch zero once starting on 5 and ending on 0"
	)
	assert_eq(
		Day1Pt2.count_times_zero_touched(0, -100),
		1,
		"should touch zero once starting on 0 and ending on 0 by a negative 100"
	)
	assert_eq(
		Day1Pt2.count_times_zero_touched(0, 100),
		1,
		"should touch zero once starting on 0 and ending on 0 by a positive 100"
	)
	assert_eq(
		Day1Pt2.count_times_zero_touched(0, -500),
		5,
		"should touch zero once starting on 0 and ending on 0 by a negative 500"
	)
	assert_eq(
		Day1Pt2.count_times_zero_touched(0, 500),
		5,
		"should touch zero once starting on 0 and ending on 0 by a positive 500"
	)


func test_everything():
	const SEQUENCE = ["L68", "L30", "R48", "L5", "R60", "L55", "L1", "L99", "R14", "L82"]
	assert_eq(Day1Pt2.count_zeroes_from_sequence(SEQUENCE), 6, "sequence must touch zero 6 times")
