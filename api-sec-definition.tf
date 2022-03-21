resource "volterra_api_definition" "myshop-apidef" {
  name      = format("%s-apidef", var.web_app_name)
  namespace = var.volterra_namespace

  swagger_specs = ["https://f5-apac-sp.console.ves.volterra.io/api/object_store/namespaces/myshop/stored_objects/swagger/myshop-crud-oas2/v1-22-03-18"]
}