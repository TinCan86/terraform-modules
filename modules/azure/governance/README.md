# Governance

This module is used to create resource groups, service principals, Azure AD groups, Azure KeyVaults and delegation to all of those resources.

## Requirements

| Name | Version |
|------|---------|
| terraform | 0.13.5 |
| azuread | 1.0.0 |
| azurerm | 2.35.0 |
| random | 3.0.0 |

## Providers

| Name | Version |
|------|---------|
| azuread | 1.0.0 |
| azurerm | 2.35.0 |
| random | 3.0.0 |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| core\_name | The commonName for the core infra | `string` | n/a | yes |
| environment | The environment name to use for the deploy | `string` | n/a | yes |
| owner\_service\_principal\_name | The name of the service principal that will be used to run terraform and is owner of the subsciptions | `string` | n/a | yes |
| regions | The Azure Regions to configure | <pre>list(object({<br>    location       = string<br>    location_short = string<br>  }))</pre> | n/a | yes |
| resource\_group\_configs | Resource group configuration | <pre>list(<br>    object({<br>      common_name                = string<br>      delegate_aks               = bool # Delegate aks permissions<br>      delegate_key_vault         = bool # Delegate KeyVault creation<br>      delegate_service_endpoint  = bool # Delegate Service Endpoint permissions<br>      delegate_service_principal = bool # Delegate Service Principal<br>      tags                       = map(string)<br>    })<br>  )</pre> | n/a | yes |
| subscription\_name | The commonName for the subscription | `string` | n/a | yes |

## Outputs

No output.

