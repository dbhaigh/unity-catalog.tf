
#
# Create the Unity Catalog Storage Account
#
resource "azurerm_storage_account" "st-dbx-uc-uksouth-metastore" {
  name                      = "stdbxucuksouthmetastore"
  resource_group_name       = azurerm_resource_group.rg-dbx-uc-001.name
  location                  = azurerm_resource_group.rg-dbx-uc-001.location
  account_tier              = "Standard"
  account_replication_type  = "LRS"
  is_hns_enabled            = true
  depends_on                = [ 
    azurerm_resource_group.rg-dbx-uc-001
  ]
}

#
#   Create the Storage Container for the Metastore
#
resource "azurerm_storage_container" "sc-dbx-uc-uksouth-metastore" {
  name                      = "scdbxucuksouthmetastore"
  storage_account_name      = azurerm_storage_account.st-dbx-uc-uksouth-metastore.name
  container_access_type     = "private"
  depends_on                = [
    azurerm_storage_account.st-dbx-uc-uksouth-metastore
  ]
}

# ¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬

#
# Create the Storage Account for Catalogs 001 and 002
#
resource "azurerm_storage_account" "st-dbx-ext-cat-001" {
  name                      = "stdbxextcat001"
  resource_group_name       = azurerm_resource_group.rg-dbx-uc-001.name
  location                  = azurerm_resource_group.rg-dbx-uc-001.location
  account_tier              = "Standard"
  account_replication_type  = "LRS"
  is_hns_enabled            = true
  depends_on = [ 
    azurerm_resource_group.rg-dbx-uc-001
  ]
}

#
#   Create the Storage Container for Catalog 001
#
resource "azurerm_storage_container" "sc-dbx-uc-cat-001" {
  name                    = "scdbxuccat001"
  storage_account_name    = azurerm_storage_account.st-dbx-ext-cat-001.name
  container_access_type   = "private"
  depends_on              = [
    azurerm_storage_account.st-dbx-ext-cat-001
  ]
}


#
#   Create the Storage Container for Catalog 002
#
resource "azurerm_storage_container" "sc-dbx-uc-cat-002" {
  name                    = "scdbxuccat002"
  storage_account_name    = azurerm_storage_account.st-dbx-ext-cat-001.name
  container_access_type   = "private"
  depends_on              = [
    azurerm_storage_account.st-dbx-ext-cat-001
  ]
}

#
#   Create the Storage Container for Catalog 003
#
resource "azurerm_storage_container" "sc-dbx-uc-cat-003" {
  name                    = "scdbxuccat003"
  storage_account_name    = azurerm_storage_account.st-dbx-ext-cat-001.name
  container_access_type   = "private"
  depends_on              = [
    azurerm_storage_account.st-dbx-ext-cat-001
  ]
}