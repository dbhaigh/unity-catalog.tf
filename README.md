# unity-catalog.tf
Terraform implementation Unity Catalog

The files in this repo will: 
Deploy 3 Databricks Workspaces to 3 resource groups (let's keep things tidy)
Deploy 2 Storage Accounts to another resource group - 1 SA for the metastore, 1 SA for external locations
Deploy 3 Storage Containers into the External Location SA - 1 per workspace
Deploy 3 Catalogs - 1 to each SC - and grant access rights to them
Deploy 3 External Locations - 1 per Catalog - and grants access rights to them
Assigns each workspace to the metastore
Bind each Catalog to it's workspace
Create the Managed Identity that will mediate access tot he metastore
Assign the "Storage Blob Data Contributor" role to the MI

If you find this helpful?  Drop me a line - abhaigh@gmail.com
