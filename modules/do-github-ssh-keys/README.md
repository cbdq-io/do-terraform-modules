<!-- BEGIN_TF_DOCS -->
Import SSH Public keys from GitHub for specified users into DO.

## Example Usage

```hcl
module "ssh_keys" {
  source = "git::https://github.com/cbdq-io/do-terraform-modules/modules/do-github-ssh-keys?ref=main"

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
```

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | ~> 1.9 |
| <a name="requirement_digitalocean"></a> [digitalocean](#requirement\_digitalocean) | ~> 2.0 |
| <a name="requirement_github"></a> [github](#requirement\_github) | ~> 6.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_digitalocean"></a> [digitalocean](#provider\_digitalocean) | ~> 2.0 |
| <a name="provider_github"></a> [github](#provider\_github) | ~> 6.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [digitalocean_ssh_key.key](https://registry.terraform.io/providers/digitalocean/digitalocean/latest/docs/resources/ssh_key) | resource |
| [github_user.user](https://registry.terraform.io/providers/integrations/github/latest/docs/data-sources/user) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_github_usernames"></a> [github\_usernames](#input\_github\_usernames) | A list of GitHub usernames to import their SSH keys for. | `list(string)` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_github_usernames"></a> [github\_usernames](#output\_github\_usernames) | The list of GitHub usernames provided. |
| <a name="output_ssh_keys"></a> [ssh\_keys](#output\_ssh\_keys) | List of all SSH key fingerprints created. |
<!-- END_TF_DOCS -->