#===============================================================================
# vsphere configuration
#===============================================================================
vsphere_vcenter = "vcenter.foo.io"
vsphere_user = "administrator@vsphere.foo.io"
vsphere_password = "changeme"
vsphere_unverified_ssl = "true"
vsphere_datacenter = "foodc"
vsphere_resource_pool = "foo-resource-pool"
#===============================================================================
# vm parameters
#===============================================================================
vm_template = "ubuntu1804"
vm_name = "vm-test"
vm_datastore = "fooDatastore"
vm_network = "foo-portgroup"
vm_netmask = "24"
vm_gateway = "192.168.100.1"
vm_dns = "192.168.100.3"
vm_ip = "192.168.100.21"
vm_domain = "foo.io"
vm_cpu = "8"
vm_ram = "4096"
vm_disk = "24"
