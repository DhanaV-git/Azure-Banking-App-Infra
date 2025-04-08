resource "azurerm_redis_cache" "redis" {
  name                = "bankingapp-redis"
  location            = var.location
  resource_group_name = var.resource_group_name
  capacity            = 1
  family              = "C"
  sku_name            = "Standard"

  minimum_tls_version = "1.2"

  redis_configuration {
    maxmemory_policy = "allkeys-lru"
  }

  subnet_id = var.cache_subnet_id
}

output "redis_hostname" {
  value = azurerm_redis_cache.redis.hostname
}

output "redis_ssl_port" {
  value = azurerm_redis_cache.redis.ssl_port
}
