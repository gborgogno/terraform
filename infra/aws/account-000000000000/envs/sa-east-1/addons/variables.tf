variable "kubeconfig_path" {
  description = "Path to kubeconfig used by providers"
  type        = string
  default     = "~/.kube/config"
}

# ArgoCD Helm module inputs
variable "argocd_release_name" {
  description = "Helm release name for ArgoCD"
  type        = string
  default     = "argocd"
}

variable "argocd_namespace" {
  description = "Namespace where ArgoCD will be installed"
  type        = string
  default     = "argocd"
}

variable "argocd_chart_version" {
  description = "Chart version for ArgoCD (empty = latest)"
  type        = string
  default     = "9.4.2"
}

variable "argocd_repository_url" {
  description = "Helm repository URL for ArgoCD chart"
  type        = string
  default     = "https://argoproj.github.io/argo-helm"
}

variable "argocd_values_yaml" {
  description = "YAML string with ArgoCD chart values (passed through yamldecode)"
  type        = string
  default     = ""
}

variable "github_runner_github_config_url" {
  type = string
  description = "GitHub repo or org URL for runner set, e.g. https://github.com/ORG/REPO"
}

variable "github_runner_pat" {
  type = string
  description = "GitHub Personal Access Token for registering runners"
  sensitive = true
}
