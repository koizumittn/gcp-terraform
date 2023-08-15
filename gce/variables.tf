# See:
# https://developer.hashicorp.com/terraform/language/values/variables#environment-variables

variable "google_cloud_project" {
    type = string
}

variable "google_cloud_credentials_file" {
    type = string
}

variable "google_cloud_region" {
    type = string
}

variable "google_cloud_zone" {
    type = string
}