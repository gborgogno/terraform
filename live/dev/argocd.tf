module "argocd" {
    source = "git::https://github.com/Devops-Solutions-SC/terraform-modules//argocd?ref=main"

    release_name   = "argocd"
    namespace      = "argocd"
    chart_version  = "9.4.2" # Verifique se esta versão é do chart ou da app, a atual do chart é 7.x
    repository_url = "https://argoproj.github.io/argo-helm"

    values = yamldecode(<<YAML
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