module "argocd" {
    source = "git::https://github.com/gborgogno/terraform-modules//argocd?ref=main"

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
  domain: argocd.devopslabsolutions.com
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
  insecure: true
  ingress:
    enabled: true
    ingressClassName: traefik
    annotations:
      traefik.ingress.kubernetes.io/router.entrypoints: web

    hostname: argocd.devopslabsolutions.com
    path: /
    pathType: Prefix
    tls: true
  YAML
    )
}