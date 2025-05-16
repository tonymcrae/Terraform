terraform {
  required_providers {
    proxmox = {
      source  = "bpg/proxmox"
      version = "~> 0.76.1"
    }
  }
}

provider "proxmox" {
  endpoint          = "https://10.1.50.250:8006/api2/json" # Replace with your Proxmox private IP
  api_token     = "terry@pam!xxxxxxxxxxxxx"           # Replace with your API token ID
  insecure     = true                                 # Allow self-signed certificates
}

resource "proxmox_virtual_environment_vm" "TKA-PROX-LX-MC" {
  # Placeholder configuration for import
  name        = "TKA-PROX-LX-MC"
  node_name   = "tka-prox-pve"
}