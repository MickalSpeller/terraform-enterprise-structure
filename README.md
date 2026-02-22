# Terraform Enterprise Structure Project

This repository contains a production-style Terraform structure for deploying a secure, scalable architecture in Microsoft Azure. I will be using this framework for the 3 tiered architecure that I will be deploying as part of a larger Azure project.

The focus of this project is not just infrastructure deployment, but infrastructure engineering best practices:

- Modular design
- Environment separation [dev/test/prod]
- Remote state management
- Secure defaults
- Reusability & Scalability

**Feel free to browse through the folder sctructure as commit code during the full build process.**

---

## Project Goals

The goal of this project is to build a clean Terraform enterprise structure that communicates:

- My Proven ability to Build and Destroy complete environments with Terraform using Infrastructure as Code [IaC]
- Strong grasp of modular infrastructure design principles
- Clear understanding of Terraform environment separation and repository organization
- Practical knowledge of remote state management and state lifecycle strategy
- Security-first approach to cloud architecture, engineering solutions, not just deploying resources
- Experience designing scalable, maintainable Infrastructure as Code solutions [IaC]

---

## Architecture Overview

This infrastructure supports a 3 tiered architecture with web frontends, middleware application clusters, virtual machine scale sets [VMSS], Azure Containers, or Kubernetes along with backed end Databases such as SQL and Azure Cosmos DB

Some of the Azure resources I will be deploying is as follows:

- Web Tier, Container-based frontend [Azure Container Instances]
- Middleware Tier, Application logic [VM Scale Set]
- Database Tier, Azure SQL with Private Endpoint
- Managed Identites, Key Vault, IAM and Governance
- Hub-and-Spoke topology [VNETs]
- Azure Firewall [centralized egress control]
- Application Gateway with WAF
- Private Endpoints for PaaS resources
- Subnet level NSG isolation
- Secure Azure VPN Gateway and Local Network Gateways
- Monitoring using Azure Log Analytics, Application Insights, Azure Monitoring and Alerts.

---

## Enterprise Style Terraform Folder Structure

```text
project-delta/
│
├── modules/
│   ├── network/
│   ├── firewall/
│   ├── compute/
│   ├── storage
│   ├── security/
│   └── monitoring/
│
├── environments/
│   ├── dev/
│   │   ├── main.tf
│   │   ├── variables.tf
│   │   ├── terraform.tfvars
│   │   └── backend.tf
│   │
│   ├── test/
│   │   ├── main.tf
│   │   ├── variables.tf
│   │   ├── terraform.tfvars
│   │   └── backend.tf
│   │
│   └── prod/
│       ├── main.tf
│       ├── variables.tf
│       ├── terraform.tfvars
│       └── backend.tf
│
├── global/
│   ├── resource_groups.tf
│   ├── naming.tf
│   └── tags.tf
│
├── providers.tf
├── versions.tf
├── README.md
└── .gitignore

```
---

## Design Principals

I will attempt to adhere to strict design principals while building this project to maintain the reuseability across various projects.

- Terraform Remote State **IS NOT OPTIONAL.**
- Limit the use of hardcoded values
- Inputs defined via variables
- Outputs exposed for inter-module references
- No provider configuration inside modules
- Build modules to be reused across environments [dev, test, prod] without modification.

---

## State Configuration at a glance

Terraform state is stored in Azure Storage Blob Container using the ``` azurerm ``` backend.

example.

```text

terraform {
  backend "azurerm" {
    resource_group_name  = "rg-computrmike-prod"
    storage_account_name = "stgacctcomputrmikeprod"
    container_name       = "prod-tfstate"
    key                  = "prod.terraform.tfstate"
  }
}

```
---

## Author

Mickal Speller<br>
Cloud & Network Engineering Portfolio Project<br>
Focused on engineering secure, scalable Azure architecture with Terraform best practices<br>
