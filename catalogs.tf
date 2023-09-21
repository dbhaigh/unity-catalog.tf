#       CATALOG 001
#
#   Create Catalog-001
#
resource "databricks_catalog" "dbx-uc-catalog-001" {
    metastore_id        = databricks_metastore.dbx-uc-ms-uksouth.id
    force_destroy       = true
    isolation_mode      = "ISOLATED"
    name                = "dbx-uc-catalog-001"
    storage_root        = databricks_external_location.dbx-ext-cat-001.url
    depends_on          = [ 
        databricks_metastore_assignment.dbx-wks-001
    ]
}

#
#   Grant the Admin Group access to Catalog-001
#
resource "databricks_grants" "dbx-uc-catalog-001" {
    catalog             = databricks_catalog.dbx-uc-catalog-001.name
    grant {
        principal       = "Data Admins"
        privileges      = [ "ALL_PRIVILEGES" ]
    }
    depends_on          = [ 
        databricks_catalog.dbx-uc-catalog-001 
    ]
}

#
# Bind Catalog 001 to Workspace 001
#
resource "databricks_catalog_workspace_binding" "dbx-uc-catalog-001" {
  catalog_name          = databricks_catalog.dbx-uc-catalog-001.name
  workspace_id          = azurerm_databricks_workspace.dbx-wks-001.workspace_id
}

#       CATALOG 002
#
#   Create Catalog-002
#
resource "databricks_catalog" "dbx-uc-catalog-002" {
    provider            = databricks.wks-002
    metastore_id        = databricks_metastore.dbx-uc-ms-uksouth.id
    force_destroy       = true
    isolation_mode      = "ISOLATED"
    name                = "dbx-uc-catalog-002"
    storage_root        = databricks_external_location.dbx-ext-cat-002.url
    depends_on          = [ 
        databricks_metastore_assignment.dbx-wks-002
    ]
}

#
#   Grant the Admin Group access to Catalog-002
#
resource "databricks_grants" "dbx-uc-catalog-002" {
    provider            = databricks.wks-002
    catalog             = databricks_catalog.dbx-uc-catalog-002.name
    grant {
        principal       = "Data Admins"
        privileges      = [ "ALL_PRIVILEGES" ]
    }
    depends_on = [ 
        databricks_catalog.dbx-uc-catalog-002 
    ]
}

#
# Bind Catalog 002 to Workspace 002
#
resource "databricks_catalog_workspace_binding" "dbx-uc-catalog-002" {
    provider            = databricks.wks-002
    catalog_name        = databricks_catalog.dbx-uc-catalog-002.name
    workspace_id        = azurerm_databricks_workspace.dbx-wks-002.workspace_id
}

#       CATALOG 003
#
#   Create Catalog-003
#
resource "databricks_catalog" "dbx-uc-catalog-003" {
    provider            = databricks.wks-003
    metastore_id        = databricks_metastore.dbx-uc-ms-uksouth.id
    force_destroy       = true
    isolation_mode      = "ISOLATED"
    name                = "dbx-uc-catalog-003"
    storage_root        = databricks_external_location.dbx-ext-cat-003.url
    depends_on          = [ 
        databricks_metastore_assignment.dbx-wks-003
    ]
}

#
#   Grant the Admin Group access to Catalog-003
#
resource "databricks_grants" "dbx-uc-catalog-003" {
    provider            = databricks.wks-003
    catalog             = databricks_catalog.dbx-uc-catalog-003.name
    grant {
        principal       = "Data Admins"
        privileges      = [ "ALL_PRIVILEGES" ]
    }
    depends_on = [ 
        databricks_catalog.dbx-uc-catalog-003 
    ]
}

#
# Bind Catalog 003 to Workspace 003
#
resource "databricks_catalog_workspace_binding" "dbx-uc-catalog-003" {
    provider            = databricks.wks-003
    catalog_name        = databricks_catalog.dbx-uc-catalog-003.name
    workspace_id        = azurerm_databricks_workspace.dbx-wks-003.workspace_id
}