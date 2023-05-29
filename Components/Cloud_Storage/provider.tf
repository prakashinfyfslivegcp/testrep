provider "google" {
  project = var.project_id
  credentials = file("~/gcp/access-keys.json")
  region  = var.region
}