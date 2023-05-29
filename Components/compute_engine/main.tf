data "google_compute_network" "vpc" {
  name = var.vpc_name
}

data "google_compute_image" "image" {
  family  = var.image_family
  project = var.image_project
}

data "google_compute_subnetwork" "subnetwork" {
  name          = var.subnetwork_name
  region        = var.region
  depends_on    = [data.google_compute_network.vpc]
}

data "template_file" "startup_script" {
  template                           = "${file("${path.module}/startup_script.sh")}"
}


module "gce" {
 
  source                                = "../../Modules/compute_engine/"
  instance_name                         = var.instance_name
  machine_type                          = var.instance_type
  zone                                  = var.instance_zone
  common_tags                           = var.common_tags
  startup_script                        = "${base64encode(data.template_file.startup_script.rendered)}"
  image_name                            = data.google_compute_image.image.self_link
  network_name                          = data.google_compute_subnetwork.subnetwork.self_link
  public_ip_name                        = var.public_ip_name
}