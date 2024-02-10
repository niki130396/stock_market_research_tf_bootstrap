resource "google_service_account" "sa" {
  account_id = "service-terraform"
  description = "Enables terraform to create and manage resources"

  depends_on = [google_project_service.enabled_apis]
}

resource "google_project_iam_member" "project_owner_role" {
  member = "serviceAccount:${google_service_account.sa.email}"
  project = var.gcp_project_id
  role    = "roles/owner"

  depends_on = [google_service_account.sa]
}

output "sa_email" {
  value = google_service_account.sa.email
}
