module "storage" {
  source = "../../modules/cloud-storage"
  name = "${var.company}-${var.project}-main-bucket"
}

module "appengine" {
  source = "../../modules/app-engine"
  location = var.location
}

resource "google_project_service" "service" {
  service = "cloudresourcemanager.googleapis.com"
}

module "bucket_id_secret" {
  source = "../../modules/secret-manager"
  name = "bucket-name"
  value = module.storage.name
  depends_on = [google_project_service.service]
}
