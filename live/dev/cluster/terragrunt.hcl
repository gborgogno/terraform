include {
  path = find_in_parent_folders()
}

locals {
  environment = "dev"
  region = "onprem"
}

terraform {
  source = "git::ssh://git@github.com/Devops-Solutions-SC-LTDA/terraform-modules.git//kubernetes-cluster?ref=main"
}

inputs = {
  kubernetes_version = "1.33.0"
  pod_network_cidr   = "10.244.0.0/16"
  node_name          = "dev-wsl-node"
  kubeconfig_path    = "~/.kube/config"
}
    