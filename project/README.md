# Terraform - Google Cloud Project - Hello World

See:

- [Terraform Offical Document - Google Project](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/google_project)
- [terraform-google-project-factory](https://github.com/terraform-google-modules/terraform-google-project-factory)
- [Project Services Module](https://registry.terraform.io/modules/terraform-google-modules/project-factory/google/latest/submodules/project_services)

## Run Terraform

Create resources with terraform:

```
terraform init
terraform plan
terraform apply
```

To remove all resources created by terraform:

```
terraform destroy
```

## Associate Billing Account to Project

set billing_account property:

```
billing_account = var.billing_account
```

## Enable Services

Use terraform-google-modules/project-factory:

```
module "project-services" {
  source  = "terraform-google-modules/project-factory/google//modules/project_services"
  version = "~> 14.3"

  project_id = google_project.my_terraform_project.project_id

  activate_apis = [
    "compute.googleapis.com",
    "iam.googleapis.com",
    ...
  ]
}
```