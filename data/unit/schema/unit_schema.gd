extends Resource
class_name UnitSchema


const CollectionsEnum = Collections.CollectionsEnum
const JobEnum = Collections.collection_enums[CollectionsEnum.JOB]

export(String) var name: String
export(String) var description: String
export(JobEnum) var job: int

var reserves: Dictionary
var attributes: Dictionary

