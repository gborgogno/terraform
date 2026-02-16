variable "kubeconfig_path" {
  description = "Path to kubeconfig used by providers"
  type        = string
  default     = "~/.kube/config"
}
