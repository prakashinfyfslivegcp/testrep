# provider "google" {
#   project = "onyx-hangout-380014"
#   credentials = file("C:/HSBC/gcp/onyx-hangout-380014-d0859b9f2f83.json")
#   region  = var.region
# }

terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 4.0" # OIDC https://github.com/hashicorp/terraform-provider-google/releases/tag/v3.61.0
    }
  }

  backend "gcs" {
    bucket = "onyx-hangout-380014-terraform" # need to update with the bucket name
    prefix = "state"
  }
}

provider "google" {
  project = "onyx-hangout-380014"
  region  = var.region
}