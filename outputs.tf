output "f5_distributed_cloud_protected_app_url" {
  description = "Domain VIP to access the web app"
  value       = format("https://%s", var.app_domain[0])
}
