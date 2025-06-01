terraform {
  required_version = "~> 1.9"
}

module "do_github_ssh_keys" {
  source = "./modules/do-github-ssh-keys"

  github_usernames = [
    "cbdqbot",
    "dallinb",
    "dallinv",
    "jaloughlin"
  ]
}

output "do_ssh_keys" {
  description = "List of all SSH key fingerprints created."
  value       = module.do_github_ssh_keys.ssh_keys
}
