terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.103.0"
    }
  }

  backend "azurerm" {
    resource_group_name  = "demoK8s"               # Can be passed via `-backend-config=`"resource_group_name=<resource group name>"` in the `init` command.
    storage_account_name = "ltdockerdemop"         # Can be passed via `-backend-config=`"storage_account_name=<storage account name>"` in the `init` command.
    container_name       = "dockertfvars"          # Can be passed via `-backend-config=`"container_name=<container name>"` in the `init` command.
    key                  = "k8s.${terraform.workspace}.tfstate" # Can be passed via `-backend-config=`"key=<blob key name>"` in the `init` command.
  }

}

provider "azurerm" {
  features {}
}