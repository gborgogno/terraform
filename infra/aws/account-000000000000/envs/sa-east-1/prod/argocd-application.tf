module "argocd_root_application" {
  source = "git::https://github.com/gborgogno/terraform-modules//argocd-application?ref=main"

  namespace        = var.app_namespace
  project_name     = var.project_name
  project_desc     = var.project_desc
  repo_url         = var.repo_url
  application_name = var.application_name
  path             = var.application_path
  target_revision  = var.target_revision
  dest_server      = var.dest_server
  dest_namespace   = var.dest_namespace

  automated_prune     = var.automated_prune
  automated_self_heal = var.automated_self_heal


}
