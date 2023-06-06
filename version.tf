provider "google" {
  project = var.project_id
  region  = var.region
}

terraform {
  required_version = ">=1.2.2"
}
