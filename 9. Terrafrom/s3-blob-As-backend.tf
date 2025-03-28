provider "aws" {
  region = "us-east-1"
}

terraform {
  backend "s3" {
    bucket         = "my-terraform-backend"
    key            = "terraform.tfstate"
    region         = "us-east-1"
    encrypt        = true
    dynamodb_table = "terraform-lock"
  }
}

######
provider "azurerm" {
  features {}
}

terraform {
  backend "azurerm" {
    resource_group_name  = "3tier-rg"
    storage_account_name = "storage3tier"
    container_name       = "tfstate"
    key                  = "terraform.tfstate"
  }
}
