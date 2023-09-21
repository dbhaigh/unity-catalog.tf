#
#   Create the resource group for Databricks Unity Catalog
#
resource "azurerm_resource_group" "rg-dbx-uc-001" {
  name     = "rg-dbx-uc-001"
  location = "uksouth"
}

#
#   Create the resource group for Databricks Workspace 001
#
resource "azurerm_resource_group" "rg-dbx-wks-001" {
  name     = "rg-dbx-wks-001"
  location = "uksouth"
}

#
#   Create the resource group for Databricks Workspace 002
#
resource "azurerm_resource_group" "rg-dbx-wks-002" {
  name     = "rg-dbx-wks-002"
  location = "uksouth"
}

#
#   Create the resource group for Databricks Workspace 003
#
resource "azurerm_resource_group" "rg-dbx-wks-003" {
  name     = "rg-dbx-wks-003"
  location = "uksouth"
}