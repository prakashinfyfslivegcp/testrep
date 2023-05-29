resource "google_compute_address" "public_ip" {
  name = var.public_ip_name
}

resource "google_compute_instance" "gce_instance" {
  name         = var.instance_name
  machine_type = var.machine_type
  zone         = var.zone
  tags         = toset(values(var.common_tags))
  boot_disk {
    initialize_params {
      image    = var.image_name
    }
  }
  network_interface {
    subnetwork = var.network_name
  

  access_config {
      nat_ip = google_compute_address.public_ip.address
    }
  }
  metadata = {
    startup-script = var.startup_script
  }
}

