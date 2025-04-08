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

variable "aks_subnet_id" {
  description = "Subnet ID for the AKS default node pool"
  type        = string
}

variable "acr_id" {
  description = "ID of the Azure Container Registry"
  type        = string
}

variable "cache_subnet_id" {
  description = "The subnet ID for Azure Cache for Redis"
  type        = string
}

variable "db_subnet_id" {
  description = "Subnet ID for PostgreSQL flexible server"
  type        = string
}
