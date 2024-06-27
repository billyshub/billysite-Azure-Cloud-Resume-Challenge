import {
  id = "/subscriptions/8d378fac-1ee9-41d0-8d40-5d8222096579/resourceGroups/BackEnd"
  to = azurerm_resource_group.res-0
}
import {
  id = "/subscriptions/8d378fac-1ee9-41d0-8d40-5d8222096579/resourceGroups/BackEnd/providers/Microsoft.DocumentDB/databaseAccounts/billysitecosmosdbtable"
  to = azurerm_cosmosdb_account.res-1
}
import {
  id = "/subscriptions/8d378fac-1ee9-41d0-8d40-5d8222096579/resourceGroups/BackEnd/providers/Microsoft.DocumentDB/databaseAccounts/billysitecosmosdbtable/tables/VisitorCounter"
  to = azurerm_cosmosdb_table.res-2
}
import {
  id = "/subscriptions/8d378fac-1ee9-41d0-8d40-5d8222096579/resourceGroups/BackEnd/providers/Microsoft.Storage/storageAccounts/backendae0d"
  to = azurerm_storage_account.res-3
}
import {
  id = "https://backendae0d.blob.core.windows.net/azure-webjobs-hosts"
  to = azurerm_storage_container.res-5
}
import {
  id = "https://backendae0d.blob.core.windows.net/azure-webjobs-secrets"
  to = azurerm_storage_container.res-6
}
import {
  id = "https://backendae0d.blob.core.windows.net/scm-releases"
  to = azurerm_storage_container.res-7
}
import {
  id = "https://backendae0d.file.core.windows.net/billysitefunctapp925f"
  to = azurerm_storage_share.res-9
}
import {
  id = "https://backendae0d.file.core.windows.net/billysitefunctappa4c6"
  to = azurerm_storage_share.res-10
}
import {
  id = "/subscriptions/8d378fac-1ee9-41d0-8d40-5d8222096579/resourceGroups/BackEnd/providers/Microsoft.Web/serverfarms/ASP-BackEnd-80ad"
  to = azurerm_service_plan.res-13
}
import {
  id = "/subscriptions/8d378fac-1ee9-41d0-8d40-5d8222096579/resourceGroups/BackEnd/providers/Microsoft.Web/sites/billysitefunctapp"
  to = azurerm_linux_function_app.res-14
}
import {
  id = "/subscriptions/8d378fac-1ee9-41d0-8d40-5d8222096579/resourceGroups/BackEnd/providers/Microsoft.Web/sites/billysitefunctapp/functions/API"
  to = azurerm_function_app_function.res-18
}
import {
  id = "/subscriptions/8d378fac-1ee9-41d0-8d40-5d8222096579/resourceGroups/BackEnd/providers/Microsoft.Web/sites/billysitefunctapp/hostNameBindings/billysitefunctapp.azurewebsites.net"
  to = azurerm_app_service_custom_hostname_binding.res-19
}
