# powerpipe-mod-kubernetes-image-inventory


<!-- 
.containers
.init_containers
.ephemeral_containers -->



## Installation


```bash
brew install turbot/tap/steampipe
brew install turbot/tap/powerpipe

# install kubernetes plugin
steampipe plugin install kubernetes
steampipe service restart
```


```bash
mkdir my-powerpipe
cd my-powerpipe

# 'mod init' will create mod.pp file which is needed
powerpipe mod init
```


```bash
powerpipe mod install github.com/oguzhan-yilmaz/powerpipe-mod-kubernetes-image-inventory
```

```bash
powerpipe server
```

Visit [localhost:9093](http://localhost:9033/) to see Powerpipe Dashboards.


## Configuration

### Multi Kubernetes Cluster Connections

Steampipe supports querying multiple Kubernetes clusters simultaneously by configuring multiple connections and aggregating them. Here's how to set it up:

```bash
vim $HOME/.steampipe/config/kubernetes.spc
```

```hcl
connection "kubernetes_eks_prod" {
  plugin         = "kubernetes"
  config_path    = "~/.kube/config"
  // CHANGE CONTEXT NAME
  config_context = "eks-prod-cluster" 
  source_types   = ["deployed"]
  custom_resource_tables = ["*"]
}

connection "kubernetes_gcp_staging" {
  plugin         = "kubernetes"
  config_path    = "~/.kube/config"
  // CHANGE CONTEXT NAME
  config_context = "gcp-staging"  
  source_types   = ["deployed"]
  custom_resource_tables = ["*"]
}

// add any more context here

// IMPORTANT: create 'kubernetes' aggregator with all kube contexts!
connection "kubernetes" {
  plugin      = "kubernetes"
  type        = "aggregator"
  connections = ["kubernetes_eks_prod", "kubernetes_gcp_staging"]
}
```

```bash
steampipe service restart
```
