provider "vsphere" {
  vsphere_server       = var.vsphere_vcenter
  user                 = var.vsphere_user
  password             = var.vsphere_password
  allow_unverified_ssl = var.vsphere_unverified_ssl
}

data "vsphere_datacenter" "dc" {
  name = var.vsphere_datacenter
}

data "vsphere_compute_cluster" "compute_cluster" {
  name          = var.vsphere_cluster
  datacenter_id = data.vsphere_datacenter.dc.id
}

data "vsphere_virtual_machine" "template" {
  name          = var.vm_template
  datacenter_id = data.vsphere_datacenter.dc.id
}

data "vsphere_datastore" "vm_disk0_datastore" {
  name          = var.vm_disk0_datastore
  datacenter_id = data.vsphere_datacenter.dc.id
}

data "vsphere_network" "network" {
  name          = var.vm_network
  datacenter_id = data.vsphere_datacenter.dc.id
}

resource "vsphere_virtual_machine" "vm" {
  name                  = var.vm_name
  resource_pool_id      = data.vsphere_compute_cluster.compute_cluster.resource_pool_id
  datastore_id          = data.vsphere_datastore.vm_disk0_datastore.id
  num_cpus              = var.vm_cpu
  memory                = var.vm_ram
  guest_id              = data.vsphere_virtual_machine.template.guest_id
  scsi_type             = data.vsphere_virtual_machine.template.scsi_type
  scsi_controller_count = 1

  network_interface {
    network_id   = data.vsphere_network.network.id
    adapter_type = data.vsphere_virtual_machine.template.network_interface_types[0]
  }

  disk {
    label            = var.vm_disk0_label
    size             = var.vm_disk0_size
    eagerly_scrub    = false
    thin_provisioned = false 
    unit_number      = 0
    datastore_id     = data.vsphere_datastore.vm_disk0_datastore.id
  }

  clone {
    template_uuid = data.vsphere_virtual_machine.template.id

    customize {
      linux_options {
        host_name = var.vm_name
        domain    = var.vm_domain
      }

      network_interface {
        ipv4_address = var.vm_ip
        ipv4_netmask = var.vm_netmask
      }

      ipv4_gateway = var.vm_gateway
      dns_server_list = [var.vm_dns]
    }
  }

  connection {
    type = "ssh"
    user = var.vm_user
    password = var.vm_password
    host = var.vm_ip
  }

  provisioner "file" {
    source = "resources/bash_profile"
    destination = "/home/${var.vm_user}/.bash_profile"
  }
}
