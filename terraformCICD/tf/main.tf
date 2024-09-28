provider "google" {
  project = var.project_id
  region  = var.region
}

terraform {

    required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 6.1.0"  # Or a newer version
    }
  }
 /*
  backend "local" {
    path = "terraform/state/terraform.tfstate"
  }
 */

  backend "gcs" {
    bucket  = "lhz-bucket-tf_backend"
    prefix  = "terraform/state"
  }
  
}

module "storage" {
  source     = "./storage"  # Path to the module
  region     = var.region
}

module "vpc" {
  source     = "./vpc"  # Path to the module
  project_id = var.project_id
  region = var.region
  zone = var.zone
}


