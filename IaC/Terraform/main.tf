resource "azurerm_resource_group" "res-0" {
  location = "australiaeast"
  name     = "BackEnd"
}
resource "azurerm_cosmosdb_account" "res-1" {
  location            = "australiaeast"
  name                = "billysitecosmosdbtable"
  offer_type          = "Standard"
  resource_group_name = "BackEnd"
  tags = {
    defaultExperience       = "Azure Table"
    hidden-cosmos-mmspecial = ""
  }
  consistency_policy {
    consistency_level = "BoundedStaleness"
  }
  geo_location {
    failover_priority = 0
    location          = "australiaeast"
  }
}
resource "azurerm_cosmosdb_table" "res-2" {
  account_name        = "billysitecosmosdbtable"
  name                = "VisitorCounter"
  resource_group_name = "BackEnd"
  depends_on = [
    azurerm_cosmosdb_account.res-1,
  ]
}
resource "azurerm_storage_account" "res-3" {
  account_kind                     = "Storage"
  account_replication_type         = "LRS"
  account_tier                     = "Standard"
  allow_nested_items_to_be_public  = false
  cross_tenant_replication_enabled = false
  default_to_oauth_authentication  = true
  location                         = "australiaeast"
  name                             = "backendae0d"
  resource_group_name              = "BackEnd"
}
resource "azurerm_storage_container" "res-5" {
  name                 = "azure-webjobs-hosts"
  storage_account_name = "backendae0d"
}
resource "azurerm_storage_container" "res-6" {
  name                 = "azure-webjobs-secrets"
  storage_account_name = "backendae0d"
}
resource "azurerm_storage_container" "res-7" {
  name                 = "scm-releases"
  storage_account_name = "backendae0d"
}
resource "azurerm_storage_share" "res-9" {
  name                 = "billysitefunctapp925f"
  quota                = 5120
  storage_account_name = "backendae0d"
}
resource "azurerm_storage_share" "res-10" {
  name                 = "billysitefunctappa4c6"
  quota                = 5120
  storage_account_name = "backendae0d"
}
resource "azurerm_service_plan" "res-13" {
  location            = "australiaeast"
  name                = "ASP-BackEnd-80ad"
  os_type             = "Linux"
  resource_group_name = "BackEnd"
  sku_name            = "Y1"
}
resource "azurerm_linux_function_app" "res-14" {
  app_settings = {
    ConnectionString                  = "DefaultEndpointsProtocol=https;AccountName=billysitecosmosdbtable;AccountKey=XXXXXXXXXX==;TableEndpoint=https://billysitecosmosdbtable.table.cosmos.azure.com:443/;"
    billysitecosmosdbtable_DOCUMENTDB = "AccountEndpoint=https://billysitecosmosdbtable.documents.azure.com:443/;AccountKey=XXXXXXXXXX=="
  }
  builtin_logging_enabled    = false
  client_certificate_mode    = "Required"
  https_only                 = true
  location                   = "australiaeast"
  name                       = "billysitefunctapp"
  resource_group_name        = "BackEnd"
  service_plan_id            = "/subscriptions/8d378fac-1ee9-41d0-8d40-5d8222096579/resourceGroups/BackEnd/providers/Microsoft.Web/serverfarms/ASP-BackEnd-80ad"
  storage_account_access_key = "XXXXXXXXXX=="
  storage_account_name       = "backendae0d"
  site_config {
    ftps_state = "FtpsOnly"
    application_stack {
      python_version = "3.11"
    }
    cors {
      allowed_origins = ["https://portal.azure.com", "https://www.billysite.com"]
    }
  }
  depends_on = [
    azurerm_service_plan.res-13,
  ]
}
resource "azurerm_function_app_function" "res-18" {
  config_json = jsonencode({
    bindings = [{
      authLevel = "function"
      direction = "in"
      methods   = ["get", "post"]
      name      = "req"
      type      = "httpTrigger"
      }, {
      direction = "out"
      name      = "$return"
      type      = "http"
      }, {
      connection   = "ConnectionString"
      direction    = "in"
      name         = "inputTable"
      partitionKey = "billysite"
      tableName    = "VisitorCounter"
      take         = "50"
      type         = "table"
      }, {
      connection   = "ConnectionString"
      direction    = "out"
      name         = "outputTable"
      partitionKey = "billysite"
      tableName    = "VisitorCounter"
      type         = "table"
    }]
    scriptFile = "__init__.py"
  })
  function_app_id = "/subscriptions/8d378fac-1ee9-41d0-8d40-5d8222096579/resourceGroups/BackEnd/providers/Microsoft.Web/sites/billysitefunctapp"
  name            = "API"
  depends_on = [
    azurerm_linux_function_app.res-14,
  ]
}
resource "azurerm_app_service_custom_hostname_binding" "res-19" {
  app_service_name    = "billysitefunctapp"
  hostname            = "billysitefunctapp.azurewebsites.net"
  resource_group_name = "BackEnd"
  depends_on = [
    azurerm_linux_function_app.res-14,
  ]
}
