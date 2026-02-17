module "argocd" {
    source = "git::https://github.com/Devops-Solutions-SC/terraform-modules//argocd?ref=main"

    release_name   = "argocd"
    namespace      = "argocd"
    chart_version  = "9.4.2" # Verifique se esta versão é do chart ou da app, a atual do chart é 7.x
    repository_url = "https://argoproj.github.io/argo-helm"

    values = {
        server = {
            service = {
                type = "ClusterIP"
            }
            ingress = {
                enabled          = true
                ingressClassName = "nginx"
                # No Argo CD, hosts é uma lista de strings simples
                hosts            = ["argocd.devops-sc.com"]
                paths            = ["/"]
                pathType         = "Prefix"
                
                # Configuração de TLS
                tls = [
                    {
                        secretName = "argocd-tls"
                        hosts      = ["argocd.devops-sc.com"]
                    }
                ]
                
                # Opcional: Anotações úteis para NGINX
                annotations = {
                    "kubernetes.io/ingress.class"                    = "nginx"
                    "nginx.ingress.kubernetes.io/ssl-passthrough"    = "true"
                    "nginx.ingress.kubernetes.io/backend-protocol"   = "HTTPS"
                }
            }
        }
    }
}