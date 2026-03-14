variable "kubeconfig_path" {
  description = "Path to kubeconfig used by providers"
  type        = string
  default     = "~/.kube/config"
}

variable "argocd_namespace" {
  description = "Namespace where ArgoCD will be installed"
  type        = string
  default     = "argocd"
}

# Root Application / AppProject inputs
variable "app_namespace" {
  description = "Namespace where AppProject and Application CRs are created"
  type        = string
  default     = "argocd"
}

variable "project_name" {
  description = "Argocd AppProject name"
  type        = string
  default     = "root-project"
}

variable "project_desc" {
  description = "AppProject description"
  type        = string
  default     = "Root project for managed applications"
}

variable "repo_url" {
  description = "Repository URL for the Application source"
  type        = string
  default     = "https://github.com/Devops-Solutions-SC/argocd.git"
}

variable "application_name" {
  description = "Argocd Application name"
  type        = string
  default     = "root-application"
}

variable "application_path" {
  description = "Path inside the repo for the Application"
  type        = string
  default     = "/applications"
}

variable "target_revision" {
  description = "Git revision for the Application"
  type        = string
  default     = "main"
}

variable "dest_server" {
  description = "Destination cluster server for Application"
  type        = string
  default     = "https://kubernetes.default.svc"
}

variable "dest_namespace" {
  description = "Destination namespace for Application resources"
  type        = string
  default     = "argocd"
}

variable "automated_prune" {
  description = "Application automated prune"
  type        = bool
  default     = true
}

variable "automated_self_heal" {
  description = "Application automated self heal"
  type        = bool
  default     = true
}

#Repo creds inputs
variable "repo_creds_name" {
  description = "Name for the repo credentials secret"
  type        = string
  default     = "argocd-repo-creds"
}

variable "repo_creds_username" {
  description = "Repo username (if using HTTPS auth)"
  type        = string
}

variable "repo_creds_password" {
  description = "Repo password (if using HTTPS auth)"
  type        = string
  sensitive   = true
}

variable "repo_creds_ssh_private_key" {
  description = "SSH private key content for repo access"
  type        = string
  sensitive   = true

}
