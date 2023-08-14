## Summary
Deploy container on Cloud Run using terraform.

hello-world container is simple web server that response "Hello World!"

## Prepare node.js web application
See the following documents.

[Cloud Run Hello World Sample](https://github.com/GoogleCloudPlatform/nodejs-docs-samples/tree/main/run/helloworld)

## Create container repository and push container image
Create Artifact Registry.
Ref:[Create a Docker repository](https://cloud.google.com/artifact-registry/docs/docker/store-docker-container-images#create)

```bash
gcloud artifacts repositories create hello-world-repo --repository-format=docker \
--location=[REGION] --description="Docker repository"
```

Run the following command to verify that your repository was created.

```bash
gcloud artifacts repositories list
```

## Configure authentication

```bash
gcloud auth configure-docker asia-northeast1-docker.pkg.dev
```

## Push the image to Artifact Registry
Build the image with a registry name.
"--platform linux/amd64" is necessary if using M1 Mac (Apple Silicon).

```bash
$ cd hello-world
$ docker build \
--platform linux/amd64 \
-t [REGION]-docker.pkg.dev/[GOOGLE_CLOUD_PROJECT_ID]/hello-world-repo/hello-world-web-app .
```

Push the image to Artifact Registry.

```bash
$ docker push [REGION]-docker.pkg.dev/[GOOGLE_CLOUD_PROJECT_ID]/hello-world-repo/hello-world-web-app
```

## Terraform Deploy

```bash
$ terraform init
$ terraform plan
$ terraform apply
```

Run the following command to verify that your service is created.

```bash
$ gcloud run services list
```

Run the following command to verify that your service responses "Hello World!".

```bash
$ curl [SERVICE_URL]
```

## Clean up

Delete the terraform resources.

```bash
$ terraform destroy
```

Delete the Artifact Registry.

```bash
$ gcloud artifacts repositories delete hello-world-repo --region [REGION]
```
