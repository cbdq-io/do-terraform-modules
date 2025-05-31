/**
 * Import SSH Public keys from GitHub for specified users into DO.
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
