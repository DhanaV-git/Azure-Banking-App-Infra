resource "azurerm_eventhub_namespace" "main" {
  name                = "bankingapp-eventhub-ns"
  location            = var.location
  resource_group_name = var.resource_group_name
  sku                 = "Standard"
  capacity            = 1
  auto_inflate_enabled = true
  maximum_throughput_units = 4
}

resource "azurerm_eventhub" "logs" {
  name                = "bankingapp-logs"
  namespace_name      = azurerm_eventhub_namespace.main.name
  resource_group_name = var.resource_group_name
  partition_count     = 2
  message_retention   = 7
}

resource "azurerm_eventhub_authorization_rule" "send_rule" {
  name                = "send-logs-rule"
  namespace_name      = azurerm_eventhub_namespace.main.name
  eventhub_name       = azurerm_eventhub.logs.name
  resource_group_name = var.resource_group_name
  send                = true
}

output "eventhub_namespace" {
  value = azurerm_eventhub_namespace.main.name
}

output "eventhub_name" {
  value = azurerm_eventhub.logs.name
}

output "eventhub_send_key" {
  value     = azurerm_eventhub_authorization_rule.send_rule.primary_key
  sensitive = true
}
