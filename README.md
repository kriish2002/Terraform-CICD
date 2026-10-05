# Terraform Azure CI/CD Modular Architecture

This repository contains modularized, production-ready Terraform code for deploying Azure infrastructure across multiple environments (**Dev** and **Prod**) using `for_each` (Map approach), explicit `depends_on` between modules, and an Azure DevOps multi-stage CI/CD pipeline (`azure-pipelines.yml`).

---

## 📁 Repository Structure

```text
Terraform-CICD/
│
├── azure-pipelines.yml             # Multi-stage Azure DevOps Pipeline (Init, Validate, Security Scan)
├── dev.yml                         # Environment-specific pipeline definition
├── README.md                       # Documentation
│
└── terraform/
    │
    ├── environments/
    │   ├── dev/
    │   │   ├── main.tf             # Module caller with depends_on (Dev)
    │   │   ├── providers.tf        # Terraform & AzureRM provider config
    │   │   ├── variables.tf        # Input variable definitions (Maps)
    │   │   └── terraform.tfvars    # Dev environment specific values
    │   │
    │   └── prod/
    │       ├── main.tf             # Module caller with depends_on (Prod)
    │       ├── providers.tf        # Terraform & AzureRM provider config
    │       ├── variables.tf        # Input variable definitions (Maps)
    │       └── terraform.tfvars    # Prod environment specific values
    │
    └── modules/
        ├── resource-group/
        │   ├── main.tf             # azurerm_resource_group with for_each
        │   └── variables.tf        # Dynamic object schemas
        │
        └── vnet/
            ├── main.tf             # azurerm_virtual_network & azurerm_subnet with for_each
            └── variables.tf        # Dynamic object schemas
```

---

## 🚀 Key Concepts & Architecture

### 1. **Modular Design with `for_each`**
- **Resource Groups**: Configured via maps so multiple resource groups can be defined dynamically in `terraform.tfvars`.
- **Virtual Networks & Subnets**: VNets and associated subnets are declared dynamically with automatic key-based linkage (`vnet_key`).

### 2. **Explicit Dependency Management (`depends_on`)**
- The `vnet` module explicitly depends on `module.resource_group` to guarantee correct provisioning order without race conditions in Azure.

### 3. **Environment Separation (Dev & Prod)**
- Independent root configurations for `dev` and `prod` under `terraform/environments/`.
- Isolated variables, address spaces, and resource naming conventions:
  - **Dev**: `10.0.0.0/16` CIDR with web and app subnets.
  - **Prod**: `10.1.0.0/16` CIDR with web and app subnets.

### 4. **Azure DevOps Multi-Stage CI/CD Pipeline**
- **Stage 1: Terraform Init & Validate**
  - Installs Terraform (`1.9.8`).
  - Initializes remote state backend with Azure Storage Account (`ado-storage`).
  - Runs `terraform fmt -check -recursive` to enforce code formatting standards.
  - Runs `terraform validate` to verify syntax and configuration integrity.
- **Stage 2: Security & Static Analysis Scan**
  - **TFSec**: Scans for cloud security vulnerabilities and misconfigurations.
  - **TFLint**: Enforces Terraform best practices.
  - **Checkov**: Deep policy-as-code security inspection.

---

## 🛠️ Local Testing & Development

### 1. Initialize & Validate Dev:
```bash
cd terraform/environments/dev
terraform init -backend=false
terraform validate
terraform fmt -check -recursive
```

### 2. Initialize & Validate Prod:
```bash
cd terraform/environments/prod
terraform init -backend=false
terraform validate
terraform fmt -check -recursive
```
