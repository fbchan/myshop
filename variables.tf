variable "api_url" {
    type = string
    default = "https://<your tenant console>/api"
}

variable "api_cert" {
    type = string
    default = "./certificate.cert"
}

variable "api_key" {
  type = string
  default = "./private_key.key"
}

variable "web_app_name" {
  type        = string
  default     = "myshop"
  description = "Web App Name. Also used as a prefix in names of related resources."
}

variable "volterra_namespace_exists" {
  type        = string
  description = "Flag to create or use existing volterra namespace"
  default     = true
}

variable "volterra_namespace" {
  type        = string
  default     = "myshop"
  description = "F5XC app namespace where the object will be created. This cannot be system or shared ns."
}

variable "app_domain" {
  #type        = string
  default      = ["<your fqdn>"]
  description = "FQDN for the app."
}

variable "origin_server_dns_name" {
  #type        = string
  description = "Origin server's publicly resolvable dns name"
  default      = ["<your backend>"]
}

variable "origin_server_sni" {
  type        = string
  description = "Origin server's SNI value"
  default     = ""
}

variable "enable_hsts" {
  type        = bool
  description = "Flag to enable hsts for HTTPS loadbalancer"
  default     = true
}

variable "enable_redirect" {
  type        = bool
  description = "Flag to enable http redirect to HTTPS loadbalancer"
  default     = true
}

variable "host" {
  type     = string
  default  = "https://<argo cd cluster>"
}

variable "client_certificate" {
  type     = string
  default  = "<your argocd cluster client cert>"
}

variable "client_key" {
  type     = string
  default  = "<your argocd cluster private key"
}

variable "cluster_ca_certificate" {
  type     = string
  default  = "<your argocd ca server cert"
}
