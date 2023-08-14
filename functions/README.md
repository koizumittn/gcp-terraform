# Terraform - Google Cloud Functions - Hello World
See:

- [Google Cloud Functions - Hello World sample](https://github.com/GoogleCloudPlatform/nodejs-docs-samples/blob/main/functions/helloworld/README.md)
- [Terraform Official Document - Cloud Functions](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/cloudfunctions_function)

## Prepare Terraform Deploy
- Set the following environment variables:

```
export TF_VAR_google_cloud_project=[PROJECT_ID]
export TF_VAR_google_cloud_credentials_file="./path/to/credentials/file"
export TF_VAR_google_cloud_region=[REGION]
export TF_VAR_google_cloud_zone=[ZONE]
```

- Create zip file contains code:

```
cd src
npm install
zip -r index.zip ./
cd ..
```

- Terraform init:

```
terraform init
terraform plan
```

## Deploy and run the sample
Run terraform apply:

```
terraform apply
```

Get trigger url:

```
gcloud functions describe terraform-function-hello-world --region [REGION] --flatten httpsTrigger.url
```

Run Function by HTTP GET request:

```
curl [FUNCTION_URL]
# expected response "Hello World!"
```

## Clean up

```
terraform destroy
```