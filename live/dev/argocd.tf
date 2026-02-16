module "argocd" {
    source = "git::ssh://git@github.com/Devops-Solutions-SC-LTDA/terraform-modules//argocd?ref=main"


    release_name  = "argocd"
    namespace     = "argocd"
    chart_version = "9.4.2"
    repository_url = "https://argoproj.github.io/argo-helm"

    values = {
        server = {
            service = {
                type = "ClusterIP"
            }
            ingress = {
                enabled = true
                hosts = [
                    {
                        host = "argocd.devops-sc.com"
                        paths = [
                            {
                                path = "/"
                                pathType = "Prefix"
                            }
                        ]
                    }
                ]
                ingressClassName = "nginx"
                tls = [
                    {
                        secretName = "argocd-tls"
                        hosts = ["argocd.devops-sc.com"]
                    }
                ]
            }
        }
    }
}
