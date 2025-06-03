# do-terraform-modules
Terraform modules for DigitalOcean

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | ~> 1.9 |

## Providers

No providers.

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_hub"></a> [hub](#module\_hub) | ./modules/do-hub | n/a |
| <a name="module_ssh_keys"></a> [ssh\_keys](#module\_ssh\_keys) | ./modules/do-github-ssh-keys | n/a |

## Resources

No resources.

## Inputs

No inputs.

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_ssh_keys"></a> [ssh\_keys](#output\_ssh\_keys) | List of all SSH key fingerprints created. |
| <a name="output_user_ssh_key_fingerprints"></a> [user\_ssh\_key\_fingerprints](#output\_user\_ssh\_key\_fingerprints) | Map of GitHub usernames to a list of their SSH key fingerprints. |
<!-- END_TF_DOCS -->