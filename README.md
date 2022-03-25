# F5 Distributed Cloud WAAP - myshop-waap
This is an example/demo terraform plan to provision the following capabilities on F5 Distributed Cloud WAAP
###### WAAP - Web Application Firewall
###### WAAP - Bot Protections (Signature based bot)
###### WAAP - API Protections/Security
###### WAAP - L7 DDoS 

Additional capabilites such as Machine Learning configuration for API Discovery will be enabled as part of the terraform plan. (add-ons capabilites).

![image info](images/page0.png)

Use the folloing command to extract .p12 certificate to an individual certificate and private key

> openssl pkcs12 -info -in f5-apac-sp.console.ves.volterra.io.api-creds.p12 -out certificate.cert -nokeys

> openssl pkcs12 -info -in f5-apac-sp.console.ves.volterra.io.api-creds.p12 -out private_key.key -nodes -nocerts




## Prerequsite
- F5XC tenant
- Download .p12 key (please refer to official documentation)
- Git repo (either github or gitlab). This demo based on gitlab
- NGINX Ingress controller with NGINX App Protect (for 2-tier WAF)
- ArgoCD - Delcarative GitOps CD for Kubernetes (https://github.com/argoproj/argo-cd)



<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.12.9, != 0.13.0 |
| <a name="requirement_kubectl"></a> [kubectl](#requirement\_kubectl) | >= 1.7.0 |
| <a name="requirement_volterra"></a> [volterra](#requirement\_volterra) | >=0.0.6 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_kubectl"></a> [kubectl](#provider\_kubectl) | >= 1.7.0 |
| <a name="provider_volterra"></a> [volterra](#provider\_volterra) | >=0.0.6 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [kubectl_manifest.myshop-dev](https://registry.terraform.io/providers/gavinbunney/kubectl/latest/docs/resources/manifest) | resource |
| [volterra_api_definition.myshop-apidef](https://registry.terraform.io/providers/volterraedge/volterra/latest/docs/resources/api_definition) | resource |
| [volterra_app_firewall.this](https://registry.terraform.io/providers/volterraedge/volterra/latest/docs/resources/app_firewall) | resource |
| [volterra_healthcheck.this](https://registry.terraform.io/providers/volterraedge/volterra/latest/docs/resources/healthcheck) | resource |
| [volterra_http_loadbalancer.this](https://registry.terraform.io/providers/volterraedge/volterra/latest/docs/resources/http_loadbalancer) | resource |
| [volterra_origin_pool.this](https://registry.terraform.io/providers/volterraedge/volterra/latest/docs/resources/origin_pool) | resource |
| [volterra_service_policy.myshop-sp](https://registry.terraform.io/providers/volterraedge/volterra/latest/docs/resources/service_policy) | resource |
| [kubectl_path_documents.manifests](https://registry.terraform.io/providers/gavinbunney/kubectl/latest/docs/data-sources/path_documents) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_api_cert"></a> [api\_cert](#input\_api\_cert) | n/a | `string` | `"./certificate.cert"` | no |
| <a name="input_api_key"></a> [api\_key](#input\_api\_key) | n/a | `string` | `"./private_key.key"` | no |
| <a name="input_api_url"></a> [api\_url](#input\_api\_url) | n/a | `string` | `"https://<your tenant console>/api"` | no |
| <a name="input_app_domain"></a> [app\_domain](#input\_app\_domain) | FQDN for the app. | `list` | <pre>[<br>  "<your fqdn>"<br>]</pre> | no |
| <a name="input_client_certificate"></a> [client\_certificate](#input\_client\_certificate) | n/a | `string` | `"<your argocd cluster client cert>"` | no |
| <a name="input_client_key"></a> [client\_key](#input\_client\_key) | n/a | `string` | `"<your argocd cluster private key"` | no |
| <a name="input_cluster_ca_certificate"></a> [cluster\_ca\_certificate](#input\_cluster\_ca\_certificate) | n/a | `string` | `"<your argocd ca server cert"` | no |
| <a name="input_enable_hsts"></a> [enable\_hsts](#input\_enable\_hsts) | Flag to enable hsts for HTTPS loadbalancer | `bool` | `true` | no |
| <a name="input_enable_redirect"></a> [enable\_redirect](#input\_enable\_redirect) | Flag to enable http redirect to HTTPS loadbalancer | `bool` | `true` | no |
| <a name="input_host"></a> [host](#input\_host) | n/a | `string` | `"https://<argo cd cluster>"` | no |
| <a name="input_origin_server_dns_name"></a> [origin\_server\_dns\_name](#input\_origin\_server\_dns\_name) | Origin server's publicly resolvable dns name | `list` | <pre>[<br>  "<your backend>"<br>]</pre> | no |
| <a name="input_origin_server_sni"></a> [origin\_server\_sni](#input\_origin\_server\_sni) | Origin server's SNI value | `string` | `""` | no |
| <a name="input_volterra_namespace"></a> [volterra\_namespace](#input\_volterra\_namespace) | F5XC app namespace where the object will be created. This cannot be system or shared ns. | `string` | `"myshop"` | no |
| <a name="input_volterra_namespace_exists"></a> [volterra\_namespace\_exists](#input\_volterra\_namespace\_exists) | Flag to create or use existing volterra namespace | `string` | `true` | no |
| <a name="input_web_app_name"></a> [web\_app\_name](#input\_web\_app\_name) | Web App Name. Also used as a prefix in names of related resources. | `string` | `"myshop"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_f5_distributed_cloud_protected_app_url"></a> [f5\_distributed\_cloud\_protected\_app\_url](#output\_f5\_distributed\_cloud\_protected\_app\_url) | Domain VIP to access the web app |
<!-- END_TF_DOCS -->


### Example output from this terraform plan
![image info](images/page1.png)
![image info](images/page2.png)
![image info](images/page3.png)
![image info](images/page4.png)
![image info](images/page5.png)
![image info](images/page6.png)
