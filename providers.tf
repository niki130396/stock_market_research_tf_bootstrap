terraform {
  required_providers {
    google = {
      source = "hashicorp/google"
      version = "= 4.51.0"
    }
  }
  required_version = ">= 1.3.7"
}

provider "google" {
  project = var.gcp_project_id
  region = var.gcp_region
}
