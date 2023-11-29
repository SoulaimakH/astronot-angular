resource "azurerm_container_app_environment" "my_first_app" {
  name                      = "cae-${local.stack}"
  location                   = azurerm_resource_group.my_first_app.location
  resource_group_name        = azurerm_resource_group.my_first_app.name
  log_analytics_workspace_id = azurerm_log_analytics_workspace.my_first_app.id

  tags = local.default_tags
}

resource "azurerm_container_app" "my_first_app" {
  name                         = "ca-${local.stack}"

  container_app_environment_id = azurerm_container_app_environment.my_first_app.id
  resource_group_name          = azurerm_resource_group.my_first_app.name
  revision_mode                = "Single"

  registry {
    server               = "docker.io"    
  }

  ingress {
    allow_insecure_connections = false
    external_enabled           = true
    target_port                = 80
    traffic_weight {
      percentage = 100
    }

  }

  template {
    container {
      name   = "${var.prefix}-ca-${var.stage}"
      image  = "hello-world:latest"
      cpu    = 0.25
      memory = "0.5Gi"
  }

  tags = local.default_tags

}
