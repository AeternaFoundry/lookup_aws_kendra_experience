data "aws_kendra_experience" "kendra_experience_lookup" {
  for_each = var.kendra_experience_lookup

  experience_id = each.value.experience_id
  index_id      = each.value.index_id
  region        = each.value.region
}

