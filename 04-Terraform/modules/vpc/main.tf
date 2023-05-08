resource "google_compute_subnetwork" "subnet01" {
  name          = var.subnet_name_01
  ip_cidr_range = "10.2.0.0/16"
  region        = "us-central1"
  project       = var.project_id
  network       = google_compute_network.vpc-network.id
  secondary_ip_range = [
    {
      range_name    = "pods"
      ip_cidr_range = "192.168.0.0/24"
    },
    {
      range_name    = "services"
      ip_cidr_range = "192.168.1.0/24"
    }
  ]
}

resource "google_compute_subnetwork" "subnet02" {
  name          = var.subnet_name_02
  ip_cidr_range = "10.4.0.0/16"
  region        = "europe-west2"
  project       = var.project_id
  network       = google_compute_network.vpc-network.id
}

resource "google_compute_network" "vpc-network" {
  name                    = var.network_name
  project                 = var.project_id
  auto_create_subnetworks = false
}