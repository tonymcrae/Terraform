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
  pm_api_token_secret = "xxxxxxxxxxxxxxxxxxx"              # Replace with your API token secret
  pm_tls_insecure     = true                                 # Allow self-signed certificates
}

resource "proxmox_vm_qemu" "TKA-PROX-LX-MC" {
  # Placeholder configuration for import
  name        = "TKA-PROX-LX-MC"
  vmid        = "100"
  target_node = "tka-prox-pve" # Replace with the name of your Proxmox node

  cores = 2
  sockets = 2
  memory = 2048

  disk {
    size = "60GB"
    type = "scsi"
    storage = "data2" # Replace with your storage name
  }

  disk {
    size = "60GB"
    type = "scsi"
    storage = "data2" # Replace with your storage name
  }

  network_interface {
    model = "virtio"
    bridge = "vmbr0" # Replace with your bridge name
  }

}