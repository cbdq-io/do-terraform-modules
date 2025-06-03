terraform {
  required_version = "~> 1.9"
}

module "ssh_keys" {
  source = "./modules/do-github-ssh-keys"

  github_usernames = [
    "cbdqbot",
    "dallinb",
    "dallinv",
    "jaloughlin"
  ]
}

module "hub" {
  source = "./modules/do-hub"

  region       = "lon1"
  vpc_ip_range = "10.10.0.0/22"
}

output "ssh_keys" {
  description = "List of all SSH key fingerprints created."
  value       = module.ssh_keys.ssh_keys
}

output "user_ssh_key_fingerprints" {
  description = "Map of GitHub usernames to a list of their SSH key fingerprints."
  value       = module.ssh_keys.user_ssh_key_fingerprints
}
