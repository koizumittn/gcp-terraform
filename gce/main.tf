# terraform setting
terraform {
    required_providers {
        google = {
            source  = "hashicorp/google"
            version = "4.4.0"
        }
    }
}

# variable
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

# provider setting
provider "google" {
    project = var.google_cloud_project
    region  = var.google_cloud_region
    zone = var.google_cloud_zone
}

# GCE VM instance
resource "google_compute_instance" "vm_instance" {
    name         = "terraform-instance"
    machine_type = "e2-micro"

    boot_disk {
        initialize_params {
            image = "debian-cloud/debian-11"
        }
    }

    network_interface {
        # A default network is created for all GCP projects
        network = "default"
        access_config {
        }
    }
}