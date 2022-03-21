resource "volterra_origin_pool" "this" {
  name                   = format("%s-ori-pool", var.web_app_name)
  namespace              = var.volterra_namespace
  description            = format("Origin pool pointing to origin server %s", var.origin_server_dns_name[0])
  loadbalancer_algorithm = "ROUND ROBIN"
  origin_servers {
    public_name {
      dns_name = var.origin_server_dns_name[0]
    }
  }
  port               = 443
  endpoint_selection = "LOCAL_PREFERRED"
  use_tls {
    no_mtls                  = true
    volterra_trusted_ca      = true
    skip_server_verification = true

    disable_sni            = false
    use_host_header_as_sni = true
    sni                    = ""
    tls_config {
      default_security = true
      low_security     = false
      medium_security  = false
    }
  }
  healthcheck {
    name       = "healthcheck-http"
    namespace  = var.volterra_namespace
  }
}


resource "volterra_app_firewall" "this" {
  name        = format("%s-app-fw-policy", var.web_app_name)
  namespace   = var.volterra_namespace
  description = format("App firewall for %s", var.web_app_name)
  allow_all_response_codes = true
  default_anonymization = true
  use_default_blocking_page = false
  default_bot_setting = false
  default_detection_settings = false
  use_loadbalancer_setting = true

  blocking = true

  blocking_page {
    blocking_page = "string:///PCFET0NUWVBFIGh0bWw+CjxodG1sIGNsYXNzPSIiIGxhbmc9ImVuIj4KPGhlYWQ+CjxzdHlsZT4KaW1nIHsKICBkaXNwbGF5OiBibG9jazsKICBtYXJnaW4tbGVmdDogYXV0bzsKICBtYXJnaW4tcmlnaHQ6IGF1dG87Cn0KPC9zdHlsZT4KPGJvZHk+CjxkaXYgc3R5bGU9IndpZHRoOjgwMHB4OyBtYXJnaW46MCBhdXRvOyI+CiAgPHAyIHN0eWxlPSJ0ZXh0LWFsaWduOmNlbnRlciI7PiA8aW1nIHNyYz0iaHR0cHM6Ly9nb29kLnZvbHQuZm9vYnouY29tLmF1L2Y1LnBuZyIgYWx0PSJmNSIgd2lkdGg9IjEwMCIgaGVpZ2h0PSIxMDAiIGNsYXNzPSJjZW50ZXIiPiA8L3AyPgogIDxoMSBzdHlsZT0idGV4dC1hbGlnbjpjZW50ZXI7IGNvbG9yOmJsdWU7Zm9udC1zaXplOjMwcHg7Zm9udC1mYW1pbHk6YXJpYWw7Ij4KICAgIFRoYW5rIHlvdSBmb3IgeW91ciBwYXRpZW5jZSBhbmQgdW5kZXJzdGFuZGluZy4KICA8L2gxPgogIDxwIHN0eWxlPSJ0ZXh0LWFsaWduOmNlbnRlcjsgY29sb3I6YmxhY2s7Zm9udC1zaXplOjIwcHg7Zm9udC1mYW1pbHk6YXJpYWw7Ij4KICAgIFVuZm9ydHVuYXRlbHksIHdlIGFyZSB1bmFibGUgdG8gc2VydmUgeW91IHJpZ2h0IG5vdy4gUGxlYXNlIGNvbWVzIGJhY2sgbGF0ZXIuIFlvdXIgc3VwcG9ydCBJRCBpcyAie3tyZXF1ZXN0X2lkfX0iIHdoZW4geW91IGNvbnRhY3QgdXMuIDxhIGhyZWY9ImphdmFzY3JpcHQ6aGlzdG9yeS5iYWNrKCkiPltHbyBCYWNrXTwvYT4KICA8L3A+CjxkaXY+ICAKPC9ib2R5Pgo8L2h0bWw+"
  }
  detection_settings {
    signature_selection_setting {
      default_attack_type_settings = true
      high_medium_accuracy_signatures = true
    }
    enable_threat_campaigns = true
    default_violation_settings = true
    enable_suppression = true
  }

  bot_protection_setting {
    malicious_bot_action = "BLOCK"
    suspicious_bot_action = "REPORT"
    good_bot_action = "REPORT"
  }

}

resource "volterra_healthcheck" "this" {
  name    = "healthcheck-http"
  namespace   = var.volterra_namespace

  http_health_check {
    use_origin_server_name = true
    path                   = "/"
    use_http2              = false
  }

  healthy_threshold   = "3"
  interval            = "15"
  timeout             = "3"
  unhealthy_threshold = "1"
}

resource "volterra_http_loadbalancer" "this" {
  depends_on                      = [volterra_origin_pool.this]
  name                            = format("%s-lb", var.web_app_name)
  namespace                       = var.volterra_namespace
  description                     = format("HTTPS loadbalancer object for %s origin server", var.web_app_name)
  domains                         = [var.app_domain[0]]
  advertise_on_public_default_vip = true
  default_route_pools {
    pool {
      name      = volterra_origin_pool.this.name
      namespace = var.volterra_namespace
    }
  }

  https_auto_cert {
    add_hsts      = var.enable_hsts
    http_redirect = var.enable_redirect
    no_mtls       = true
  }

  app_firewall {
    #name = "corp-waap-high-to-medium"
    #namespace = "shared"
    name = volterra_app_firewall.this.name
  }
  multi_lb_app = false
  user_id_client_ip = true
  #source_ip_stickiness = true

  single_lb_app {
    enable_discovery {
      enable_learn_from_redirect_traffic = true
    }
    enable_ddos_detection = true
    enable_malicious_user_detection = true
  }

  api_definitions {
    api_definitions {
      name       = format("%s-apidef", var.web_app_name)
      namespace  = var.volterra_namespace
    }  
  }

  active_service_policies {
    policies {
      name    = format("%s-api-sec-sp", var.web_app_name)
      namespace  = var.volterra_namespace
    }
  }

}
