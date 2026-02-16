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

# Dependência no módulo do cluster para pegar o caminho do kubeconfig
dependency "cluster" {
  config_path = "../cluster"
}

# Gera um provider.tf usando o kubeconfig do cluster (gerado pelo módulo de cluster)
generate "provider" {
  path      = "provider.tf"
  if_exists = "overwrite"
  contents  = <<EOF
provider "kubernetes" {
  config_path = "${dependency.cluster.outputs.kubeconfig_path}"
}

provider "helm" {
  kubernetes {
    config_path = "${dependency.cluster.outputs.kubeconfig_path}"
  }
}
EOF
}
