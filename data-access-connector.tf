#
#   Create the Managed Identity for Databricks Unity Catalog Access
#
resource "azapi_resource" "mi-dbx-uc-dac" {
    type      = "Microsoft.Databricks/accessConnectors@2022-04-01-preview"
    name      = "mi-dbx-uc-dac"
    location  = azurerm_resource_group.rg-dbx-uc-001.location
    parent_id = azurerm_resource_group.rg-dbx-uc-001.id
    identity { type = "SystemAssigned" }
    body = jsonencode({ properties = {} })
}

#
#   Assign the Managed Identity the Storage Blob Data Contributor Role for the Unity Catalog Storage Account
#
resource "azurerm_role_assignment" "ra-mi-dbx-uc-dac" {
    scope                = azurerm_storage_account.st-dbx-uc-uksouth-metastore.id
    role_definition_name = "Storage Blob Data Contributor"
    principal_id         = azapi_resource.mi-dbx-uc-dac.identity[0].principal_id
}
