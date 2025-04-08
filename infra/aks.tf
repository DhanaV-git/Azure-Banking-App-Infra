resource "azurerm_kubernetes_cluster" "aks" {
  name                = "banking-aks-cluster"
  location            = var.location
  resource_group_name = var.resource_group_name
  dns_prefix          = "bankingaks"

  default_node_pool {
    name            = "default"
    vm_size         = "Standard_DS2_v2"
    node_count      = 2
    vnet_subnet_id  = var.aks_subnet_id
  }

  identity {
    type = "SystemAssigned"
  }

  network_profile {
    network_plugin     = "azure"
    load_balancer_sku  = "standard"
    outbound_type      = "loadBalancer"
  }

  tags = {
    environment = "production"
  }
}

resource "azurerm_role_assignment" "acr_pull" {
  principal_id         = azurerm_kubernetes_cluster.aks.kubelet_identity[0].object_id
  role_definition_name = "AcrPull"
  scope                = var.acr_id
}

output "aks_name" {
  value = azurerm_kubernetes_cluster.aks.name
}

output "aks_id" {
  value = azurerm_kubernetes_cluster.aks.id
}

output "kube_config" {
  value     = azurerm_kubernetes_cluster.aks.kube_config_raw
  sensitive = true
}
