resource "azurerm_postgresql_flexible_server" "db" {
  name                   = "banking-postgres"
  resource_group_name    = var.resource_group_name
  location               = var.location
  administrator_login    = "pgadmin"
  administrator_password = "SecureP@ssword123!"  # 🔐 use Key Vault in production
  sku_name               = "Standard_D2ds_v4"
  version                = "13"
  storage_mb             = 32768
  backup_retention_days  = 7
  geo_redundant_backup_enabled = false
  zone                   = "1"

  delegated_subnet_id = var.db_subnet_id
  private_dns_zone_id = azurerm_private_dns_zone.db.id

  authentication {
    active_directory_auth_enabled = false
    password_auth_enabled         = true
  }
}

resource "azurerm_postgresql_flexible_server_firewall_rule" "allow_azure" {
  name             = "AllowAzureServices"
  server_id        = azurerm_postgresql_flexible_server.db.id
  start_ip_address = "0.0.0.0"
  end_ip_address   = "0.0.0.0"
}

resource "azurerm_private_dns_zone" "db" {
  name                = "privatelink.postgres.database.azure.com"
  resource_group_name = var.resource_group_name
}

resource "azurerm_private_dns_zone_virtual_network_link" "db" {
  name                  = "db-vnet-link"
  resource_group_name   = var.resource_group_name
  private_dns_zone_name = azurerm_private_dns_zone.db.name
  virtual_network_id    = azurerm_virtual_network.main.id
  registration_enabled  = false
}

output "db_fqdn" {
  value = azurerm_postgresql_flexible_server.db.fqdn
}
