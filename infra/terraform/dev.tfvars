resource_group_info = {
      name = "myaksgroup"
      location = "eastus"
}

    aks_info = {
      name = "my-aks-cluster"
      node_count = 1
      default_node_pool = "default"
      vm_size = "Standard_B1s"
      identity_type = "SystemAssigned"

    }

# This can be pass from terminal as jenkins will be calling this 
# --var build_number=
build_number = 0
