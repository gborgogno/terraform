variable "cloud" {
  type    = string
  default = "aws"
}

variable "cluster_name" {
  type    = string
  default = "dev-cluster"
}

variable "aws" {
  type    = map(any)
  default = {
    region     = "us-east-1"
    eks_version = "1.27"
    node_type  = "t3.medium"
    node_count = 2
  }
}

variable "azure" { type = map(any) default = {} }
variable "gcp" { type = map(any) default = {} }
variable "onprem" { type = map(any) default = {} }
