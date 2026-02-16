include {
  path = find_in_parent_folders()
}

locals {
  environment = "dev"
  region = "onprem"
}

terraform {
  source = "../../../../terraform-modules/kubernetes-cluster"
}

inputs = {
  cluster_name        = "dev-minikube"
  kubernetes_version  = "1.33.0"
  cpus                = 2
  memory              = 2048
  driver              = "docker"
  kubeconfig_path     = "~/.kube/config"
}
    