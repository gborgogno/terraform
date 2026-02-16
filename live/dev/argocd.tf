module "argocd" {
    source = "../../../terraform-modules/argocd"

    # ensure cluster is created before argocd install
    depends_on = [module.cluster]

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
