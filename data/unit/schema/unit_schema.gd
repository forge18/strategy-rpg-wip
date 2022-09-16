extends Resource
class_name UnitSchema

const collections = Collections
const AttributeEnum = collections.AttributeEnum

export(String) var name: String
export(String) var description: String
export(collections.JobEnum) var job: int
export(collections.BehaviorEnum) var behavior: int

var attributes: Dictionary = {
	AttributeEnum.HEALTH: collections.Attributes[AttributeEnum.Health].duplicate(),
	AttributeEnum.MANA: collections.Attributes[AttributeEnum.Mana].duplicate()
}


