module "gh_oidc" {
  source      = "terraform-google-modules/github-actions-runners/google//modules/gh-oidc"
  project_id  = var.gcp_project_id
  pool_id     = "terraform-pool"
  provider_id = "terraform-provider"
  sa_mapping = {
    "terraform-service-account" = {
      sa_name   = google_service_account.sa.id
      attribute = "attribute.repository/niki130396/${var.trusted_github_repo}"
    }
  }
}

output "workload_identity_provider" {
  value = module.gh_oidc.provider_name
}

output "workload_identity_pool" {
  value = module.gh_oidc.pool_name
}
