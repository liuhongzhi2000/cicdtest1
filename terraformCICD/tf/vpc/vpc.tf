# Define the VPC network in custom mode
resource "google_compute_network" "lhz_custom_network" {
  name                    = "lhz-custom-vpc-network1"
  auto_create_subnetworks  = false  # This is important to disable automatic subnet creation
}

resource "google_compute_subnetwork" "lhz_subnet_1" {
  name          = "lhz-custom-subnet-1"
  ip_cidr_range = "10.99.1.0/24"
  region        = var.region
  network       = google_compute_network.lhz_custom_network.id
}

# Output the subnet self_link
output "subnet_self_link"{
  value = google_compute_subnetwork.lhz_subnet_1.self_link
}

# Output the network self_link
output "network_self_link" {
  value = google_compute_network.lhz_custom_network.self_link
}

# Output the network name
output "network_name" {
  value = google_compute_network.lhz_custom_network.name
}



#############firewall###################
resource "google_compute_firewall" "tf-firewall" {
  name    = "lhz-tf-firewall-http-ssh-rdp-icmp"
  network = google_compute_network.lhz_custom_network.self_link
  allow {
    protocol = "tcp"
    ports    = ["80","22","3389"]
  }
  #allow {
  #  protocol = "icmp"
  #}

  # Allow traffic from all sources
  source_ranges = ["0.0.0.0/0"]

  description = "Allow  http-ssh-rdp-icmp"
}



