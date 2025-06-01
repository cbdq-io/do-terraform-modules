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

output "ssh_keys" {
  description = "List of all SSH key fingerprints created."
  value       = module.ssh_keys.ssh_keys
}
