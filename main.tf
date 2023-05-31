resource "azurerm_private_dns_zone" "this" {
  provider            = azurerm
  name                = var.name
  resource_group_name = var.rg.name
  lifecycle {
    ignore_changes = [
      tags
    ]
  }
}

resource "azurerm_private_dns_zone_virtual_network_link" "this" {
  provider              = azurerm
  for_each              = var.vnets
  name                  = "${each.value.name}_${var.name}"
  private_dns_zone_name = azurerm_private_dns_zone.this.name
  virtual_network_id    = each.value.id
  resource_group_name   = var.rg.name
  lifecycle {
    ignore_changes = [
      tags
    ]
  }
}