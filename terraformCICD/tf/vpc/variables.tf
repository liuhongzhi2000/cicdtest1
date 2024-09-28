variable "region" {
  description = "region"
  type        = string
  #default     = "us-east1"  # You can set a default value or leave it empty
}

variable "zone" {
  description = "zone"
  type        = string
  #default     = "us-east1-c"  # You can set a default value or leave it empty
}

variable "project_id" {
  description = "proj id"
  type        = string
  #default = "qwiklabs-gcp-00-16567630e837"
}
