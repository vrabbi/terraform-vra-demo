provider "kubernetes-alpha" {
  config_path = "~/.kube/config"
  server_side_planning = true
}
provider "kubectl" {
  config_path = "~/.kube/config"
}
provider "kubernetes" {
  config_path = "~/.kube/config"
}
terraform {
  required_version = ">= 0.13"
  required_providers {
    kubectl = {
      source  = "gavinbunney/kubectl"
      version = ">= 1.6.2"
    }
    kubernetes = {
      source = "hashicorp/kubernetes"
      version = "~> 1.13.1"
    }
    kubernetes-alpha = {
      source = "hashicorp/kubernetes-alpha"
      version = "~> 0.2.0"
    }
  }
}
