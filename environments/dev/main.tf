module "azurerm_rg" {
  source = "../../modules/azurerm_rg"
  rgs = var.rgs
}

module "azurerm_sa" {
  depends_on = [ module.azurerm_rg ]
  source = "../../modules/azurerm_sa"
  sgs = var.sgs
}

module "azurerm_virtual_network" {
  depends_on = [ module.azurerm_rg ]
  source = "../../modules/azurerm_vnet"
  vnets = var.vnets
}

module "azurerm_public_ip" {
  depends_on = [ module.azurerm_rg ]
  source = "../../modules/azurerm_pip"
  pips = var.pips
}

module "azurerm_linux_virtual_machine" {
  depends_on = [module.azurerm_virtual_network, module.azurerm_key_vault_secret]
  source = "../../modules/azurerm_compute"
  vms = var.vms
}

module "azurerm_key_vault" {
  depends_on = [ module.azurerm_rg ]
  source = "../../modules/azurerm_key_vault"
  kvs = var.kvs
}

module "azurerm_key_vault_secret" {
  depends_on = [ module.azurerm_key_vault ]
  source = "../../modules/azurerm_key_vault_secret"
  kvsc = var.kvsc
}

module "azurerm_server" {
  depends_on = [ module.azurerm_rg ]
  source = "../../modules/azurerm_server"
  servers = var.servers
}

module "azurerm_database" {
  depends_on = [ module.azurerm_rg, module.azurerm_server ]
  source = "../../modules/azurerm_database"
  databases = var.databases
}

module "azurerm_nsg" {
  depends_on = [ module.azurerm_rg ]
  source = "../../modules/azurerm_nsg"
  nsgs = var.nsgs
}

module "azurerm_bastion" {
  depends_on = [ module.azurerm_virtual_network, module.azurerm_public_ip ]
  source = "../../modules/azurerm_bastion"
  bastions = var.bastions 
}

module "azurerm_lb" {
  depends_on = [ module.azurerm_rg, module.azurerm_public_ip ]
  source = "../../modules/azurerm_lb"
  lbs = var.lbs
}

module "azurerm_nic_bap_association" {
  depends_on = [ module.azurerm_lb ]
  source = "../../modules/azurerm_nic_bap_association"
  baps = var.baps
}