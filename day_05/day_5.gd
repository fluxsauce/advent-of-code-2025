class_name Day5
extends RefCounted


static func pack_fresh_range(index_a: int, ranges: Array) -> Array:
	#print()
	#print_debug("start: %s index: %s" % [ranges, index_a])

	var ranges_size: int = ranges.size()
	if index_a > (ranges_size - 1):
		#print_debug("Invalid index, we're done")
		return ranges

	var a: Array = ranges[index_a]

	for index_b in range(ranges_size):
		var b: Array = ranges[index_b]

		# Ignore itself.
		if index_a == index_b:
			#print_debug("%s: ignoring itself" % [a])
			continue

		# A ends and B starts one away or is exactly the same.
		if (a[1] < b[0] && a[1] + 1 == b[0]) or (a[1] == b[0]):
			var new_range: Array = [a[0], b[1]]
			#print_debug(
			#"%s,%s: A ends and B starts one away, combining into %s" % [a, b, new_range]
			#)
			ranges[index_a] = new_range
			ranges.remove_at(index_b)
			#print_debug("end: %", ranges)
			return ranges

		# B ends and A starts one away or is exactly the same
		if (b[1] < a[0] && b[1] + 1 == a[0]) or (b[1] == a[0]):
			var new_range: Array = [b[0], a[1]]
			#print_debug(
			#"%s,%s: B ends and A starts one away, combining into %s" % [a, b, new_range]
			#)
			ranges[index_a] = new_range
			ranges.remove_at(index_b)
			#print_debug("end: %", ranges)
			return ranges

		# A ends before B starts.
		if a[1] <= b[0]:
			#print_debug("%s,%s: A ends before B starts, ignoring" % [a, b])
			continue

		# A starts after B starts.
		if a[0] >= b[1]:
			#print_debug("%s,%s: A starts after B ends, ignoring" % [a, b])
			continue

		# A intersects with B; also covers A and B being the same ranges.
		if a[0] <= b[0] && a[1] >= b[0] && a[1] <= b[1]:
			var new_range: Array = [a[0], b[1]]
			#print_debug("%s,%s: A intersects with B, combining into %s" % [a, b, new_range])
			ranges[index_a] = new_range
			ranges.remove_at(index_b)
			#print_debug("end: %", ranges)
			return ranges

		# B intersects with A.
		if b[0] <= a[0] && b[1] > a[0] && b[1] <= a[1]:
			var new_range: Array = [b[0], a[1]]
			#print_debug("%s,%s: B intersects with A, combining into %s" % [a, b, new_range])
			ranges[index_a] = new_range
			ranges.remove_at(index_b)
			#print_debug("end: %", ranges)
			return ranges

		# A is completely within B.
		if b[0] <= a[0] && b[1] >= a[1]:
			#print_debug("%s,%s: A is completely within B, removing A" % [a, b])
			ranges.remove_at(index_a)
			#print_debug("end: %", ranges)
			return ranges

		# B is completely within A.
		if a[0] <= b[0] && a[1] >= b[1]:
			#print_debug("%s,%s: B is completely within A, removing B" % [a, b])
			ranges.remove_at(index_b)
			#print_debug("end: %", ranges)
			return ranges

	#print_debug("end (no change): %", ranges)
	return ranges


static func pack_fresh_ranges(ranges_source: Array) -> Array:
	var ranges_target: Array = []
	for index in range(ranges_source.size()):
		ranges_target.append(ranges_source[index])
		# Process it until there's no changes left.
		var changed: bool = true
		var old_size: int = ranges_target.size()
		while changed:
			# Intentionally checking the size every time.
			for target_index in range(ranges_target.size()):
				ranges_target = pack_fresh_range(target_index, ranges_target)
				# Check if there's any differences.
				var new_size: int = ranges_target.size()
				if new_size == old_size:
					changed = false

	ranges_target.sort_custom(sort_by_first_element)
	return ranges_target


static func parse_fresh_ranges(raw: String) -> Array:
	var rows: PackedStringArray = raw.split("\n")
	var fresh_ranges: Array = []
	var parse: bool = true
	for row in rows:
		if row == "":
			parse = false
		if parse:
			var row_values: PackedStringArray = row.split("-")
			var start: int = int(str(row_values[0]))
			var end: int = int(str(row_values[1]))
			fresh_ranges.append([start, end])
	return fresh_ranges


static func parse_available_ids(raw: String) -> Array:
	var rows: PackedStringArray = raw.split("\n")
	var available: Array = []
	var ready: bool = false
	for row in rows:
		if ready:
			available.append(int(row))
		elif row == "":
			ready = true
	return available


static func check_ranges_if_fresh(id: int, fresh_ranges: Array) -> bool:
	for fresh_range: Array in fresh_ranges:
		if is_fresh(id, fresh_range):
			return true
	return false


static func get_first_range_index(id: int, fresh_ranges: Array) -> int:
	var fresh_ranges_size: int = fresh_ranges.size()
	for index: int in range(fresh_ranges_size):
		if is_fresh(id, fresh_ranges[index]):
			return index
	# Impossible to get here
	return -1


static func is_fresh(id: int, fresh_range: Array) -> bool:
	return id >= fresh_range[0] and id <= fresh_range[1]


static func count_fresh(raw: String) -> int:
	var fresh_ranges: Array = parse_fresh_ranges(raw)
	var available_ids: Array = parse_available_ids(raw)
	var fresh: Array = []
	for id: int in available_ids:
		if check_ranges_if_fresh(id, fresh_ranges):
			fresh.append(id)
	return fresh.size()


static func count_from_packed_ranges(packed_ranges: Array) -> int:
	var count: int = 0
	var packed_ranges_size: int = packed_ranges.size()
	for index in range(packed_ranges_size):
		count += (packed_ranges[index][1] - packed_ranges[index][0]) + 1
	return count


static func sort_by_first_element(a: Array, b: Array) -> bool:
	return a[0] < b[0]
