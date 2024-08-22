package rebac.check

# default to a closed system (deny by default)
default allowed = false

# resource context is expected in the following form:
# {
#   "relation": "relation or permission name",
#   "object_type": "object type that carries the relation or permission",
#   "object_id": "id of object instance with type of object_type"
# }
allowed {
  ds.check({
    "object_type": input.resource.object_type,
    "object_id": input.resource.object_id,
    "relation": input.resource.relation,
    "subject_type": "user",
    "subject_id": input.user.id
  })
}
