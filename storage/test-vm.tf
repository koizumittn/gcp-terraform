# GCE VM instance
# https://registry.terraform.io/providers/hashicorp/google/latest/docs/guides/getting_started#provisioning-your-resources
resource "google_compute_instance" "test-vm" {
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

  service_account {
    # Google recommends custom service accounts that have cloud-platform scope and permissions granted via IAM Roles.
    email  = google_service_account.test-vm-sa.email
    scopes = ["cloud-platform"]
  }
}

# Service Account
# See: https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/google_service_account
resource "google_service_account" "test-vm-sa" {
  account_id   = "test-vm-sa"
  display_name = "Service Account for Test VM"
}
