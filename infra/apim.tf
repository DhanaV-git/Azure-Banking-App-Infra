resource "azurerm_api_management" "apim" {
  name                = "banking-apim"
  location            = var.location
  resource_group_name = var.resource_group_name

  publisher_name  = "Banking Team"
  publisher_email = "admin@bankingapp.com"
  sku_name        = "Developer_1"  # Use Basic_1 or Premium for production

  identity {
    type = "SystemAssigned"
  }

  tags = {
    environment = "production"
  }
}

resource "azurerm_api_management_api" "user_api" {
  name                = "user-api"
  resource_group_name = var.resource_group_name
  api_management_name = azurerm_api_management.apim.name
  revision            = "1"
  display_name        = "User Service API"
  path                = "api/v1/users"
  protocols           = ["https"]

  import {
    content_format = "openapi"
    content_value  = file("${path.module}/openapi/user-api.yaml")  # You’ll place this file here
  }
}

resource "azurerm_api_management_api" "account_api" {
  name                = "account-api"
  resource_group_name = var.resource_group_name
  api_management_name = azurerm_api_management.apim.name
  revision            = "1"
  display_name        = "Account Service API"
  path                = "api/v1/accounts"
  protocols           = ["https"]

  import {
    content_format = "openapi"
    content_value  = file("${path.module}/openapi/account-api.yaml")
  }
}

resource "azurerm_api_management_api" "txn_api" {
  name                = "transaction-api"
  resource_group_name = var.resource_group_name
  api_management_name = azurerm_api_management.apim.name
  revision            = "1"
  display_name        = "Transaction Service API"
  path                = "api/v1/transactions"
  protocols           = ["https"]

  import {
    content_format = "openapi"
    content_value  = file("${path.module}/openapi/transaction-api.yaml")
  }
}

output "apim_hostname" {
  value = azurerm_api_management.apim.gateway_url
}
