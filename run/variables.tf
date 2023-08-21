# See:
# https://developer.hashicorp.com/terraform/language/values/variables#environment-variables

variable "project_id" {
  type = string
}

variable "credentials_file" {
  type = string
}

variable "region" {
  type = string
}

variable "zone" {
  type = string
}

variable "container_image_url" {
  type = string
}