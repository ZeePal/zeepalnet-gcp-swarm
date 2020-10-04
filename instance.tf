resource google_compute_instance swarm {
  name     = "swarm-1"
  hostname = "swarm-1.gcp.${var.domain}"

  machine_type = "f1-micro"

  allow_stopping_for_update = true

  boot_disk {
    initialize_params {
      image = "cos-cloud/cos-stable" # cos-stable-85-13310-1041-9
    }
  }

  network_interface {
    network = "default"
  }

  metadata_startup_script = file("${path.module}/startup_script")
}
