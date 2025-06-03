/**
 * Create a hub infrastructure in Digital Ocean.
 */

resource "digitalocean_project" "hub" {
  name        = var.project_name == "" ? "hub-${lower(var.region)}" : var.project_name
  description = var.project_description == "" ? "A project to represent hub resources in ${var.region}." : var.project_description
  purpose     = var.project_purpose
  environment = var.project_environment
}

resource "digitalocean_vpc" "hub" {
  name     = var.vpc_name == "" ? "hub-${var.region}" : var.vpc_name
  region   = var.region
  ip_range = var.vpc_ip_range
}

resource "digitalocean_loadbalancer" "hub" {
  for_each = {
    for lb in var.loadbalancers : lb.name => lb
  }

  name                   = each.value.name
  region                 = digitalocean_vpc.hub.region
  vpc_uuid               = digitalocean_vpc.hub.id
  droplet_ids            = lookup(each.value, "droplet_ids", null)
  droplet_tag            = lookup(each.value, "droplet_tag", null)
  redirect_http_to_https = lookup(each.value, "redirect_http_to_https", false)
  size                   = lookup(each.value, "size", null)
  size_unit              = lookup(each.value, "size_unit", null)
  project_id             = digitalocean_project.hub.id

  dynamic "forwarding_rule" {
    for_each = each.value.forwarding_rules
    content {
      entry_protocol   = forwarding_rule.value.entry_protocol
      entry_port       = forwarding_rule.value.entry_port
      target_protocol  = forwarding_rule.value.target_protocol
      target_port      = forwarding_rule.value.target_port
      certificate_name = lookup(forwarding_rule.value, "certificate_name", null)
    }
  }

  healthcheck {
    protocol = each.value.health_check.protocol
    port     = each.value.health_check.port

    path                     = lookup(each.value.health_check, "path", null)
    check_interval_seconds   = lookup(each.value.health_check, "check_interval_seconds", null)
    response_timeout_seconds = lookup(each.value.health_check, "response_timeout_seconds", null)
    unhealthy_threshold      = lookup(each.value.health_check, "unhealthy_threshold", null)
    healthy_threshold        = lookup(each.value.health_check, "healthy_threshold", null)
  }

  dynamic "sticky_sessions" {
    for_each = each.value.sticky_sessions != null ? [each.value.sticky_sessions] : []
    content {
      type               = sticky_sessions.value.type
      cookie_name        = lookup(sticky_sessions.value, "cookie_name", null)
      cookie_ttl_seconds = lookup(sticky_sessions.value, "cookie_ttl_seconds", null)
    }
  }
}
