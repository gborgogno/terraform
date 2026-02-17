## terraform.tfvars - non-sensitive values for terraform/live/dev

# ArgoCD helm
argocd_release_name = "argocd"
argocd_namespace = "argocd"
argocd_chart_version = "9.4.2"
argocd_repository_url = "https://argoproj.github.io/argo-helm"

# Minimal built-in values will be used if this is empty; you can paste YAML here.
argocd_values_yaml = <<YAML
nameOverride: argocd
fullnameOverride: ""
createClusterRoles: true
global:
  domain: argocd.devops-sc.com
  image:
    repository: quay.io/argoproj/argocd
    tag: ""
    imagePullPolicy: IfNotPresent
server:
  ingress:
    enabled: true
    ingressClassName: traefik
    hostname: argocd.devops-sc.com
    path: /
    pathType: Prefix
    tls: true
YAML

# Root application / project
app_namespace = "argocd"
project_name = "root-project"
project_desc = "Root project for managed applications"
repo_url = "git@github.com:Devops-Solutions-SC/argocd.git"
application_name = "root-application"
application_path = "applications"
target_revision = "main"
dest_server = "https://kubernetes.default.svc"
dest_namespace = "argocd"
automated_prune = true
automated_self_heal = true

# Repo creds (leave secrets empty - provide at runtime)
repo_creds_name = "argocd-repo-creds"
# Do NOT set repo_creds_password or repo_creds_ssh_private_key here; provide them at execution time
