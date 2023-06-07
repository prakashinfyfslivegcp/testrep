resource "google_compute_address" "public_ip" {
  name    = var.public_ip_name
  project = var.project
}

resource "google_compute_instance" "gce_instance" {
  name         = var.instance_name
  machine_type = var.machine_type
  zone         = var.zone
  boot_disk {
    initialize_params {
      image    = var.image_name
    }
  }
  network_interface {
    network = "default"
  access_config {
    nat_ip = google_compute_address.public_ip.address
    }
  }
}
