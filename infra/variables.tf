variable "resource_group_name" {
  description = "The name of the resource group"
  type        = string
  default     = "banking-app-rg"
}

variable "location" {
  description = "Azure region"
  type        = string
  default     = "East US"
}
