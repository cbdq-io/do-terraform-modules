/**
 * Import SSH Public keys from GitHub for specified users into DO.
 *
 * ## Example Usage
 *
 * ```hcl
 * module "ssh_keys" {
 *   source = "git::https://github.com/cbdq-io/do-terraform-modules/modules/do-github-ssh-keys?ref=main"
 *
 *   github_usernames = [
 *     "cbdqbot",
 *     "dallinb",
 *     "dallinv",
 *     "jaloughlin"
 *   ]
 * }
 *
 * output "ssh_keys" {
 *   description = "List of all SSH key fingerprints created."
 *   value       = module.ssh_keys.ssh_keys
 * }
 * ```
 */

locals {
  flat_ssh_key_map = {
    for pair in flatten([
      for user in var.github_usernames : [
        for idx, key in data.github_user.user[user].ssh_keys :
        {
          key   = "github-${user}-${idx}"
          value = key
        }
      ]
    ]) : pair.key => pair.value
  }
}

resource "digitalocean_ssh_key" "key" {
  for_each   = local.flat_ssh_key_map
  name       = each.key
  public_key = each.value
}
