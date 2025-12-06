class_name Helpers


static func get_text_file_content(file_path: String) -> String:
	var file: FileAccess = FileAccess.open(file_path, FileAccess.READ)
	var content: String = file.get_as_text()
	file.close()
	return content.strip_edges()
