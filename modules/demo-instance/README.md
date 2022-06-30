# Haplolabs Proxmox Terraform Demo

This repository contains some examples for using Terraform in my Proxmox environment. Therer are several assumptions made:

1. `PM_API_URL` is set in environment
2. `PM_API_TOKEN_ID` is set in environment
3. `PM_API_TOKEN_SECRET` is set in environment
4. Templates for the various OSs are setup under the names I have used
5. Currently using `cicustom` to point at existing snippets in my storage. I will be getting the templates in place to render on the fly and place in my snippets.

So far, I haven't had much trouble with getting the Proxmox Provider to work. I had to update some code from the examples in the Terraform Registry due to some things becoming deprecated, but it mostly worked without issue.

## Steps to use

1. Make sure you have [terraform](https://releases.hashicorp.com/terraform) installed
2. Set your environmental variables for Proxmox listed above. I am using pass to store them safely on a this deployment box. Main advice. Don't put into plaintext, especially in git!

```bash
export PM_API_TOKEN_ID=$(pass list proxmox/terraform-prov/full-tokenid)
export PM_API_TOKEN_SECRET=$(pass list proxmox/terraform-prov/api-token)
export PM_API_TOKEN_ID=$(pass list proxmox/terraform-prov/full-tokenid)
```

3. Make sure you have existing `cloud-init` files as listed in custom, or customize to suit
4. `terraform plan` and/or `terraform apply`

## Issues

One issue worth noting was that when running my first test using the cloud-init example in the provider, it was not using the `disk` block, so it was actually creating another disk at the size I specified, set it as the boot disk, but it was NOT the cloned disk from the template. I easily fixed that by putting in a `disk` block per the latest documentation:

```hcl
  disk {
    type    = "scsi"
    size    = "20G"
    storage = "backups"
    backup  = 1
  }
```
