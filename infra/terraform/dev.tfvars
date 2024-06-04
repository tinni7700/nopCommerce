resource_group_info = {
  name     = "myaksgroup"
  location = "eastus"
}

aks_info = {
  name              = "default"
  node_count        = 1
  vm_size           = "Standard_B1s"
  identity_type     = "SystemAssigned"

}

# This can be pass from terminal as jenkins will be calling this 
# --var build_number=
# build_number = 0
