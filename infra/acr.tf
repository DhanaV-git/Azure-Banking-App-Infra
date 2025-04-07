resource "azurerm_container_registry" "acr" {
  name                     = "dhanamicroservicesacrLSN"
  resource_group_name      = var.resource_group_name
  location                 = var.location
  sku                      = "Basic"
  admin_enabled            = false
  anonymous_pull_enabled   = false
}

output "acr_id" {
  value = azurerm_container_registry.acr.id
}

output "login_server" {
  value = azurerm_container_registry.acr.login_server
}
