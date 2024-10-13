resource "google_compute_instance" "docker_instance" {
  name         = var.docker_instance.instance_name
  machine_type = var.docker_instance.machine_type
  zone         = var.setup.zone

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-12" # Container-Optimized OS
      size  = 10
    }
    auto_delete = true
  }

  network_interface {
    network    = google_compute_network.docker_vpc.name
    subnetwork = google_compute_subnetwork.docker_subnet.name

    access_config {
      # Ephemeral public IP
    }
  }

  tags = ["http-server"]

  metadata_startup_script = file("startup.sh")

  depends_on = [
    google_compute_network.docker_vpc,
    google_compute_subnetwork.docker_subnet,
    google_compute_firewall.docker_firewall
  ]
}
