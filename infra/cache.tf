resource "azurerm_redis_cache" "redis" {
  name                = "bankingapp-redis"
  location            = var.location
  resource_group_name = var.resource_group_name
  capacity            = 1                        # 250MB (C1), adjust as needed
  family              = "C"
  sku_name            = "Basic"                  # Or "Standard" for production
  enable_non_ssl_port = false

  minimum_tls_version = "1.2"

  redis_configuration {
    maxmemory_policy = "allkeys-lru"
  }

  subnet_id = var.cache_subnet_id
  static_ip = cidrhost("10.0.3.0/24", 5)
  zones     = ["1"]
}

output "redis_hostname" {
  value = azurerm_redis_cache.redis.hostname
}

output "redis_ssl_port" {
  value = azurerm_redis_cache.redis.ssl_port
}
