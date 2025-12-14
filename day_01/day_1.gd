class_name Day1
extends RefCounted


static func dial_count_ends_on_zero(moves: Array) -> int:
	var zero_count: int = 0
	var current: float = 50.0
	for move: String in moves:
		var multiplier: int = -1 if move[0] == "L" else 1
		current = wrapf(current + float(move.lstrip(move[0])) * multiplier, 0, 100)
		if current == 0.0:
			zero_count += 1
	return zero_count


static func count_times_zero_touched(pos_current: int, step_count: int) -> int:
	var zero_touches: int = abs(step_count) / 100
	var remainder: int = step_count % 100
	var final: int = pos_current + remainder
	if (final <= 0 and pos_current != 0) or (final >= 100):
		zero_touches += 1
	return zero_touches


static func calculate_final_position(pos_current: int, step_count: int) -> int:
	var result: int = pos_current + step_count
	return int(fposmod(result, 100))


static func count_zeroes_from(moves: Array) -> int:
	var zero_count: int = 0
	var pos_current: int = 50
	for move: String in moves:
		var step_count: int = int(move.lstrip(move[0])) * (-1 if move[0] == "L" else 1)
		zero_count += count_times_zero_touched(pos_current, step_count)
		pos_current = calculate_final_position(pos_current, step_count)
	return zero_count
