terraform {
  backend "gcs" {
    bucket = "cloud-build-deployments-tfstate-gcp"
    prefix = "env/stg"
  }
}
