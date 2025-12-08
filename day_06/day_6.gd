class_name Day6
extends Node


static func parse_problems_and_operators(raw: String) -> Dictionary:
	var rows: PackedStringArray = raw.split("\n")

	var data: Dictionary = {
		numbers = {},
		symbols = [],
	}

	for symbol in rows[-1].split(" "):
		if symbol != "":
			data.symbols.append(symbol)
	rows.remove_at(rows.size() - 1)

	for row in rows:
		var index:int = 0
		for chunk in row.split(" "):
			if chunk:
				if !data.numbers.has(index):
					data.numbers[index] = []
				data.numbers[index].append(int(chunk))
				index += 1

	return data

static func calculate_problem(data: Dictionary, index: int) -> int:
	var symbol:String = data.symbols[index]
	var numbers:Array = data.numbers[index]
	if symbol == '*':
		var product:int = 1
		for number:int in numbers:
			product *= number
		return product
	if symbol == '+':
		var sum:int = 0
		for number:int in numbers:
			sum += number
		return sum
	return 0

static func calculate_problem_sums(data: Dictionary) -> int:
	var sum:int = 0
	for index in range(data.symbols.size()):
		sum += calculate_problem(data, index)
	return sum
