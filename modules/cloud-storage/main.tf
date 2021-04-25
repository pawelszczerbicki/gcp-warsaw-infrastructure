resource "google_storage_bucket" "bucket" {
  name = var.name
  location = var.location
  storage_class = var.class
  lifecycle_rule {
    action {
      type = "Delete"
    }
    condition {
      age = 4
    }
  }
}

output "storage_location" {
  value = google_storage_bucket.bucket.location
}
