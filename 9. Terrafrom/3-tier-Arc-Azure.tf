provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "rg" {
  name     = "3tier-rg"
  location = "East US"
}

# 🔹 Networking: Virtual Network & Subnets
resource "azurerm_virtual_network" "vnet" {
  name                = "vnet-3tier"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  address_space       = ["10.0.0.0/16"]
}

resource "azurerm_subnet" "subnet_web" {
  name                 = "subnet-web"
  resource_group_name  = azurerm_resource_group.rg.name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = ["10.0.1.0/24"]
}

resource "azurerm_subnet" "subnet_app" {
  name                 = "subnet-app"
  resource_group_name  = azurerm_resource_group.rg.name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = ["10.0.2.0/24"]
}

resource "azurerm_subnet" "subnet_db" {
  name                 = "subnet-db"
  resource_group_name  = azurerm_resource_group.rg.name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = ["10.0.3.0/24"]
}

# 🔹 Network Security Groups
resource "azurerm_network_security_group" "nsg_web" {
  name                = "nsg-web"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
}

resource "azurerm_network_security_group" "nsg_app" {
  name                = "nsg-app"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
}

resource "azurerm_network_security_group" "nsg_db" {
  name                = "nsg-db"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
}

# 🔹 Virtual Machines
resource "azurerm_network_interface" "nic" {
  name                = "nic-web"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.subnet_web.id
    private_ip_address_allocation = "Dynamic"
  }
}

resource "azurerm_virtual_machine" "vm_web" {
  name                  = "vm-web"
  location              = azurerm_resource_group.rg.location
  resource_group_name   = azurerm_resource_group.rg.name
  network_interface_ids = [azurerm_network_interface.nic.id]
  vm_size               = "Standard_B1s"

  storage_os_disk {
    name              = "myosdisk"
    caching          = "ReadWrite"
    create_option    = "FromImage"
  }

  storage_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "18.04-LTS"
    version   = "latest"
  }

  os_profile {
    computer_name  = "vm-web"
    admin_username = "adminuser"
    admin_password = "P@ssw0rd1234"
  }

  os_profile_linux_config {
    disable_password_authentication = false
  }
}

# 🔹 Blob Storage
resource "azurerm_storage_account" "storage" {
  name                     = "storage3tier"
  resource_group_name      = azurerm_resource_group.rg.name
  location                 = azurerm_resource_group.rg.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

resource "azurerm_storage_container" "container" {
  name                  = "file-container"
  storage_account_name  = azurerm_storage_account.storage.name
  container_access_type = "private"
}

# 🔹 Frontend: Application Gateway
resource "azurerm_application_gateway" "appgw" {
  name                = "app-gateway"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  sku {
    name = "Standard_v2"
    tier = "Standard_v2"
  }
  frontend_port {
    name = "http"
    port = 80
  }
}

# 🔹 Backend: Azure App Service
resource "azurerm_app_service_plan" "app_plan" {
  name                = "app-service-plan"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  kind                = "Linux"
  sku {
    tier = "Standard"
    size = "S1"
  }
}

resource "azurerm_app_service" "app" {
  name                = "my-app-service"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  app_service_plan_id = azurerm_app_service_plan.app_plan.id
}

# 🔹 Data Layer: Azure SQL Database
resource "azurerm_sql_server" "sql" {
  name                         = "sqlserver3tier"
  resource_group_name          = azurerm_resource_group.rg.name
  location                     = azurerm_resource_group.rg.location
  administrator_login          = "adminuser"
  administrator_login_password = "P@ssw0rd1234"
}

resource "azurerm_sql_database" "db" {
  name                = "mydatabase"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  server_name         = azurerm_sql_server.sql.name
  sku_name            = "S0"
}
