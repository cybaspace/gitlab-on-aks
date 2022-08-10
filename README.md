# Installing GitLab 
## Using Terraform with helm provider
## Target: Azure Kubernetes Cluster

# Prerequists
Assuming the AKS Cluster is already installed - s. [Microsoft Documentation](https://docs.microsoft.com/en-us/azure/aks/learn/quick-kubernetes-deploy-cli)

e.g.
```
az aks create -g $RESOURCE_GROUP -n $CLUSTER_NAME --enable-managed-identity --node-count 2 --node-vm-size Standard_B2ms -- enable-cluster-autoscaler --min-count 2 --max-count 10 --enable-addons monitoring --enable-msi-auth-for-monitoring  --generate-ssh-keys
```

Cluster Credentials stored in `~/.kube/config` file:
```
az aks get-credentials -g $RESOURCE_GROUP -n $CLUSTER_NAME
```

We are using Azure Storage to persist Terraform statefiles - s. [Microsoft Documentation](https://docs.microsoft.com/de-de/azure/developer/terraform/store-state-in-azure-storage?tabs=azure-cli)


# After Installation
To read password for root user from k8s (jq must be installed!)
```
kubectl get secret -n gitlab gitlab-gitlab-initial-root-password -o jsonpath='{.data}' | jq -r '. | map_values(@base64d) | .password'
```