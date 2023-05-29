provider "google" {
  project = "onyx-hangout-380014"
  credentials = file("C:/HSBC/gcp/onyx-hangout-380014-d0859b9f2f83.json")
  region  = var.region
}