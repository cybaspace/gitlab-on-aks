terraform {
  required_providers {
    azurerm = { 
      source = "hashicorp/azurerm"
      version = "=2.46.0"
    }
  }
  backend "azurerm" { 
    resource_group_name = "tfstate"
    storage_account_name = "tfstate4cicd"
    container_name = "tfstate"
    key = "terraform.tfstate"
  }
}

resource "helm_release" "gitlab" {
  name       = var.name
  repository = "https://charts.gitlab.io/"
  chart      = "gitlab"
  namespace  = var.namespace
  create_namespace = true
  timeout    = 600
  replace    = true

  set {
    name  = "global.hosts.domain"
    value = var.domain
  }

  set {
    name  = "global.hosts.externalIP"
    value = var.external_ip
  }

  set {
    name  = "certmanager-issuer.email"
    value = var.certmanager-issuer_email
  }

  set {
    name  = "postgresql.image.tag"
    value = var.postgresql_image_tag
  }
}