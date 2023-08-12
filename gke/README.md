## Terraform Apply

```bash
$ terraform apply
```

View created resources.

```bash
# GKE cluster
$ gcloud container clusters list

# GKE node pool
$ gcloud container node-pools list --region asia-northeast1 --cluster my-gke-cluster
```

## Connect GKE Cluster and deploy container
Get GKE Endpoint and credentials

```bash
$ gcloud container clusters get-credentials my-gke-cluster --region asia-northeast1
```

If gke-gcloud-auth-plugin is not exist, you should install using below command.

Ref: [Here's what to know about changes to kubectl authentication coming in GKE v1.26](https://cloud.google.com/blog/products/containers-kubernetes/kubectl-auth-changes-in-gke)

```bash
$ gcloud components install gke-gcloud-auth-plugin
```

Get node info using kubectl

```bash
$ kubectl get nodes
```

Deploy hello-world container

```bash
$ kubectl create deployment hello-world --image=hello-world
```

## Delete terraform resources

```bash
$ terraform destroy
```