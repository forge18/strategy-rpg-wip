extends Reference


const uuid = preload("res://systems/uuid.gd")

static func get_modifier_template():
	return {
		"id:": uuid.v4(),
		"source_entity_id": null,
		"target_entity_id": null,
		"attribute": null,
		"conditions": [],
		"operator": null,
		"value": null,
		"duration": null
	}
