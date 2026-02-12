Project layout for environment repo that calls modules stored in `terraform-modules`.

Structure:

- `live/dev/kubernetes-multicloud` - development environment calling the module
- `live/prod/kubernetes-multicloud` - production environment calling the module

The module source in these examples uses a local relative path to `terraform-modules`:

```
module "k8s" {
  source = "../../../terraform-modules/kubernetes-multicloud"
}
```

For separate Git repositories, change `source` to a git URL that points to the modules repo, for example:

```
source = "git::ssh://git@github.com/ORG/terraform-modules.git//kubernetes-multicloud?ref=main"
```

Usage:

```
cd live/dev/kubernetes-multicloud
terraform init
terraform plan -var-file=terraform.tfvars
terraform apply -var-file=terraform.tfvars
```
