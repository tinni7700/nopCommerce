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
        name = "default"
        node_count = 1
        vm_size = "Standard_B1s"
      
    }
    identity {
      type = "SystemAssigned"
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