cloud = "aws"
cluster_name = "prod-cluster"

aws = {
  region = "us-east-1"
  eks_version = "1.27"
  node_type = "m5.large"
  node_count = 4
}
