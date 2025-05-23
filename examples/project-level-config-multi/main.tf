provider "google" {
  project = keys(var.projects)[0]
}

provider "lacework" {}

variable "projects" {
  description = "Map of project configuration with Lacework."
  type        = map
  default     = {
    project-id-1 = "first project",
    project-id-2 = "second project"
  }
}

module "gcp_project_config" {
  source = "../../"

  for_each   = var.projects
  project_id = each.value
}
