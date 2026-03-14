provider "kubernetes" {
  # uses kubeconfig written by the cluster module
  config_path = "~/.kube/config"
}

provider "helm" {
  kubernetes = {
    config_path = "~/.kube/config"
  }
}

provider "aws" {
  region  = "sa-east-1"
}