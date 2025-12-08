class_name Day6
extends Node


static func parse_numbers_and_symbols(raw: String, cephalopod: bool = false) -> Dictionary:
	var rows: PackedStringArray = raw.split("\n")

	var data: Dictionary = {
		numbers = {},
		symbols = [],
		starts = [],
		length = [],
	}

	# Find width of column.
	var symbols:String = rows[-1]
	rows.remove_at(rows.size() - 1)

	var working_length:int = 0
	for index:int in range(symbols.length()):
		var character:String = symbols[index]
		if character != " ":
			data.starts.append(index)
			data.symbols.append(character)
			if index > 0:
				data.length.append(working_length - 1)
			working_length = 0
		working_length += 1

	# Special case: because of end of line trimming, we'll have to calculate the length.
	var last_length: int = 0
	for row in rows:
		var current_length: int = row.length() - data.starts[-1]
		if current_length > last_length:
			last_length = current_length
	data.length.append(last_length)

	# Get the values.
	for row in rows:
		var index:int = 0
		for start:int in data.starts:
			if !data.numbers.has(index):
				data.numbers[index] = []
			var snippet: String = "%-*s" % [data.length[index], row.substr(start, data.length[index])]
			data.numbers[index].append(snippet)
			index += 1

	if cephalopod:
		var replacement_numbers: Dictionary = {}
		for index in range(data.symbols.size()):
			var numbers:Array = data.numbers[index]
			var new_numbers:Dictionary = {}
			for number:String in numbers:
				for char_index:int in number.length():
					if !new_numbers.has(char_index):
						new_numbers[char_index] = ""
					new_numbers[char_index] += number[char_index]
			replacement_numbers[index] = new_numbers.values()
			replacement_numbers[index].reverse()
		data.numbers = replacement_numbers

	return data

static func calculate_problem(data: Dictionary, index: int) -> int:
	var symbol:String = data.symbols[index]
	var numbers:Array = data.numbers[index]
	if symbol == '*':
		var product:int = 1
		for number:String in numbers:
			product *= int(number)
		return product
	if symbol == '+':
		var sum:int = 0
		for number:String in numbers:
			sum += int(number)
		return sum
	return 0

static func calculate_problem_sums(data: Dictionary) -> int:
	var sum:int = 0
	for index in range(data.symbols.size()):
		sum += calculate_problem(data, index)
	return sum
