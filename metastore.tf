#
#   Create the UK South Metastore
#
resource "databricks_metastore" "dbx-uc-ms-uksouth" {
  name = "dbx-uc-ms-uksouth"
  storage_root = format("abfss://%s@%s.dfs.core.windows.net/",
    azurerm_storage_container.sc-dbx-uc-uksouth-metastore.name,
  azurerm_storage_account.st-dbx-uc-uksouth-metastore.name)
  force_destroy = true
}

#
#   Configure Metastore Data Access
#
resource "databricks_metastore_data_access" "dbx-uks-ms-dac" {
  metastore_id = databricks_metastore.dbx-uc-ms-uksouth.id
  name = "dbx-uks-ms-dac"
  azure_managed_identity {
    access_connector_id = azapi_resource.mi-dbx-uc-dac.id
  }
  depends_on = [ 
    databricks_metastore.dbx-uc-ms-uksouth,
    databricks_metastore_assignment.dbx-wks-001
  ]
  is_default = true
}

#
#   Assign the Metastore to to Workspace 001
#
resource "databricks_metastore_assignment" "dbx-wks-001" {
  workspace_id = azurerm_databricks_workspace.dbx-wks-001.workspace_id
  metastore_id = databricks_metastore.dbx-uc-ms-uksouth.id
}

#
#   Assign the Metastore to to Workspace 002
#
resource "databricks_metastore_assignment" "dbx-wks-002" {
  provider      = databricks.wks-002
  workspace_id  = azurerm_databricks_workspace.dbx-wks-002.workspace_id
  metastore_id  = databricks_metastore.dbx-uc-ms-uksouth.id
}

#
#  Assign the Metastore to to Workspace 003
#
resource "databricks_metastore_assignment" "dbx-wks-003" {
  provider      = databricks.wks-003
  workspace_id  = azurerm_databricks_workspace.dbx-wks-003.workspace_id
  metastore_id  = databricks_metastore.dbx-uc-ms-uksouth.id
}