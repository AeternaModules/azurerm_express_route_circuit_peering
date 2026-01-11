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
    express_route_circuit_name    = string
    peering_type                  = string
    resource_group_name           = string
    vlan_id                       = number
    ipv4_enabled                  = optional(bool, true)
    peer_asn                      = optional(number)
    primary_peer_address_prefix   = optional(string)
    route_filter_id               = optional(string)
    secondary_peer_address_prefix = optional(string)
    shared_key                    = optional(string)
    ipv6 = optional(object({
      enabled = optional(bool, true)
      microsoft_peering = optional(object({
        advertised_communities     = optional(list(string))
        advertised_public_prefixes = optional(list(string))
        customer_asn               = optional(number, 0)
        routing_registry_name      = optional(string, "NONE")
      }))
      primary_peer_address_prefix   = string
      route_filter_id               = optional(string)
      secondary_peer_address_prefix = string
    }))
    microsoft_peering_config = optional(object({
      advertised_communities     = optional(list(string))
      advertised_public_prefixes = list(string)
      customer_asn               = optional(number, 0)
      routing_registry_name      = optional(string, "NONE")
    }))
  }))
}

