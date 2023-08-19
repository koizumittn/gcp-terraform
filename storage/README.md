# Terraform - Google Cloud Storage

See:

- [Terraform Official Document](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/storage_bucket)

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

## Check Created Bucket

```
gcloud config set [PROJECT_ID]
gsutil ls
```

## Confirm Access Permission

Read and write file on GCS bucket from vm instance.

```
gcloud compute ssh [INSTANCE]

# at vm instance
# read
gsutil ls gs://[BUCKET_NAME]

# write
touch upload_file_from_vm.txt
gsutil cp upload_file_from_vm.txt gs://[BUCKET_NAME]
gsutil ls gs://[BUCKET_NAME]
```