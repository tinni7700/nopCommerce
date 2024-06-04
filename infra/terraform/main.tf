resource "azurerm_resource_group" "this" {
  name     = var.resource_group_info.name
  location = var.resource_group_info.location
  tags = {
    Environment = terraform.workspace
    CreatedBy   = "Terraform"
  }  
}

resource "azurerm_kubernetes_cluster" "this" {
    name = "my-aks-cluster"
    location = azurerm_resource_group.this.location
    resource_group_name = azurerm_resource_group.this.name
    dns_prefix = "lt-${terraform.workspace}"

    default_node_pool {
        name = var.aks_info.name
        node_count = var.aks_info.node_count
        vm_size = var.aks_info.vm_size
      
    }
    identity {
      type = var.aks_info.identity_type
    }

    tags = {
        Environment = terraform.workspace
        CreatedBy   = "Terraform"
    }  


}

resource "null_resource" "connection" {
    triggers = {
      build_number = var.build_number
    }
    provisioner "local-exec" {
        command = "az aks get-credentials --resource-group ${azurerm_resource_group.this.name} --name ${azurerm_kubernetes_cluster.this.name}"
      
    }

  
}