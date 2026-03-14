module "actions_runner_controller" {
  source = "git::https://github.com/Devops-Solutions-SC/terraform-modules//argocd?ref=main"

  github_config_url = var.github_runner_github_config_url
  github_pat        = var.github_runner_pat

  controller_namespace = "arc-systems"
  runners_namespace    = "arc-runners"
}
