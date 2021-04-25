resource "google_project_service" "iam" {
  service = "secretmanager.googleapis.com"
}

resource "google_secret_manager_secret" "manager" {
  secret_id = var.name
  replication {automatic = true}
  depends_on = [google_project_service.iam]
}

resource "google_secret_manager_secret_version" "secret" {
  secret = google_secret_manager_secret.manager.id
  secret_data = var.value
}
