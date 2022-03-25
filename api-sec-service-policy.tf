# Service Policy for API Protection
resource "volterra_service_policy" "myshop-sp" {
  name      = format("%s-api-sec-sp", var.web_app_name)
  namespace = var.volterra_namespace
  algo      = "FIRST_MATCH"
  any_server = true

  rule_list {
    rules {
        metadata {
           name        = "api-def-delete-operation-deny" 
           description = "Deny all DELETE operation"
           disable     = false  
        }
        spec {
            action     = "DENY"
            any_client = true
            api_group_matcher {
                match  = ["ves-io-api-def-myshop-apidef-delete"]
            }
            challenge_action = "DEFAULT_CHALLENGE"
            waf_action {
                none  = true
            }
        }
    }
    rules {
        metadata {
           name        = "api-def-all-operation-whitelist-allow" 
           description = "Allow all API Definition for All Operation"
           disable     = false  
        }
        spec {
            action     = "ALLOW"
            any_client = true
            api_group_matcher {
                match  = ["ves-io-api-def-myshop-apidef-all-operations"]
            }
            challenge_action = "DEFAULT_CHALLENGE"
            waf_action {
                none  = true
            }
        }
    }
    rules {
        metadata {
           name        = "api-def-base-urls-deny" 
           description = "Deny everything other than API def above from base URL"
           disable     = false  
        }
        spec {
            action     = "DENY"
            any_client = true
            api_group_matcher {
                match  = ["ves-io-api-def-myshop-apidef-base-urls"]
            }
            challenge_action = "DEFAULT_CHALLENGE"
            waf_action {
                none  = true
            }
        }
    }
    rules {
        metadata {
           name        = "allow-other-non-api-traffic" 
           description = "Allow others non-API traffic - for web mix with api only"
           disable     = false  
        }
        spec {
            action     = "ALLOW"
            any_client = true
            challenge_action = "DEFAULT_CHALLENGE"
            waf_action {
                none  = true
            }
        }
    }
  }

}
