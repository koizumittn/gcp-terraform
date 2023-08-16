# terraform setting
terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "4.4.0"
    }
  }
}

# provider setting
provider "google" {
  region = var.google_cloud_region
  zone   = var.google_cloud_zone
}

# Google Cloud Project
# See: https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/google_project
resource "google_project" "my_terraform_project" {
  name            = "My Terraform Project"
  project_id      = var.google_cloud_project_id
  billing_account = var.billing_account
}

# Enable Service APIs using module provided by google
# See: https://registry.terraform.io/modules/terraform-google-modules/project-factory/google/latest/submodules/project_services
module "project-services" {
  source  = "terraform-google-modules/project-factory/google//modules/project_services"
  version = "~> 14.3"

  project_id = google_project.my_terraform_project.project_id

  activate_apis = [
    "compute.googleapis.com",
    "iam.googleapis.com",
  ]
}
