resource "azurerm_log_analytics_workspace" "monitor" {
  name                = "banking-monitor-workspace"
  location            = var.location
  resource_group_name = var.resource_group_name
  sku                 = "PerGB2018"
  retention_in_days   = 30
}

resource "azurerm_monitor_diagnostic_setting" "aks_logs" {
  name                       = "aks-logs"
  target_resource_id         = module.aks.aks_id
  log_analytics_workspace_id = azurerm_log_analytics_workspace.monitor.id

  log {
    category = "kube-apiserver"
    enabled  = true

    retention_policy {
      enabled = false
    }
  }

  log {
    category = "kube-controller-manager"
    enabled  = true

    retention_policy {
      enabled = false
    }
  }

  log {
    category = "kube-scheduler"
    enabled  = true

    retention_policy {
      enabled = false
    }
  }

  metric {
    category = "AllMetrics"
    enabled  = true

    retention_policy {
      enabled = false
    }
  }
}

resource "azurerm_dashboard_grafana" "grafana" {
  name                = "banking-grafana"
  location            = var.location
  resource_group_name = var.resource_group_name
  identity {
    type = "SystemAssigned"
  }
  grafana_workspace_name = "banking-grafana-workspace"
  sku {
    name = "Standard"
  }
  api_key_enabled = true
}

resource "azurerm_monitor_workspace" "grafana_backend" {
  name                = "banking-grafana-workspace"
  location            = var.location
  resource_group_name = var.resource_group_name
}

output "grafana_url" {
  value = azurerm_dashboard_grafana.grafana.endpoint
}
