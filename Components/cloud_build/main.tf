provider "google" {
  project = "onyx-hangout-380014"
  credentials = file("C:/HSBC/gcp/onyx-hangout-380014-d0859b9f2f83.json")
  region  = "us-east1"
}

resource "google_cloudbuild_trigger" "my_trigger" {
  name          = "my-trigger"
  description   = "My Cloud Build Trigger"
  project       = "onyx-hangout-380014"
  trigger_template {
    branch_name       = "main"
    project_id        = "onyx-hangout-380014"
    repo_name         = "prakashinfyfslivegcp/FSLiveGcp"
    dir               = "prakashinfyfslivegcp/FSLiveGcp"
  }
}
