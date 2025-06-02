output "github_usernames" {
  description = "The list of GitHub usernames provided."
  value       = var.github_usernames
}

output "ssh_keys" {
  description = "List of all SSH key fingerprints created."
  value       = [for key in digitalocean_ssh_key.key : key.fingerprint]
}

output "user_ssh_key_fingerprints" {
  description = "Map of GitHub usernames to a list of their SSH key fingerprints."
  value = {
    for user in var.github_usernames :
    user => [
      for pair in flatten([
        for idx, key in data.github_user.user[user].ssh_keys : {
          key_name = "github-${user}-${idx}"
          value    = key
        }
      ]) :
      digitalocean_ssh_key.key[pair.key_name].fingerprint
    ]
  }
}
