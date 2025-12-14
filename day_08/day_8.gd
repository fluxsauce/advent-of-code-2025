class_name Day8
extends RefCounted


static func parse_points(raw: String) -> Array:
	var points: Array = []
	for row in raw.split("\n"):
		var c: Array = row.split(",")
		points.append(Vector3i(int(c[0]), int(c[1]), int(c[2])))
	return points


static func find_closest_points(points: Array) -> Array:
	var closest_source: Vector3i
	var closest_target: Vector3i
	var closest_distance: float
	for point_source: Vector3i in points:
		for point_target: Vector3i in points:
			if point_source == point_target:
				continue
			var distance: float = point_source.distance_to(point_target)
			if !closest_distance or distance < closest_distance:
				closest_source = point_source
				closest_target = point_target
				closest_distance = distance
	return [closest_source, closest_target]
