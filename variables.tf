variable "kendra_experience_lookup" {
  description = <<EOT
Map of kendra_experience_lookup, attributes below
Required:
    - experience_id
    - index_id
Optional:
    - region
EOT

  type = map(object({
    experience_id = string
    index_id      = string
    region        = optional(string)
  }))
  validation {
    condition = alltrue([
      for k, v in var.kendra_experience_lookup : (
        (length(v.experience_id) >= 1 && length(v.experience_id) <= 36) && (can(regex("[0-9A-Za-z][0-9A-Za-z_-]*", v.experience_id)))
      )
    ])
    error_message = "all of: must be between 1 and 36 characters; Starts with an alphanumeric character. Subsequently, can contain alphanumeric characters and hyphens."
  }
  validation {
    condition = alltrue([
      for k, v in var.kendra_experience_lookup : (
        can(regex("[0-9A-Za-z][0-9A-Za-z-]{35}", v.index_id))
      )
    ])
    error_message = "Starts with an alphanumeric character. Subsequently, can contain alphanumeric characters and hyphens. Fixed length of 36."
  }
}

