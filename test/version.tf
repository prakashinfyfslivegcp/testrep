provider "google" {
  project = var.project
  region  = var.region
}

terraform {
  required_version = ">=1.2.2"
}
