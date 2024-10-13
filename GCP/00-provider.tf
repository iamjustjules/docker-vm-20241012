terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "5.27.0"
    }
  }
}

provider "google" {
  project = var.setup.project
  region  = var.setup.region
  zone    = var.setup.zone
}
