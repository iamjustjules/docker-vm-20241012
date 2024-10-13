resource "google_compute_network" "docker_vpc" {
  name                    = var.docker_network.vpc
  auto_create_subnetworks = false
}

resource "google_compute_subnetwork" "docker_subnet" {
  name          = var.docker_network.subnet
  ip_cidr_range = var.docker_network.cidr
  region        = var.setup.region
  network       = google_compute_network.docker_vpc.id
}

resource "google_compute_firewall" "docker_firewall" {
  name    = var.docker_network.firewall_name
  network = google_compute_network.docker_vpc.id

  allow {
    protocol = "tcp"
    ports    = ["80", "22"]
  }

  allow {
    protocol = "icmp"
  }

  source_ranges = ["0.0.0.0/0"]
  priority      = 1000
}
