## Environment
- macOS Monterey v12.6
- Terraform CLI v1.5.4
- Google Cloud SDK v422.0.0

## Install Terraform
[Document](https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli)

```bash
$ brew tap hashicorp/tap
$ brew install hashicorp/tap/terraform
```

### Enable tab completion
```bash
$ touch ~/.zshrc
$ terraform -install-autocomplete
```

## Google Cloud SDK
[Install the Google Cloud CLI](https://cloud.google.com/sdk/docs/install-sdk)

## Google Cloud Project

Authorize with a user account.

```bash
$ gcloud auth login
```

Create new project.

```bash
$ gcloud projects create <project_id> --name="Project Name"
```

Initialize the gcloud CLI.

```bash
$ gcloud init
```

### Application Default Credentials (ADC)

[Google Cloud Compute EngineをTerraformで構築してみる](https://dev.classmethod.jp/articles/google-cloud-advent-calendar-2021-18-terraform/)

```bash
$ gcloud auth application-default login
```

Add credentials file path to environment variable

```bash
$ export GOOGLE_APPLICATION_CREDENTIALS=<path for credentials file>
```