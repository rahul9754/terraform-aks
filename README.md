# AKS Infrastructure Deployment using Terraform

This repository contains Terraform configuration files to deploy an Azure Kubernetes Service (AKS) cluster.

## Files in this Repository

- **main.tf**: Contains the main Terraform configuration for deploying the AKS cluster.
- **output.tf**: Defines the outputs for the Terraform configuration.
- **variable.tf**: Declares the input variables used in the Terraform configuration.
- **terraform.tfvars**: Contains the values for the input variables declared in `variable.tf`.
- **.gitignore**: Specifies files and directories that should be ignored by git.

## Prerequisites

- [Terraform](https://www.terraform.io/downloads.html) installed on your local machine.
- An [Azure account](https://portal.azure.com/).
- Azure CLI installed and authenticated. You can install it [here](https://docs.microsoft.com/en-us/cli/azure/install-azure-cli) and log in using `az login`.

## Getting Started

## Configuring the Backend

To store the Terraform state file in Azure Storage, configure the backend in `main.tf`. This ensures that your Terraform state is stored securely and can be shared among team members.

##### 1. **Create an Azure Storage Account and Container**

Use the Azure CLI to create a storage account and container:

```sh
    az group create --name myResourceGroup --location centralindia
    az storage account create --name mystorageaccount --resource-group myResourceGroup --location centralindia --sku Standard_LRS
    az storage container create --name tfstate --account-name mystorageaccount
```
note: `mystorageaccount` name should be globally unique.

##### 2. **Configure the Backend in `main.tf`**

    Update your `main.tf` file to include the backend configuration:

```hcl
    terraform {
      backend "azurerm" {
        resource_group_name   = "myResourceGroup"
        storage_account_name  = "mystorageaccount"
        container_name        = "tfstate"
        key                   = "terraform.tfstate"
      }
    }

    provider "azurerm" {
      features {}
    }
```

## Getting Started

##### 1. **Clone the repository**

``` bash
    git clone https://github.com/rahul9754/terraform-aks.git
    cd terraform-aks
```

##### 2. **Configure your Terraform variables**

Edit the `terraform.tfvars` file to specify the values for the variables defined in `variable.tf`.

##### 3. **Initialize Terraform**

```sh
    terraform init
```

##### 4. **Plan the deployment**

```sh
    terraform plan
```

This command will output the actions that Terraform will take to deploy your AKS cluster.

##### 5. **Apply the deployment**

```sh
    terraform apply
```

This command will deploy the AKS cluster to your Azure subscription.

##### 6. **Destroy the deployment**

If you want to destroy the infrastructure managed by Terraform, use the following command:

```sh
    terraform destroy
   ```

## Output

The `output.tf` file defines the outputs that will be displayed after the infrastructure is deployed. These typically include important information like the AKS cluster name, resource group, and kubeconfig file.

## Variables

The `variable.tf` file declares the variables used in the Terraform configuration. These variables are defined in the `terraform.tfvars` file. You can override these values by specifying them directly in the command line or by creating a new `.tfvars` file.

## .gitignore

`.gitignore` file to exclude sensitive or unnecessary files from your git repository:
