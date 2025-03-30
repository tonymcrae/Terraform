terraform {
  required_providers {
    proxmox = {
      source  = "Telmate/proxmox"
      version = "~> 2.9.0"
    }
  }
}

provider "proxmox" {
  pm_api_url          = "https://10.1.50.250:8006/api2/json" # Replace with your Proxmox private IP
  pm_api_token_id     = "terry@pam!terrys_token"           # Replace with your API token ID
  pm_api_token_secret = ""              # Replace with your API token secret
  pm_tls_insecure     = true                                 # Allow self-signed certificates
}

resource "proxmox_vm_qemu" "TKA-PROX-terraform-test" {
  # Placeholder configuration for import
  name        = "TKA-PROX-terraform-test"
  vmid        = "101"
  target_node = "tka-prox-pve" # Replace with the name of your Proxmox node

  clone = "TKA-PROX-LX-MC"

  cores = 1
  sockets = 1
  memory = 1096

  disk {
    size = "60GB"
    type = "scsi"
    storage = "data2" # Replace with your storage name
  }

}