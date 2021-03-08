variable "vsphere_vcenter" {
  description = "vCenter server FQDN or IP"
}

variable "vsphere_user" {
  description = "vSphere user name"
}

variable "vsphere_password" {
  description = "vSphere password"
}

variable "vsphere_unverified_ssl" {
  description = "Is the vCenter using a self signed certificate (true/false)"
  default = "true"
}

variable "vsphere_datacenter" {
  description = "vSphere datacenter"
}

variable "vsphere_cluster" {
  description = "vSphere cluster"
}

variable "vm_template" {
  description = "Template used to create the vSphere virtual machines"
  default = "vm-template"
}

variable "vm_disk0_datastore" {
  description = "Datastore used for the vSphere virtual machines root disk"
}

variable "vm_disk0_size" {
  description = "Size of root disk attached to virtual machine"
  default = "20"
}

variable "vm_disk0_label" {
  description = "Label of root disk attached to virtual machine"
  default = "disk0"
}

variable "vm_network" {
  description = "Network used for the vSphere virtual machines"
}

variable "vm_ip" {
  description = "Ip used for the vSphere virtual machine"
}

variable "vm_netmask" {
  description = "Netmask used for the vSphere virtual machine (example: 24)"
}

variable "vm_gateway" {
  description = "Gateway for the vSphere virtual machine"
}

variable "vm_dns" {
  description = "DNS for the vSphere virtual machine"
}

variable "vm_domain" {
  description = "Domain for the vSphere virtual machine"
}

variable "vm_cpu" {
  description = "Number of vCPU for the vSphere virtual machines"
  default = "2"
}

variable "vm_ram" {
  description = "Amount of RAM for the vSphere virtual machines (example: 2048)"
  default = "2048"
}

variable "vm_name" {
  description = "The name of the vSphere virtual machines and the hostname of the machine"
  default = "vm-test"
}

variable "vm_user" {
  description = "User on vm"
}

variable "vm_password" {
  description = "Password for vm_user"
}
