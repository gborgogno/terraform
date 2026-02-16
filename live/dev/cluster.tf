module "cluster" {
  source = "../../../terraform-modules/kubernetes-cluster"

  cluster_name       = "dev-minikube"
  kubernetes_version = "1.33.0"
  cpus               = 2
  memory             = 2048
  driver             = "docker"
  kubeconfig_path    = "~/.kube/config"
  apiserver_names    = ["localhost"]
  apiserver_ips      = ["127.0.0.1"]
}
