#
#   Create Databricks Workspace 001
#
resource "azurerm_databricks_workspace" "dbx-wks-001" {
  name                          = "dbx-wks-001"
  resource_group_name           = azurerm_resource_group.rg-dbx-wks-001.name
  location                      = azurerm_resource_group.rg-dbx-wks-001.location
  sku                           = "premium"
  managed_resource_group_name   = "rg-dbx-wks-001-dbx"
}

#
#   Create Databricks Workspace 002
#
resource "azurerm_databricks_workspace" "dbx-wks-002" {
  name                          = "dbx-wks-002"
  resource_group_name           = azurerm_resource_group.rg-dbx-wks-002.name
  location                      = azurerm_resource_group.rg-dbx-wks-002.location
  sku                           = "premium"
  managed_resource_group_name   = "rg-dbx-wks-002-dbx"
}

#
#   Create Databricks Workspace 003
#
resource "azurerm_databricks_workspace" "dbx-wks-003" {
  name                          = "dbx-wks-003"
  resource_group_name           = azurerm_resource_group.rg-dbx-wks-003.name
  location                      = azurerm_resource_group.rg-dbx-wks-003.location
  sku                           = "premium"
  managed_resource_group_name   = "rg-dbx-wks-003-dbx"
}