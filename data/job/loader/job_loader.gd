extends Reference


const JobEnum = preload("res://data/job/enums/job_enum.gd").JobEnum

const Job: Dictionary = {
	JobEnum.KNIGHT: preload("res://data/job/knight.tres"),
	JobEnum.ROGUE: preload("res://data/job/rogue.tres"),
	JobEnum.WIZARD: preload("res://data/job/wizard.tres")
}
