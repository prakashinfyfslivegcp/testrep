data "google_compute_network" "vpc" {
  name                                = var.vpc_name
}

data "google_compute_image" "image" {
  family                              = var.image_family
  project                             = var.image_project
}

data "template_file" "startup_script" {
  template                            = "${file("${path.module}/startup_script.sh")}"
}

module "mig" {
 
  source                                = "../../Modules/managed_instance_group/"
  instance_template_name_prefix         = var.instance_template_name_prefix 
  machine_type                          = var.machine_type 
  boot_disk_size_gb                     = var.boot_disk_size_gb 
  boot_disk_auto_delete                 = var.boot_disk_auto_delete 
  boot_disk_type                        = var.boot_disk_type 
  startup_script                        = "${base64encode(data.template_file.startup_script.rendered)}"
  network_name                          = data.google_compute_network.vpc.self_link
  image_name                            = data.google_compute_image.image.self_link
  instance_group_manager_name           = var.instance_group_manager_name 
  base_instance_name                    = var.base_instance_name 
  target_size                           = var.target_size
  zone                                  = var.mig_zone 
  service_port                          = var.service_port 
  region                                = var.region
  mig_name                              = var.mig_name
  disk_type                             = var.disk_type 
  service_port_name                     = var.service_port_name 
  target_pool_session_affinity          = var.target_pool_session_affinity
  hc_request_path                       = var.hc_request_path 
  min_num_replicas                      = var.min_num_replicas
  max_num_replicas                      = var.max_num_replicas
  cool_down_period_sec                  = var.cool_down_period_sec
  target_cpu_utilization                = var.target_cpu_utilization
}