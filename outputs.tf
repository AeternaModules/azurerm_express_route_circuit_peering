output "express_route_circuit_peerings_id" {
  description = "Map of id values across all express_route_circuit_peerings, keyed the same as var.express_route_circuit_peerings"
  value       = { for k, v in azurerm_express_route_circuit_peering.express_route_circuit_peerings : k => v.id if v.id != null && length(v.id) > 0 }
}
output "express_route_circuit_peerings_azure_asn" {
  description = "Map of azure_asn values across all express_route_circuit_peerings, keyed the same as var.express_route_circuit_peerings"
  value       = { for k, v in azurerm_express_route_circuit_peering.express_route_circuit_peerings : k => v.azure_asn if v.azure_asn != null }
}
output "express_route_circuit_peerings_express_route_circuit_name" {
  description = "Map of express_route_circuit_name values across all express_route_circuit_peerings, keyed the same as var.express_route_circuit_peerings"
  value       = { for k, v in azurerm_express_route_circuit_peering.express_route_circuit_peerings : k => v.express_route_circuit_name if v.express_route_circuit_name != null && length(v.express_route_circuit_name) > 0 }
}
output "express_route_circuit_peerings_gateway_manager_etag" {
  description = "Map of gateway_manager_etag values across all express_route_circuit_peerings, keyed the same as var.express_route_circuit_peerings"
  value       = { for k, v in azurerm_express_route_circuit_peering.express_route_circuit_peerings : k => v.gateway_manager_etag if v.gateway_manager_etag != null && length(v.gateway_manager_etag) > 0 }
}
output "express_route_circuit_peerings_ipv4_enabled" {
  description = "Map of ipv4_enabled values across all express_route_circuit_peerings, keyed the same as var.express_route_circuit_peerings"
  value       = { for k, v in azurerm_express_route_circuit_peering.express_route_circuit_peerings : k => v.ipv4_enabled if v.ipv4_enabled != null }
}
output "express_route_circuit_peerings_ipv6" {
  description = "Map of ipv6 values across all express_route_circuit_peerings, keyed the same as var.express_route_circuit_peerings"
  value       = { for k, v in azurerm_express_route_circuit_peering.express_route_circuit_peerings : k => v.ipv6 if v.ipv6 != null && length(v.ipv6) > 0 }
}
output "express_route_circuit_peerings_microsoft_peering_config" {
  description = "Map of microsoft_peering_config values across all express_route_circuit_peerings, keyed the same as var.express_route_circuit_peerings"
  value       = { for k, v in azurerm_express_route_circuit_peering.express_route_circuit_peerings : k => v.microsoft_peering_config if v.microsoft_peering_config != null && length(v.microsoft_peering_config) > 0 }
}
output "express_route_circuit_peerings_peer_asn" {
  description = "Map of peer_asn values across all express_route_circuit_peerings, keyed the same as var.express_route_circuit_peerings"
  value       = { for k, v in azurerm_express_route_circuit_peering.express_route_circuit_peerings : k => v.peer_asn if v.peer_asn != null }
}
output "express_route_circuit_peerings_peering_type" {
  description = "Map of peering_type values across all express_route_circuit_peerings, keyed the same as var.express_route_circuit_peerings"
  value       = { for k, v in azurerm_express_route_circuit_peering.express_route_circuit_peerings : k => v.peering_type if v.peering_type != null && length(v.peering_type) > 0 }
}
output "express_route_circuit_peerings_primary_azure_port" {
  description = "Map of primary_azure_port values across all express_route_circuit_peerings, keyed the same as var.express_route_circuit_peerings"
  value       = { for k, v in azurerm_express_route_circuit_peering.express_route_circuit_peerings : k => v.primary_azure_port if v.primary_azure_port != null && length(v.primary_azure_port) > 0 }
}
output "express_route_circuit_peerings_primary_peer_address_prefix" {
  description = "Map of primary_peer_address_prefix values across all express_route_circuit_peerings, keyed the same as var.express_route_circuit_peerings"
  value       = { for k, v in azurerm_express_route_circuit_peering.express_route_circuit_peerings : k => v.primary_peer_address_prefix if v.primary_peer_address_prefix != null && length(v.primary_peer_address_prefix) > 0 }
}
output "express_route_circuit_peerings_resource_group_name" {
  description = "Map of resource_group_name values across all express_route_circuit_peerings, keyed the same as var.express_route_circuit_peerings"
  value       = { for k, v in azurerm_express_route_circuit_peering.express_route_circuit_peerings : k => v.resource_group_name if v.resource_group_name != null && length(v.resource_group_name) > 0 }
}
output "express_route_circuit_peerings_route_filter_id" {
  description = "Map of route_filter_id values across all express_route_circuit_peerings, keyed the same as var.express_route_circuit_peerings"
  value       = { for k, v in azurerm_express_route_circuit_peering.express_route_circuit_peerings : k => v.route_filter_id if v.route_filter_id != null && length(v.route_filter_id) > 0 }
}
output "express_route_circuit_peerings_secondary_azure_port" {
  description = "Map of secondary_azure_port values across all express_route_circuit_peerings, keyed the same as var.express_route_circuit_peerings"
  value       = { for k, v in azurerm_express_route_circuit_peering.express_route_circuit_peerings : k => v.secondary_azure_port if v.secondary_azure_port != null && length(v.secondary_azure_port) > 0 }
}
output "express_route_circuit_peerings_secondary_peer_address_prefix" {
  description = "Map of secondary_peer_address_prefix values across all express_route_circuit_peerings, keyed the same as var.express_route_circuit_peerings"
  value       = { for k, v in azurerm_express_route_circuit_peering.express_route_circuit_peerings : k => v.secondary_peer_address_prefix if v.secondary_peer_address_prefix != null && length(v.secondary_peer_address_prefix) > 0 }
}
output "express_route_circuit_peerings_shared_key" {
  description = "Map of shared_key values across all express_route_circuit_peerings, keyed the same as var.express_route_circuit_peerings"
  value       = { for k, v in azurerm_express_route_circuit_peering.express_route_circuit_peerings : k => v.shared_key if v.shared_key != null && length(v.shared_key) > 0 }
  sensitive   = true
}
output "express_route_circuit_peerings_vlan_id" {
  description = "Map of vlan_id values across all express_route_circuit_peerings, keyed the same as var.express_route_circuit_peerings"
  value       = { for k, v in azurerm_express_route_circuit_peering.express_route_circuit_peerings : k => v.vlan_id if v.vlan_id != null }
}

