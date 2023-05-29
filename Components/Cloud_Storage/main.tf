module "gsb" {
 
  source                                = "../../Modules/Cloud_Storage/"
  bucket_name                           = var.storage_bucket_name
  region                                = var.region
  storage_class                         = var.storage_class
  force_destroy                         = var.force_destroy
  uniform_bucket_level_access           = var.uniform_bucket_level_access
  versioning_enabled                    = var.versioning_enabled

}