module "argocd" {
    source = "git::https://github.com/Devops-Solutions-SC/terraform-modules//argocd?ref=main"

    release_name   = var.argocd_release_name
    namespace      = var.argocd_namespace
    chart_version  = var.argocd_chart_version # Verifique se esta versão é do chart ou da app
    repository_url = var.argocd_repository_url

    values = yamldecode(var.argocd_values_yaml != "" ? var.argocd_values_yaml : <<YAML
nameOverride: argocd
fullnameOverride: ""
createClusterRoles: true

crds:
  install: true
  keep: true

global:
  domain: argocd.devops-sc.com
  image:
    repository: quay.io/argoproj/argocd
    tag: ""
    imagePullPolicy: IfNotPresent

configs:
  cm:
    create: true
    application.instanceLabelKey: argocd.argoproj.io/instance
    admin:
      enabled: true
  params:
    create: true
  rbac:
    create: true

dex:
  enabled: true
  image:
    repository: ghcr.io/dexidp/dex
    tag: v2.44.0

redis:
  enabled: true
  image:
    repository: ecr-public.aws.com/docker/library/redis
    tag: 8.2.3-alpine

server:
  ingress:
    enabled: true
    ingressClassName: traefik
    hostname: argocd.devops-sc.com
    path: /
    pathType: Prefix
    tls: true
  YAML
    )
}