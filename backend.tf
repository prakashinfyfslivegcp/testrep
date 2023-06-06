terraform {
  backend "gcs" {
    bucket = "cloud-build-deployments-tfstate"
    prefix = "env/stg"
  }
}
