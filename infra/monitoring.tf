resource "azurerm_log_analytics_workspace" "monitor" {
  name                = "banking-monitor-workspace"
  location            = var.location
  resource_group_name = var.resource_group_name
  sku                 = "PerGB2018"
  retention_in_days   = 30
}

resource "azurerm_monitor_data_collection_rule" "aks_dcr" {
  name                = "banking-aks-dcr"
  location            = var.location
  resource_group_name = var.resource_group_name

  data_flow {
    streams      = ["Microsoft-ContainerInsights"]
    destinations = ["loganalytics"]
  }

  destinations {
    log_analytics {
      name                  = "loganalytics"
      workspace_resource_id = azurerm_log_analytics_workspace.monitor.id
    }
  }

  data_sources {
    performance_counter {
      name = "perfCounter"
      counter_specifiers = ["\\Processor(_Total)\\% Processor Time"]
      sampling_frequency_in_seconds = 15
      streams = ["Microsoft-InsightsMetrics"]
    }
  }
}

resource "azurerm_dashboard_grafana" "grafana" {
  name                = "banking-grafana"
  resource_group_name = var.resource_group_name
  location            = var.location
  identity {
    type = "SystemAssigned"
  }

  grafana_major_version = 9  # Required

  api_key_enabled = true
  public_network_access_enabled = true
}

output "grafana_url" {
  value = azurerm_dashboard_grafana.grafana.endpoint
}
