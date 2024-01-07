resource "google_service_account" "sa" {
  account_id = "service-terraform"
  description = "Enables terraform to create and manage resources"

  depends_on = [google_project_service.enabled_apis]
}

resource "google_project_iam_binding" "project_owner_role" {
  members = [
    "serviceAccount:${google_service_account.sa.email}"
  ]
  project = var.gcp_project_id
  role    = "roles/editor"

  depends_on = [google_service_account.sa]
}

output "sa_email" {
  value = google_service_account.sa.email
}
