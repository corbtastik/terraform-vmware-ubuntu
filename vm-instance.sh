#!/bin/bash
if [ -z "$1" ]
then
    echo "Please provide a VM name with no whitespace."
    echo "usage: ./vm-instance.sh my-vm"
    exit 1
else
    VM_NAME=$1
fi

VM_HOME=vm-instances/$VM_NAME
mkdir -p $VM_HOME
cp vsphere-vm.tf $VM_HOME/$VM_NAME.tf
cp vsphere-vm-vars.tf $VM_HOME/$VM_NAME-vars.tf
cp -R resources $VM_HOME/

TF_VARS_FILE="$VM_NAME.tfvars"
(cat <<EOF
#===============================================================================
# vsphere configuration
#===============================================================================
vsphere_vcenter = ""
vsphere_user = ""
vsphere_password = ""
vsphere_unverified_ssl = "true"
vsphere_datacenter = ""
vsphere_cluster = ""
#===============================================================================
# vm template used to clone a new vm instance
#===============================================================================
vm_template = ""
#===============================================================================
# vm configuration
#===============================================================================
vm_name = "$VM_NAME"
vm_cpu = "2"
vm_ram = "2048"
vm_disk0_datastore = ""
vm_disk0_label = ""
vm_disk0_size = "16"
vm_network = ""
vm_netmask = ""
vm_gateway = ""
vm_dns = ""
vm_ip = ""
vm_domain = ""
vm_user = ""
vm_password = ""
EOF
) > $VM_HOME/$TF_VARS_FILE

