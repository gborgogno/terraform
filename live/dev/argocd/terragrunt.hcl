include {
  path = find_in_parent_folders()
}

terraform {
  # caminho relativo até o módulo criado em /home/devops/terraform-modules/argocd
  source = "../../../../terraform-modules/argocd"
}

inputs = {
  release_name  = "argocd"
  namespace     = "argocd"
  chart_version = ""
  repository_url = "https://argoproj.github.io/argo-helm"

  values = {
    server = {
      service = {
        type = "ClusterIP"
      }
    }
  }
}
