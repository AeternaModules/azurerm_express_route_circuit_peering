variable "express_route_circuit_peerings" {
  description = <<EOT
Map of express_route_circuit_peerings, attributes below
Required:
    - express_route_circuit_name
    - peering_type
    - resource_group_name
    - vlan_id
Optional:
    - ipv4_enabled
    - peer_asn
    - primary_peer_address_prefix
    - route_filter_id
    - secondary_peer_address_prefix
    - shared_key
    - shared_key_key_vault_id (alternative to shared_key - read from Key Vault instead)
    - shared_key_key_vault_secret_name (alternative to shared_key - read from Key Vault instead)
    - ipv6 (block):
        - enabled (optional)
        - microsoft_peering (optional, block):
            - advertised_communities (optional)
            - advertised_public_prefixes (optional)
            - customer_asn (optional)
            - routing_registry_name (optional)
        - primary_peer_address_prefix (required)
        - route_filter_id (optional)
        - secondary_peer_address_prefix (required)
    - microsoft_peering_config (block):
        - advertised_communities (optional)
        - advertised_public_prefixes (required)
        - customer_asn (optional)
        - routing_registry_name (optional)
EOT

  type = map(object({
    express_route_circuit_name       = string
    peering_type                     = string
    resource_group_name              = string
    vlan_id                          = number
    ipv4_enabled                     = optional(bool)
    peer_asn                         = optional(number)
    primary_peer_address_prefix      = optional(string)
    route_filter_id                  = optional(string)
    secondary_peer_address_prefix    = optional(string)
    shared_key                       = optional(string)
    shared_key_key_vault_id          = optional(string)
    shared_key_key_vault_secret_name = optional(string)
    ipv6 = optional(object({
      enabled = optional(bool)
      microsoft_peering = optional(object({
        advertised_communities     = optional(list(string))
        advertised_public_prefixes = optional(list(string))
        customer_asn               = optional(number)
        routing_registry_name      = optional(string)
      }))
      primary_peer_address_prefix   = string
      route_filter_id               = optional(string)
      secondary_peer_address_prefix = string
    }))
    microsoft_peering_config = optional(object({
      advertised_communities     = optional(list(string))
      advertised_public_prefixes = list(string)
      customer_asn               = optional(number)
      routing_registry_name      = optional(string)
    }))
  }))
  validation {
    condition = alltrue([
      for k, v in var.express_route_circuit_peerings : (
        length(v.resource_group_name) <= 90
      )
    ])
    error_message = "[from resourcegroups.ValidateName: invalid when len(value) > 90]"
  }
  validation {
    condition = alltrue([
      for k, v in var.express_route_circuit_peerings : (
        !endswith(v.resource_group_name, ".")
      )
    ])
    error_message = "[from resourcegroups.ValidateName: must not end with \".\"]"
  }
  validation {
    condition = alltrue([
      for k, v in var.express_route_circuit_peerings : (
        length(v.resource_group_name) != 0
      )
    ])
    error_message = "[from resourcegroups.ValidateName: invalid when len(value) == 0]"
  }
  validation {
    condition = alltrue([
      for k, v in var.express_route_circuit_peerings : (
        v.shared_key == null || (length(v.shared_key) >= 1 && length(v.shared_key) <= 25)
      )
    ])
    error_message = "must be between 1 and 25 characters"
  }
  validation {
    condition = alltrue([
      for k, v in var.express_route_circuit_peerings : (
        v.microsoft_peering_config == null || (v.microsoft_peering_config.advertised_communities == null || (alltrue([for x in v.microsoft_peering_config.advertised_communities : length(x) > 0])))
      )
    ])
    error_message = "must not be empty"
  }
  validation {
    condition = alltrue([
      for k, v in var.express_route_circuit_peerings : (
        v.ipv6 == null || (v.ipv6.microsoft_peering == null || (v.ipv6.microsoft_peering.routing_registry_name == null || (length(v.ipv6.microsoft_peering.routing_registry_name) > 0)))
      )
    ])
    error_message = "must not be empty"
  }
  # Note: 7 additional provider-side validators are enforced at apply time but not mirrored as validation{} blocks here (bespoke or non-mechanically-translatable).
}

