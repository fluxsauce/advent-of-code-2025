class_name SimpleTree
extends RefCounted

var id: Vector2i
var children: Array = []
var _cached_count: int = -1


func _init(new_id: Vector2i) -> void:
	id = new_id


func count_paths_from_this_node() -> int:
	if _cached_count > -1:
		return _cached_count

	var count: int = 0
	if children.size() == 0:
		count = 1
	else:
		for child: SimpleTree in children:
			count += child.count_paths_from_this_node()

	_cached_count = count
	return count


func find_node_by_id(target_id: Vector2i) -> SimpleTree:
	if id == target_id:
		return self

	for child: SimpleTree in children:
		var search: SimpleTree = child.find_node_by_id(target_id)
		if search:
			return search

	return null
