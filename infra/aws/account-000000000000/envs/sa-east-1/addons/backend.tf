
terraform {
  backend "s3" {
    bucket         = "terraform-states"
    key            = "account-000000000000/envs/us-east-1/addons/terraform.tfstate"
    region         = "us-east-1"
    use_lockfile = true
    encrypt      = true
    
  }
}
