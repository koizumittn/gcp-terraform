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
  project = var.google_cloud_project
  region  = var.google_cloud_region
  zone    = var.google_cloud_zone
}

# Cloud Run
# https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/cloud_run_service#example-usage---cloud-run-service-basic
resource "google_cloud_run_service" "hello-world" {
  name     = "cloudrun-terraform-hello-world-web-app"
  location = var.google_cloud_region

  template {
    spec {
      containers {
        image = var.container_image_url
      }
    }
  }

  traffic {
    percent         = 100
    latest_revision = true
  }
}

data "google_iam_policy" "noauth" {
  binding {
    role = "roles/run.invoker"
    members = [
      "allUsers",
    ]
  }
}

resource "google_cloud_run_service_iam_policy" "noauth" {
  location    = google_cloud_run_service.hello-world.location
  project     = google_cloud_run_service.hello-world.project
  service     = google_cloud_run_service.hello-world.name

  policy_data = data.google_iam_policy.noauth.policy_data
}