## terraform ya some ubuntu on vsphere

The anti-pattern of machining new vm(s) on vSphere but good for cheap thrills.

1. Craft a ubuntu 18.04 vm-template and save it in vSphere
1. Customize the vm variables, network, cpu, memory, disk
1. terraform init
1. terraform apply
