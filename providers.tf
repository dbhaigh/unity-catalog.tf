#
#   Configure Terraform Provider
#
terraform {
    backend "local" {
        path = "terraform.tfstate"
    }

    required_providers {
        azapi = {
            source = "azure/azapi"
        }
        azurerm = {
            source = "hashicorp/azurerm"
        }
        databricks = {
            source = "databricks/databricks"
        }
    }
}

#
#   Default Azapi provider
#
provider "azapi" { 
    subscription_id = "6d19dea5-b1bd-4bab-9fa7-40688636add8"
}

#
#   Default AzureRM Provider - XE2CA Non-Production
#
provider "azurerm" {
    subscription_id = "6d19dea5-b1bd-4bab-9fa7-40688636add8"
    features {}
}

provider "databricks" {
    host = azurerm_databricks_workspace.dbx-wks-001.workspace_url
}

provider "databricks" {
    alias = "wks-002"
    host = azurerm_databricks_workspace.dbx-wks-002.workspace_url
}

provider "databricks" {
    alias = "wks-003"
    host = azurerm_databricks_workspace.dbx-wks-003.workspace_url
}