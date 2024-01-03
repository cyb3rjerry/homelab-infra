# homelab-infra
My homelab's proxmox infrastructure

## How-to
To add a VM, simply define it as a module and import it into `active_vms.tf`. If it's depending on a template, make sure to define it into the b`base_infra` folder and define it's outputs correctly.
