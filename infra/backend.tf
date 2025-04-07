terraform {
  backend "azurerm" {
    resource_group_name  = "terraform-state-rg"
    storage_account_name = "terraformstateprod"
    container_name       = "tfstate"
    key                  = "banking-app.terraform.tfstate"
  }
}

# pre -create this storage manually
#az storage account create -n terraformstateprod -g terraform-state-rg -l eastus --sku Standard_LRS
#az storage container create -n tfstate --account-name terraformstateprod
