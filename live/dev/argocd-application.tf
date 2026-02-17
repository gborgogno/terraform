module "argocd_root_application" {
  source = "git::https://github.com/Devops-Solutions-SC/terraform-modules//argocd-application?ref=main"

  # Adjust these values for your environment
  namespace        = "argocd"
  project_name     = "root-project"
  project_desc     = "Root project for managed applications"
  repo_url         = "https://github.com/Devops-Solutions-SC/argocd.git"
  application_name = "root-application"
  path             = "/applications"
  target_revision  = "main"
  dest_server      = "https://kubernetes.default.svc"
  dest_namespace   = "argocd"


  automated_prune = true
  automated_self_heal = true
}
