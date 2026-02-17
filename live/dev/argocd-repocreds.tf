module "repo_creds_example" {
  source = "git::https://github.com/Devops-Solutions-SC/terraform-modules//argocd-repocreds?ref=main"

  name       = "example-repo-creds"
  namespace  = "argocd"
  repo_url   = "https://github.com/Devops-Solutions-SC/argocd.git"
  # Provide either username/password for HTTPS or ssh_private_key for SSH access
  username   = ""
  password   = ""
  ssh_private_key = ""
}
    