variable "tfstate_resource_group" {
    type = string
    description = "Resource group for tfstate persistence"
}
variable "tfstate_storage_account" {
    type = string
    description = "Name of storage account for tfstate persistence"
}
variable "tfstate_container" {
    type = string
    description = "Name of container in storage account for tfstate persistence"
}
variable "tfstate_key" {
    type = string
    description = "Key to access storage account for tfstate persistence"
}
variable "name" {
    type = string
    description = "Name of the deployment on K8s"
    default = "gitlab"
}
variable "namespace" {
    type = string
    description = "K8s namespace for the installation (will be created)"
    default = "gitlab"
}
variable "external_ip" {
    type = string
    description = "External IP of AKS Cluster"
}
variable "domain" {
    type = string
    description = "Domainname for GitLab (without subdomains e.g. gitlab.mydomain.test - use only mydomain.test)"
}
variable "certmanager-issuer_email" {
    type = string
    description = "Email address for TLS cert issuing"
}
variable "postgresql_image_tag" {
    type = string
    description = "Tag of postgresql image to use"
    default = "13.6.0"
}