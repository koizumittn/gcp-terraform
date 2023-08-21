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
  zone    = var.zone
}

# Cloud Functions - Public Funtion
# https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/cloudfunctions_function
resource "google_storage_bucket" "main" {
  name     = "${var.project_id}-functions-bucket"
  location = var.region
  force_destroy = true
}

resource "google_storage_bucket_object" "archive" {
  name   = "index.zip"
  bucket = google_storage_bucket.main.name
  source = "./src/index.zip"
}

resource "google_cloudfunctions_function" "main" {
  name        = "hello-world"
  description = "My function that deployed using terraform"
  runtime     = "nodejs20"

  available_memory_mb   = 128
  source_archive_bucket = google_storage_bucket.main.name
  source_archive_object = google_storage_bucket_object.archive.name
  trigger_http          = true
  entry_point           = "helloGET"
}

# IAM entry for all users to invoke the function
resource "google_cloudfunctions_function_iam_member" "invoker" {
  project        = google_cloudfunctions_function.main.project
  region         = google_cloudfunctions_function.main.region
  cloud_function = google_cloudfunctions_function.main.name

  role   = "roles/cloudfunctions.invoker"
  member = "allUsers"
}