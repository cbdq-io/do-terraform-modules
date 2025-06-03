variable "loadbalancers" {
  description = "List of load balancers to create."
  type = list(object({
    name                   = string
    droplet_ids            = optional(list(string))
    droplet_tag            = optional(string)
    redirect_http_to_https = optional(bool)
    size                   = optional(number)
    size_unit              = optional(string)

    forwarding_rules = list(object({
      entry_protocol  = string
      entry_port      = number
      target_protocol = string
      target_port     = number
    }))

    health_check = object({
      protocol                 = string
      port                     = number
      path                     = optional(string)
      check_interval_seconds   = optional(number)
      response_timeout_seconds = optional(number)
      unhealthy_threshold      = optional(number)
      healthy_threshold        = optional(number)
    })

    sticky_sessions = optional(object({
      type               = string
      cookie_name        = optional(string)
      cookie_ttl_seconds = optional(number)
    }))
  }))

  default = []
}

variable "project_description" {
  description = "The description of the project.  If not provided, will default to \"A project to represent hub resources in $${var.region}.\"."
  type        = string
  default     = ""
}

variable "project_environment" {
  description = "The environment of the project's resources."
  type        = string
  default     = "Production"
}

variable "project_name" {
  description = "The name of the project.  If not provided, will default to \"hub-$${var.region}\"."
  type        = string
  default     = ""
}

variable "project_purpose" {
  description = "The purpose of the project."
  type        = string
  default     = "Operational / Developer tooling"
}

variable "region" {
  description = "The DigitalOcean region to base the hub in."
  type        = string
}

variable "vpc_ip_range" {
  description = "The range of IP addresses for the VPC in CIDR notation."
  type        = string
}

variable "vpc_name" {
  description = "The name of the VPC.  If not provided, will default to \"hub-$${var.region}\"."
  type        = string
  default     = ""
}
