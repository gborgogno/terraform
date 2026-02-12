module "k8s" {
  source       = "../../../terraform-modules/kubernetes-multicloud"
  cloud        = var.cloud
  cluster_name = var.cluster_name
  aws          = var.aws
  azure        = var.azure
  gcp          = var.gcp
  onprem       = var.onprem
}

output "module_source" {
  value = module.k8s
}
