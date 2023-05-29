variable "bucket_name" {
  type = string
  description = "The name of our bucket"
  default = "my-buckettest-tf"
}

variable "bucket_location" {
  type = string
  default = "us-east1"
}

variable "project_id" {
  type = string
  default = "poc-adm-finserv-1133276"
}

variable "storage_class" {
  type = string
  default = "REGIONAL"

}