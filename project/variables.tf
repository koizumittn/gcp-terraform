# See:
# https://developer.hashicorp.com/terraform/language/values/variables#environment-variables

variable "credentials_file" {
  type = string
}

variable "region" {
  type = string
}

variable "zone" {
  type = string
}

variable "project_id" {
  type = string
}

variable "billing_account" {
  type = string
}
