resource "google_project_service" "appengine" {
  service = "appengine.googleapis.com"
}

resource "google_project_service" "iam" {
  service = "iam.googleapis.com"
}

resource "google_app_engine_application" "app" {
  location_id = var.location
  depends_on = [google_project_service.appengine]
}

data "google_app_engine_default_service_account" "default" {
  depends_on = [google_project_service.iam]
}
