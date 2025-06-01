data "github_user" "user" {
  for_each = toset(var.github_usernames)
  username = each.key
}
