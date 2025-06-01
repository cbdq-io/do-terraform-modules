output "github_usernames" {
  description = "The list of GitHub usernames provided."
  value       = var.github_usernames
}

output "ssh_keys" {
  description = "List of all SSH key fingerprints created."
  value       = [for key in digitalocean_ssh_key.key : key.fingerprint]
}
