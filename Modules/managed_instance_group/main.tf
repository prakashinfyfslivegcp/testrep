resource "google_compute_http_health_check" "compute" {
  name                       = "${var.mig_name}-compute-hc"
  request_path               = var.hc_request_path
  port                       = "${var.service_port}"
}


resource "google_compute_instance_template" "instance_template" {
  name_prefix                = var.instance_template_name_prefix 
  machine_type               = var.machine_type
  region                     = var.region              

  metadata = {
    startup-script           = var.startup_script
  }

  network_interface {
    subnetwork               = var.network_name
  access_config {
      
    }
  }

  disk {
    auto_delete             = var.boot_disk_auto_delete
    boot                    = true
    source_image            = var.image_name
    type                    = var.disk_type 
    disk_type               = var.boot_disk_type
    disk_size_gb            = var.boot_disk_size_gb
  }

  lifecycle {
    create_before_destroy   = true
  }
}

resource "google_compute_instance_group_manager" "instance_group_manager" {
  name                     = var.instance_group_manager_name 
  base_instance_name       = var.base_instance_name
  version {
    instance_template      = google_compute_instance_template.instance_template.self_link
  }
  target_pools             = ["${google_compute_target_pool.compute.self_link}"]
  target_size              = var.target_size
  zone                     = var.zone
  named_port {
    name                   = var.service_port_name 
    port                   = "${var.service_port}"
  }
}

resource "google_compute_target_pool" "compute" {
  name                    = "${var.mig_name}-target-pool"
  session_affinity        = var.target_pool_session_affinity
  health_checks = [
    "${google_compute_http_health_check.compute.name}",
  ]
}

resource "google_compute_autoscaler" "autoscaler" {
  name                    = "${var.mig_name}-autoscaler"
  zone =  var.zone          
  target                  = "${google_compute_instance_group_manager.instance_group_manager.self_link}"
  autoscaling_policy {
    min_replicas          = var.min_num_replicas
    max_replicas          = var.max_num_replicas
    cooldown_period       = var.cool_down_period_sec
    cpu_utilization {
      target              = var.target_cpu_utilization
    }
  }
}
