terraform {
  required_providers {
    google = {
      source = "hashicorp/google"
      version = "5.10.0"
    }
  }
}

provider "google" {
  credentials = "terraform_service_account_key.json"

  project = var.gcp_project_id
  region = var.gcp_region
}
