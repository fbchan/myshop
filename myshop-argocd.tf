provider "kubectl" {
  host                   = var.host
  cluster_ca_certificate = base64decode(var.cluster_ca_certificate)
  client_certificate     = base64decode(var.client_certificate)
  client_key             = base64decode(var.client_key)
  #insecure               = true
  load_config_file       = false
  apply_retry_count      = 15
}

data "kubectl_path_documents" "manifests" {
    pattern = "./argocd-manifests/*.yaml"
}

resource "kubectl_manifest" "myshop-dev" {
    for_each  = toset(data.kubectl_path_documents.manifests.documents)
    yaml_body = each.value
}