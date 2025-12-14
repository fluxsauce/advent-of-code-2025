class_name Helpers


static func get_text_file_content(file_path: String) -> String:
	var file: FileAccess = FileAccess.open(file_path, FileAccess.READ)
	var content: String = file.get_as_text()
	file.close()
	return content.strip_edges()


static func sparse_grid_from_raw(raw: String) -> Dictionary:
	var sparse_grid: Dictionary = {}
	var raw_rows: PackedStringArray = raw.split("\n")
	var y: int = 0
	for raw_row in raw_rows:
		var x: int = 0
		for character in raw_row:
			sparse_grid[Vector2i(x, y)] = character
			x += 1
		y += 1
	return sparse_grid


static func sparse_grid_render(sparse_grid: Dictionary) -> String:
	var ret_val: String = ""
	var last_y: int = 0
	for location: Vector2i in sparse_grid:
		if location.y != last_y:
			ret_val += "\n"
			last_y = location.y
		ret_val += sparse_grid[location]
	return ret_val + "\n"


static func get_sparse_grid_max_x_y(sparse_grid: Dictionary) -> Array:
	var max_x: int = 0
	var max_y: int = 0
	for location: Vector2i in sparse_grid:
		if location.x > max_x:
			max_x = location.x
		if location.y > max_y:
			max_y = location.y
	return [max_x, max_y]
