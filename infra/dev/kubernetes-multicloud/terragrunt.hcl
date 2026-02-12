terraform {
  source = "git::https://github.com/gborgogno/terraform-modules.git//kubernetes-multicloud?ref=main"
}

inputs = {
  cloud        = "aws"
  cluster_name = "dev-cluster"

  aws = {
    region      = "us-east-1"
    eks_version = "1.27"
    node_type   = "t3.medium"
    node_count  = 2
  }

  azure  = {}
  gcp    = {}
  onprem = {}
}
