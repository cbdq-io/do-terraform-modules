<!-- BEGIN_TF_DOCS -->
Create a hub infrastructure in Digital Ocean.

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | ~> 1.9 |
| <a name="requirement_digitalocean"></a> [digitalocean](#requirement\_digitalocean) | ~> 2.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_digitalocean"></a> [digitalocean](#provider\_digitalocean) | ~> 2.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [digitalocean_loadbalancer.hub](https://registry.terraform.io/providers/digitalocean/digitalocean/latest/docs/resources/loadbalancer) | resource |
| [digitalocean_project.hub](https://registry.terraform.io/providers/digitalocean/digitalocean/latest/docs/resources/project) | resource |
| [digitalocean_vpc.hub](https://registry.terraform.io/providers/digitalocean/digitalocean/latest/docs/resources/vpc) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_loadbalancers"></a> [loadbalancers](#input\_loadbalancers) | List of load balancers to create. | <pre>list(object({<br/>    name                   = string<br/>    droplet_ids            = optional(list(string))<br/>    droplet_tag            = optional(string)<br/>    redirect_http_to_https = optional(bool)<br/>    size                   = optional(number)<br/>    size_unit              = optional(string)<br/><br/>    forwarding_rules = list(object({<br/>      entry_protocol  = string<br/>      entry_port      = number<br/>      target_protocol = string<br/>      target_port     = number<br/>    }))<br/><br/>    health_check = object({<br/>      protocol                 = string<br/>      port                     = number<br/>      path                     = optional(string)<br/>      check_interval_seconds   = optional(number)<br/>      response_timeout_seconds = optional(number)<br/>      unhealthy_threshold      = optional(number)<br/>      healthy_threshold        = optional(number)<br/>    })<br/><br/>    sticky_sessions = optional(object({<br/>      type               = string<br/>      cookie_name        = optional(string)<br/>      cookie_ttl_seconds = optional(number)<br/>    }))<br/>  }))</pre> | `[]` | no |
| <a name="input_project_description"></a> [project\_description](#input\_project\_description) | The description of the project.  If not provided, will default to "A project to represent hub resources in ${var.region}.". | `string` | `""` | no |
| <a name="input_project_environment"></a> [project\_environment](#input\_project\_environment) | The environment of the project's resources. | `string` | `"Production"` | no |
| <a name="input_project_name"></a> [project\_name](#input\_project\_name) | The name of the project.  If not provided, will default to "hub-${var.region}". | `string` | `""` | no |
| <a name="input_project_purpose"></a> [project\_purpose](#input\_project\_purpose) | The purpose of the project. | `string` | `"Operational / Developer tooling"` | no |
| <a name="input_region"></a> [region](#input\_region) | The DigitalOcean region to base the hub in. | `string` | n/a | yes |
| <a name="input_vpc_ip_range"></a> [vpc\_ip\_range](#input\_vpc\_ip\_range) | The range of IP addresses for the VPC in CIDR notation. | `string` | n/a | yes |
| <a name="input_vpc_name"></a> [vpc\_name](#input\_vpc\_name) | The name of the VPC.  If not provided, will default to "hub-${var.region}". | `string` | `""` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_loadbalancers"></a> [loadbalancers](#output\_loadbalancers) | Map of load balancer names to their ID and IP. |
| <a name="output_project_description"></a> [project\_description](#output\_project\_description) | The description of the project. |
| <a name="output_project_environment"></a> [project\_environment](#output\_project\_environment) | The environment of the project. |
| <a name="output_project_id"></a> [project\_id](#output\_project\_id) | The unique ID of the project. |
| <a name="output_project_name"></a> [project\_name](#output\_project\_name) | The name of project. |
| <a name="output_region"></a> [region](#output\_region) | The region of the VPC. |
| <a name="output_vpc_id"></a> [vpc\_id](#output\_vpc\_id) | The unique identifier of the VPC. |
| <a name="output_vpc_ip_range"></a> [vpc\_ip\_range](#output\_vpc\_ip\_range) | The range of IP addresses for the VPC in CIDR notation. |
| <a name="output_vpc_name"></a> [vpc\_name](#output\_vpc\_name) | The name of the VPC. |
| <a name="output_vpc_urn"></a> [vpc\_urn](#output\_vpc\_urn) | The uniform resource name (URN) for the VPC. |
<!-- END_TF_DOCS -->