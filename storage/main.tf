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
  project = var.google_cloud_project_id
  region  = var.google_cloud_region
  zone    = var.google_cloud_zone
}

/*****************************
  Google Cloud Storage
******************************/

# Bucket
# See: https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/storage_bucket
resource "google_storage_bucket" "my-bucket" {
  name          = "${var.google_cloud_project_id}-tf-bucket"
  location      = var.google_cloud_region
  force_destroy = true
}

# Bucket Object
# See: https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/storage_bucket_object
resource "google_storage_bucket_object" "sample-object" {
  name   = "sample.txt"
  source = "./sample.txt"
  bucket = google_storage_bucket.my-bucket.name
}

# google_storage_bucket_iam_binding
# See: https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/storage_bucket_iam#google_storage_bucket_iam_binding
resource "google_storage_bucket_iam_binding" "binding" {
  bucket = google_storage_bucket.my-bucket.name
  role = "roles/storage.objectViewer" # only read access
  # role = "roles/storage.admin" # full access
  members = [
    "serviceAccount:${google_service_account.test-vm-sa.email}",
  ]
}