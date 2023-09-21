#
#   Create the Managed Identity for External Storage Access
#
resource "azapi_resource" "mi-dbx-ext-dac" {
    type      = "Microsoft.Databricks/accessConnectors@2022-04-01-preview"
    name      = "mi-dbx-ext-dac"
    location  = azurerm_resource_group.rg-dbx-uc-001.location
    parent_id = azurerm_resource_group.rg-dbx-uc-001.id
    identity { type = "SystemAssigned" }
    body      = jsonencode({ properties = {} })
}

#
#   Assign the Managed Identity the Storage Blob Data Contributor Role on the External Storage account
#
resource "azurerm_role_assignment" "ra-mi-dbx-ext-dac" {
    scope                = azurerm_storage_account.st-dbx-ext-cat-001.id
    role_definition_name = "Storage Blob Data Contributor"
    principal_id         = azapi_resource.mi-dbx-ext-dac.identity[0].principal_id
}

#
#   
#
resource "databricks_storage_credential" "mi-dbx-ext-dac-creds" {
    name = azapi_resource.mi-dbx-ext-dac.name
    azure_managed_identity {
        access_connector_id = azapi_resource.mi-dbx-ext-dac.id
    }
    depends_on = [ 
        databricks_metastore_assignment.dbx-wks-001 
    ]
}

resource "databricks_grants" "external_storage_credential" {
    storage_credential = databricks_storage_credential.mi-dbx-ext-dac-creds.id
    grant {
        principal  = "Data Admins"
        privileges = [ "ALL_PRIVILEGES" ] 
    }
}  

#
#   CATALOG 001
#
resource "databricks_external_location" "dbx-ext-cat-001" {
    name = "dbx-ext-cat-001"
    url  = format("abfss://%s@%s.dfs.core.windows.net/",
        azurerm_storage_container.sc-dbx-uc-cat-001.name,
        azurerm_storage_account.st-dbx-ext-cat-001.name)
    credential_name = databricks_storage_credential.mi-dbx-ext-dac-creds.id
    depends_on      = [ 
        databricks_metastore_assignment.dbx-wks-001,
        azurerm_role_assignment.ra-mi-dbx-ext-dac
    ]
}

resource "databricks_grants" "dbx-ext-cat-001" {
    external_location = databricks_external_location.dbx-ext-cat-001.id
    grant {
        principal  = "Data Admins"
        privileges = [ "ALL_PRIVILEGES" ] 
    }
}

#
#   CATALOG 002
#
resource "databricks_external_location" "dbx-ext-cat-002" {
    name = "dbx-ext-cat-002"
    url  = format("abfss://%s@%s.dfs.core.windows.net/",
        azurerm_storage_container.sc-dbx-uc-cat-002.name,
        azurerm_storage_account.st-dbx-ext-cat-001.name)
    credential_name = databricks_storage_credential.mi-dbx-ext-dac-creds.id
    depends_on      = [ 
        databricks_metastore_assignment.dbx-wks-001,
        azurerm_role_assignment.ra-mi-dbx-ext-dac
    ]
}

resource "databricks_grants" "dbx-ext-cat-002" {
    external_location = databricks_external_location.dbx-ext-cat-002.id
    grant {
        principal  = "Data Admins"
        privileges = [ "ALL_PRIVILEGES" ] 
    }
}

#
#   CATALOG 003
#
resource "databricks_external_location" "dbx-ext-cat-003" {
    name = "dbx-ext-cat-003"
    url  = format("abfss://%s@%s.dfs.core.windows.net/",
        azurerm_storage_container.sc-dbx-uc-cat-003.name,
        azurerm_storage_account.st-dbx-ext-cat-001.name)
    credential_name = databricks_storage_credential.mi-dbx-ext-dac-creds.id
    depends_on      = [ 
        databricks_metastore_assignment.dbx-wks-001,
        azurerm_role_assignment.ra-mi-dbx-ext-dac
    ]
}

resource "databricks_grants" "dbx-ext-cat-003" {
    external_location = databricks_external_location.dbx-ext-cat-003.id
    grant {
        principal  = "Data Admins"
        privileges = [ "ALL_PRIVILEGES" ] 
    }
}