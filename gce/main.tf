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
    project = var.project_id
    region  = var.region
    zone = var.zone
}

# GCE VM instance
# https://registry.terraform.io/providers/hashicorp/google/latest/docs/guides/getting_started#provisioning-your-resources
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