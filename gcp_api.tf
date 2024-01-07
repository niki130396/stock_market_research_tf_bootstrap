locals {
  enabled_apis = [
    "iam.googleapis.com"
  ]
}

resource "google_project_service" "cloudresourcemanager_api" {
  service                    = "cloudresourcemanager.googleapis.com"
  disable_dependent_services = true
}


resource "google_project_service" "enabled_apis" {
  for_each = toset(local.enabled_apis)
  service = each.value
  disable_dependent_services = true
  depends_on = [google_project_service.cloudresourcemanager_api]
}
