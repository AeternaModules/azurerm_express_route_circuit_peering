output "express_route_circuit_peerings" {
  description = "All express_route_circuit_peering resources"
  value       = azurerm_express_route_circuit_peering.express_route_circuit_peerings
  sensitive   = true
}
output "express_route_circuit_peerings_azure_asn" {
  description = "List of azure_asn values across all express_route_circuit_peerings"
  value       = [for k, v in azurerm_express_route_circuit_peering.express_route_circuit_peerings : v.azure_asn]
}
output "express_route_circuit_peerings_express_route_circuit_name" {
  description = "List of express_route_circuit_name values across all express_route_circuit_peerings"
  value       = [for k, v in azurerm_express_route_circuit_peering.express_route_circuit_peerings : v.express_route_circuit_name]
}
output "express_route_circuit_peerings_gateway_manager_etag" {
  description = "List of gateway_manager_etag values across all express_route_circuit_peerings"
  value       = [for k, v in azurerm_express_route_circuit_peering.express_route_circuit_peerings : v.gateway_manager_etag]
}
output "express_route_circuit_peerings_ipv4_enabled" {
  description = "List of ipv4_enabled values across all express_route_circuit_peerings"
  value       = [for k, v in azurerm_express_route_circuit_peering.express_route_circuit_peerings : v.ipv4_enabled]
}
output "express_route_circuit_peerings_ipv6" {
  description = "List of ipv6 values across all express_route_circuit_peerings"
  value       = [for k, v in azurerm_express_route_circuit_peering.express_route_circuit_peerings : v.ipv6]
}
output "express_route_circuit_peerings_microsoft_peering_config" {
  description = "List of microsoft_peering_config values across all express_route_circuit_peerings"
  value       = [for k, v in azurerm_express_route_circuit_peering.express_route_circuit_peerings : v.microsoft_peering_config]
}
output "express_route_circuit_peerings_peer_asn" {
  description = "List of peer_asn values across all express_route_circuit_peerings"
  value       = [for k, v in azurerm_express_route_circuit_peering.express_route_circuit_peerings : v.peer_asn]
}
output "express_route_circuit_peerings_peering_type" {
  description = "List of peering_type values across all express_route_circuit_peerings"
  value       = [for k, v in azurerm_express_route_circuit_peering.express_route_circuit_peerings : v.peering_type]
}
output "express_route_circuit_peerings_primary_azure_port" {
  description = "List of primary_azure_port values across all express_route_circuit_peerings"
  value       = [for k, v in azurerm_express_route_circuit_peering.express_route_circuit_peerings : v.primary_azure_port]
}
output "express_route_circuit_peerings_primary_peer_address_prefix" {
  description = "List of primary_peer_address_prefix values across all express_route_circuit_peerings"
  value       = [for k, v in azurerm_express_route_circuit_peering.express_route_circuit_peerings : v.primary_peer_address_prefix]
}
output "express_route_circuit_peerings_resource_group_name" {
  description = "List of resource_group_name values across all express_route_circuit_peerings"
  value       = [for k, v in azurerm_express_route_circuit_peering.express_route_circuit_peerings : v.resource_group_name]
}
output "express_route_circuit_peerings_route_filter_id" {
  description = "List of route_filter_id values across all express_route_circuit_peerings"
  value       = [for k, v in azurerm_express_route_circuit_peering.express_route_circuit_peerings : v.route_filter_id]
}
output "express_route_circuit_peerings_secondary_azure_port" {
  description = "List of secondary_azure_port values across all express_route_circuit_peerings"
  value       = [for k, v in azurerm_express_route_circuit_peering.express_route_circuit_peerings : v.secondary_azure_port]
}
output "express_route_circuit_peerings_secondary_peer_address_prefix" {
  description = "List of secondary_peer_address_prefix values across all express_route_circuit_peerings"
  value       = [for k, v in azurerm_express_route_circuit_peering.express_route_circuit_peerings : v.secondary_peer_address_prefix]
}
output "express_route_circuit_peerings_shared_key" {
  description = "List of shared_key values across all express_route_circuit_peerings"
  value       = [for k, v in azurerm_express_route_circuit_peering.express_route_circuit_peerings : v.shared_key]
  sensitive   = true
}
output "express_route_circuit_peerings_vlan_id" {
  description = "List of vlan_id values across all express_route_circuit_peerings"
  value       = [for k, v in azurerm_express_route_circuit_peering.express_route_circuit_peerings : v.vlan_id]
}

