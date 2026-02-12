terraform {
  source = "git::https://github.com/gborgogno/terraform-modules.git//kubernetes-multicloud?ref=main"
}

inputs = {
  cloud        = "aws"
  cluster_name = "prod-cluster"

  aws = {
    region      = "us-east-1"
    eks_version = "1.27"
    node_type   = "m5.large"
    node_count  = 4
  }

  azure  = {}
  gcp    = {}
  onprem = {}
}
