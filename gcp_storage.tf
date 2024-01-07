resource "google_storage_bucket" "state-storage" {
  location = "EU"
  name     = "stock-market-research-tf-state-${var.project_shortname}"
  force_destroy = false

  uniform_bucket_level_access = true
  public_access_prevention = "enforced"

  versioning {
    enabled = true
  }

  lifecycle_rule {
    condition {
      num_newer_versions = 100
    }
    action {
      type = "Delete"
    }
  }

  lifecycle_rule {
    condition {
      days_since_noncurrent_time = 31
    }
    action {
      type = "Delete"
    }
  }

  lifecycle_rule {
    condition {
      age = 90
      matches_suffix = ["tf.plan"]
    }
    action {
      type = "Delete"
    }
  }

  depends_on = [google_project_service.enabled_apis]
}


output "bucket_name" {
  value = google_storage_bucket.state-storage.name
}
