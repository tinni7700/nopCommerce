variable "resource_group_info" {
  type = object({
    name     = string
    location = string
  })
  description = "This information will be used for resource group name"

  default = {
    name     = "myaksgroup"
    location = "eastus"
  }

}

variable "aks_info" {
  type = object({
    name              = string
    node_count        = number
    vm_size           = string
    identity_type     = string

  })
  description = "This is information will be used for aks_info"

  default = {
    name              = "default"
    node_count        = 1
    vm_size           = "Standard_B1s"
    identity_type     = "SystemAssigned"

  }
}

variable "build_number" {
  type        = string
  default     = "0"
  description = "This value will be used for build number"
}