### example config

```hcl
module "vm" {
#=========BASE===========
source         = "https://github.com/ratelbee/openstack-instance.git"
instance_count = 3
index_start    = 1
image_id       = "17e24307-0823-4130-a88d-046da28ca98f"
#=======RESOURCES========
flavor       = "t1.micro"
storage_size = 20
#========NETWORK=========
net_name   = "your_deicideful_net"
#sec_groups = ["default"] #set a security groups
#=========HOST==========
fqdn      = "deicide.local"
time_zone = "Europe/Moscow"
district  = "dc1"
hostname  = "cluster"
#index_start = "4" #from where the indexing start
#custom_template = "./custom.tpl" #external template
#module_template = "alma" # templates builtin module
#=========USER CONFIGURATION==========
admin           = "glen"
ssh_keys        =  file(./id_rsa.pub")
ssh_private_key = "./id_rsa"
}
```
