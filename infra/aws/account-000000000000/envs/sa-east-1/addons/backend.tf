
terraform {
  backend "s3" {
    bucket         = "terraform-states"
    key            = "account-123456789521/addons/terraform.tfstate"
    region         = "sa-east-1"
    use_lockfile = true
    encrypt      = true
    
  }
}
