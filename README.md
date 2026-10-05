# Terraform Azure CI/CD Modular Architecture

This repository contains modularized Terraform code for deploying Azure infrastructure with `for_each` (Map approach), explicit `depends_on` between modules, and an Azure DevOps multi-stage CI/CD pipeline (`azure-pipelines.yml`).

## 📁 Repository Structure

```text
Terraform-CICD/
│
├── azure-pipelines.yml
├── README.md
│
└── terraform/
    │
    ├── environments/
    │   ├── dev/
    │   │   ├── main.tf             # Module caller with depends_on
    │   │   ├── providers.tf        # Terraform & azurerm provider config
    │   │   ├── variables.tf        # Input variable definitions (maps)
    │   │   └── terraform.tfvars    # Dev-specific values
    │   │
    │   └── prod/
    │       ├── main.tf             # Module caller with depends_on
    │       ├── providers.tf        # Terraform & azurerm provider config
    │       ├── variables.tf        # Input variable definitions (maps)
    │       └── terraform.tfvars    # Prod-specific values
    │
    └── modules/
        ├── resource-group/
        │   ├── main.tf             # azurerm_resource_group with for_each
        │   └── variables.tf
        │
        └── vnet/
            ├── main.tf             # azurerm_virtual_network & azurerm_subnet with for_each
            └── variables.tf
```

## 🚀 Key Concepts Used

1. **`for_each` with Maps**:
   - Both Resource Groups and Virtual Networks/Subnets use maps, allowing you to add/remove resources easily in `terraform.tfvars` without modifying module code.
2. **`depends_on`**:
   - The `vnet` module explicitly depends on `module.resource_group` to guarantee correct provisioning order.
3. **Azure DevOps CI/CD Pipeline**:
   - `Validate`: Checks code formatting and syntax.
   - `Plan`: Runs dry run and creates execution plan.
   - `Apply`: Applies changes automatically when merged to `main`.
