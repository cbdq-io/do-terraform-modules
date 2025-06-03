output "loadbalancers" {
  description = "Map of load balancer names to their ID and IP."
  value = {
    for name, lb in digitalocean_loadbalancer.hub :
    name => {
      id = lb.id
      ip = lb.ip
    }
  }
}

output "project_description" {
  description = "The description of the project."
  value       = digitalocean_project.hub.description
}

output "project_environment" {
  description = "The environment of the project."
  value       = digitalocean_project.hub.environment
}

output "project_id" {
  description = "The unique ID of the project."
  value       = digitalocean_project.hub.id
}

output "project_name" {
  description = "The name of project."
  value       = digitalocean_project.hub.name
}

output "region" {
  description = "The region of the VPC."
  value       = digitalocean_vpc.hub.region
}

output "vpc_id" {
  description = "The unique identifier of the VPC."
  value       = digitalocean_vpc.hub.id
}

output "vpc_ip_range" {
  description = "The range of IP addresses for the VPC in CIDR notation."
  value       = digitalocean_vpc.hub.ip_range
}

output "vpc_name" {
  description = "The name of the VPC."
  value       = digitalocean_vpc.hub.name
}

output "vpc_urn" {
  description = "The uniform resource name (URN) for the VPC."
  value       = digitalocean_vpc.hub.urn
}
