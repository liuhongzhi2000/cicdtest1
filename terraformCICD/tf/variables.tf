# variables.tf

variable "region" {
  description = "The region where resources will be created."
  type        = string
  default     = "asia-southeast1"  # Singapore
}

variable "zone" {
  description = "The zone within the region where resources will be created."
  type        = string
  default     = "asia-southeast1-a"  # Singapore Jurong West
}

variable "project_id" {
  description = "The Google Cloud project ID where resources will be created."
  type        = string
  default = "tech-infra-playground"
}