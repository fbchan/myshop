variable "api_url" {
    type = string
    default = "https://f5-apac-sp.console.ves.volterra.io/api"
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
  #default     = ["ndisp.ves.foobz.com.au"]
  #default      = ["mx.ves.foobz.com.au"]
  default      = ["myshop2.ves.foobz.com.au"]
  description = "FQDN for the app."
}

variable "origin_server_dns_name" {
  #type        = string
  description = "Origin server's publicly resolvable dns name"
  #default     = ["shop.foobz.com.au"]
  #default      = ["mx.urbanic.com"]
  #default      = ["www.ndisp.com.au"]
  default      = ["shop-dev.foobz.com.au"]
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
  default  = "https://192.168.101.73:6443"
}

variable "client_certificate" {
  type     = string
  default  = "LS0tLS1CRUdJTiBDRVJUSUZJQ0FURS0tLS0tCk1JSUJrVENDQVRlZ0F3SUJBZ0lJVm1QakN2VzdvRkl3Q2dZSUtvWkl6ajBFQXdJd0l6RWhNQjhHQTFVRUF3d1kKYXpOekxXTnNhV1Z1ZEMxallVQXhOakl4TWpReU56Z3dNQjRYRFRJeE1EVXhOekE1TVRNd01Gb1hEVEl6TURNdwpNVEF6TURJek0xb3dNREVYTUJVR0ExVUVDaE1PYzNsemRHVnRPbTFoYzNSbGNuTXhGVEFUQmdOVkJBTVRESE41CmMzUmxiVHBoWkcxcGJqQlpNQk1HQnlxR1NNNDlBZ0VHQ0NxR1NNNDlBd0VIQTBJQUJBK1pDeXp3Vm5aY1BHNmYKcWVLSjRSM3ZBY2M1dzhJS1hteE9IdFRRVGpKVG4rdXNFL3VDSGNrVFBxRU1PbldRc0hZYlR3T3VhVUo3MGZlSwo5SzFPZkhDalNEQkdNQTRHQTFVZER3RUIvd1FFQXdJRm9EQVRCZ05WSFNVRUREQUtCZ2dyQmdFRkJRY0RBakFmCkJnTlZIU01FR0RBV2dCVFFTSnF4K1JXMnpsMytlRG9MZllqWG94d253akFLQmdncWhrak9QUVFEQWdOSUFEQkYKQWlBci9HdmJkbWtFRkJlSVVBMEdTd2oyZ0FGcmxXSnY5VDB0YmFnWG1WTkMzUUloQVA3aUh6Nk9sajN6YWk4VwowRnBCaElJWXdrWDJxeVdaSysyUjFaL2FoNjBiCi0tLS0tRU5EIENFUlRJRklDQVRFLS0tLS0KLS0tLS1CRUdJTiBDRVJUSUZJQ0FURS0tLS0tCk1JSUJlRENDQVIyZ0F3SUJBZ0lCQURBS0JnZ3Foa2pPUFFRREFqQWpNU0V3SHdZRFZRUUREQmhyTTNNdFkyeHAKWlc1MExXTmhRREUyTWpFeU5ESTNPREF3SGhjTk1qRXdOVEUzTURreE16QXdXaGNOTXpFd05URTFNRGt4TXpBdwpXakFqTVNFd0h3WURWUVFEREJock0zTXRZMnhwWlc1MExXTmhRREUyTWpFeU5ESTNPREF3V1RBVEJnY3Foa2pPClBRSUJCZ2dxaGtqT1BRTUJCd05DQUFReVFFZC9ReGdxR2lRL1ZWRWliOGZqQnhDNGF3QVh4T3huNFMrQ0ZqckEKZTVYUWtSNGRhZ0IwY2F4RTNqRVZKUnFCTXM1aXpkejlNSVFZWERDWjBPVmZvMEl3UURBT0JnTlZIUThCQWY4RQpCQU1DQXFRd0R3WURWUjBUQVFIL0JBVXdBd0VCL3pBZEJnTlZIUTRFRmdRVTBFaWFzZmtWdHM1ZC9uZzZDMzJJCjE2TWNKOEl3Q2dZSUtvWkl6ajBFQXdJRFNRQXdSZ0loQU5nUXVtYVhWem5ZYTA4clJxK2ljOFdCV1g0cE1xR0wKTnBJcC9SdzFPcG5qQWlFQSs1WWVTRG0zeHY3b2plU1RrSEttQzRYRFptcHl4TmdDZmV3RjdPbUVDT1k9Ci0tLS0tRU5EIENFUlRJRklDQVRFLS0tLS0K"
}

variable "client_key" {
  type     = string
  default  = "LS0tLS1CRUdJTiBFQyBQUklWQVRFIEtFWS0tLS0tCk1IY0NBUUVFSUl0T1ZUWFRQWENIR3NKcXZxM3pSSzRvT3JYd2JkR1lmcVRRUXliSnRRdk1vQW9HQ0NxR1NNNDkKQXdFSG9VUURRZ0FFRDVrTExQQldkbHc4YnArcDRvbmhIZThCeHpuRHdncGViRTRlMU5CT01sT2Y2NndUKzRJZAp5Uk0rb1F3NmRaQ3dkaHRQQTY1cFFudlI5NHIwclU1OGNBPT0KLS0tLS1FTkQgRUMgUFJJVkFURSBLRVktLS0tLQo="
}

variable "cluster_ca_certificate" {
  type     = string
  default  = "LS0tLS1CRUdJTiBDRVJUSUZJQ0FURS0tLS0tCk1JSUJkekNDQVIyZ0F3SUJBZ0lCQURBS0JnZ3Foa2pPUFFRREFqQWpNU0V3SHdZRFZRUUREQmhyTTNNdGMyVnkKZG1WeUxXTmhRREUyTWpFeU5ESTNPREF3SGhjTk1qRXdOVEUzTURreE16QXdXaGNOTXpFd05URTFNRGt4TXpBdwpXakFqTVNFd0h3WURWUVFEREJock0zTXRjMlZ5ZG1WeUxXTmhRREUyTWpFeU5ESTNPREF3V1RBVEJnY3Foa2pPClBRSUJCZ2dxaGtqT1BRTUJCd05DQUFRRnVUdkhpNmJDZVJPWS93OVRhSWVZUGtNVTl4aWdVdElDNmdtUFc0MjYKbVN2QWlhdUcyVE1teVZtaFJCaHN5WFMvdWhiSlp0eWN4KzJvejJpYVdUUy9vMEl3UURBT0JnTlZIUThCQWY4RQpCQU1DQXFRd0R3WURWUjBUQVFIL0JBVXdBd0VCL3pBZEJnTlZIUTRFRmdRVTY2eGJHLzdzRGFVaTUrRDh4ZGtJCmIxamJQUlV3Q2dZSUtvWkl6ajBFQXdJRFNBQXdSUUlnSUlYVWhGdThiOFAxYi81RmJWeWMyOEFLTnRzZFdwZmMKdG9CTDFlZ0MwQjBDSVFESzRHdUhJcUFaYnN1aU9aNVB4Y2NUQzdRNzAyVmNBTEVKUC9mbDNCaGl3QT09Ci0tLS0tRU5EIENFUlRJRklDQVRFLS0tLS0K"
}
