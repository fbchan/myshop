# API Definition for API Protection
resource "volterra_api_definition" "myshop-apidef" {
  name      = format("%s-apidef", var.web_app_name)
  namespace = var.volterra_namespace

  swagger_specs = ["your api link"]
}