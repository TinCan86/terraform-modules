terraform {
  required_providers {
    helm = {
      source  = "hashicorp/helm"
      version = "1.3.2"
    }
  }
}

provider "helm" {
  kubernetes {
    load_config_file = "false"
  }
}

module "ingress_nginx" {
  source = "../../../modules/kubernetes/ingress-nginx"

  providers = {
    helm = helm
  }
}
