## terraform ya some ubuntu on vsphere

The anti-pattern of machining new vm(s) on vSphere but good for cheap thrills.

1. Craft a ubuntu 18.04 vm-template and save it in vSphere.
2. Customize the vm variables, network, cpu, memory, disk by providing a `vsphere-vm.tfvars` file.

```bash
# vsphere-vm.tfvars (this is in .gitignore)
#==========================================
# vsphere configuration
#==========================================
vsphere_vcenter = "vcenter.mydomain.io"
vsphere_user = "administrator@vsphere.mydomain.io"
vsphere_password = "changeme"
vsphere_unverified_ssl = "true"
vsphere_datacenter = "my-dc"
vsphere_cluster = "my-cluster"
#==========================================
# vm template used to clone a new vm instance
#==========================================
vm_template = "my-vm-template"
#==========================================
# vm configuration
#==========================================
vm_name = "my-vm"
vm_cpu = "2"
vm_ram = "4096"
vm_disk0_datastore = "my-datastore"
vm_disk0_label = "my-disk"
vm_disk0_size = "16"
vm_network = "my-portgroup"
vm_netmask = "24"
vm_gateway = "192.168.100.1"
vm_dns = "192.168.100.56"
vm_ip = "192.168.100.2"
vm_domain = "my-domain.io"
vm_user = "my-user"
vm_password = "changeme"
```

3. `terraform init`
4. `terraform apply -var-file="vsphere-vm.tfvars"`

## References

1. [VMware vSphere Provider](https://registry.terraform.io/providers/hashicorp/vsphere/latest/docs)
