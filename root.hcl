locals {
  common_tags = {
    Project = "Devops"
  }
}



inputs = {
  common_tags = local.common_tags
}
