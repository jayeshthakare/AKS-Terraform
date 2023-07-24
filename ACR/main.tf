data "azurerm_key_vault" "azure_vault" {
  name = var.keyvault_name
  resource_group_name = var.keyvault_rg
}

data "azurerm_key_vault_secret" "sp_id" {
  name = var.clientidkvsecret
  key_vault_id = data.azurerm_key_vault.azure_vault.id
}

data "azuread_service_principal" "aks_principal" {
  application_id = data.azurerm_key_vault_secret.sp_id.value
}

resource "azurerm_container_registry" "acr" {
  name = var.acrname
  resource_group_name = var.rg_name
  location = var.rg_location
  sku = "Basic"
  admin_enabled = true
}

resource "azurerm_role_assignment" "crpull_role" {
  scope = azurerm_container_registry.acr.id
  role_definition_name = "Reader"
  principal_id = data.azuread_service_principal.aks_principal.id
  skip_service_principal_ad_check = true
}