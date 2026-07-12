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
    ipv4_enabled                     = optional(bool) # Default: true
    peer_asn                         = optional(number)
    primary_peer_address_prefix      = optional(string)
    route_filter_id                  = optional(string)
    secondary_peer_address_prefix    = optional(string)
    shared_key                       = optional(string)
    shared_key_key_vault_id          = optional(string)
    shared_key_key_vault_secret_name = optional(string)
    ipv6 = optional(object({
      enabled = optional(bool) # Default: true
      microsoft_peering = optional(object({
        advertised_communities     = optional(list(string))
        advertised_public_prefixes = optional(list(string))
        customer_asn               = optional(number) # Default: 0
        routing_registry_name      = optional(string) # Default: "NONE"
      }))
      primary_peer_address_prefix   = string
      route_filter_id               = optional(string)
      secondary_peer_address_prefix = string
    }))
    microsoft_peering_config = optional(object({
      advertised_communities     = optional(list(string))
      advertised_public_prefixes = list(string)
      customer_asn               = optional(number) # Default: 0
      routing_registry_name      = optional(string) # Default: "NONE"
    }))
  }))
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
        v.microsoft_peering_config == null || (v.microsoft_peering_config.advertised_communities == null || (length(v.microsoft_peering_config.advertised_communities) > 0))
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
  # --- Unconfirmed validation candidates, derived from azurerm_express_route_circuit_peering's provider source ---
  # Not auto-enabled: either a bespoke provider validator we can't safely translate,
  # or a path that crosses a list-typed block (needs its own for_each wrapping).
  # Review, translate into a real validation{} block above, and delete once confirmed.
  # path: peering_type
  #   source:    validation.StringInSlice value list is not a literal []string - likely a generated PossibleValuesFor*() helper; resolve separately
  # path: resource_group_name
  #   condition: length(value) <= 90
  #   message:   [from resourcegroups.ValidateName: invalid when len(value) > 90]
  #   source:    [from resourcegroups.ValidateName: invalid when len(value) > 90]
  # path: resource_group_name
  #   condition: !endswith(value, ".")
  #   message:   [from resourcegroups.ValidateName: must not end with "."]
  #   source:    [from resourcegroups.ValidateName: must not end with "."]
  # path: resource_group_name
  #   condition: length(value) != 0
  #   message:   [from resourcegroups.ValidateName: invalid when len(value) == 0]
  #   source:    [from resourcegroups.ValidateName: invalid when len(value) == 0]
  # path: resource_group_name
  #   source:    [from resourcegroups.ValidateName] !matched
  # path: ipv6.microsoft_peering.advertised_public_prefixes[*]
  #   source:    validation.IsCIDR(...) - no translation rule yet, add one
  # path: ipv6.route_filter_id
  #   source:    [from routefilters.ValidateRouteFilterID] !ok
  # path: ipv6.route_filter_id
  #   source:    [from routefilters.ValidateRouteFilterID] err != nil
  # path: route_filter_id
  #   source:    [from routefilters.ValidateRouteFilterID] !ok
  # path: route_filter_id
  #   source:    [from routefilters.ValidateRouteFilterID] err != nil
}

