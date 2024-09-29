provider "google" {
  project = var.project_id
  region  = var.region
}

terraform {

  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 6.1.0" # Or a newer version
    }
  }
  /*
  backend "local" {
    path = "terraform/state/terraform.tfstate"
  }
 */

  backend "gcs" {
    bucket = "lhz-bucket-tf_backend"
    prefix = "terraform/state"
  }

}

module "storage" {
  source = "./storage" # Path to the module
  region = var.region
}

module "vpc" {
  source     = "./vpc" # Path to the module
  project_id = var.project_id
  region     = var.region
  zone       = var.zone
}

module "instance" {
  source              = "./instance" # Path to the module
  instance_name       = "lhz_linux_vm"
  instance_zone       = var.zone
  instance_network    = module.vpc.network_self_link
  instance_subnetwork = module.vpc.subnet_self_link
}

