# Call the  module


resource "google_compute_instance" "tf_instances" {
  for_each = toset([ "jenkin","target" ])
  
  name         = "lhz-tf-cicd-${each.value}"
  machine_type = "e2-micro"  
  zone         = var.zone

  boot_disk {
    initialize_params {
      image = "debian-11-bullseye-v20240910"
    }
  }

  network_interface {
    
    network = module.vpc.network_self_link
    subnetwork = module.vpc.subnet_self_link

    
    access_config {
      # Include this block to give the instance a public IP address
    }
  }
  metadata_startup_script = <<-EOT
    #!/bin/bash
  EOT

  allow_stopping_for_update = true
}