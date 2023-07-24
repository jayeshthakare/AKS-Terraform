aks_vnet_name = "aksvnet"

sshkvsecret = "akssshpubdkkey"

clientidkvsecret = "spn-id"

spnkvsecret = "spn-dksecret"

vnetcidr = ["10.0.0.0/24"]

subnetcidr = ["10.0.0.0/25"]

keyvault_rg = "aksdkkvRG"

keyvault_name = "aksclusterdk-kv"

azure_region = "australiaeast"

resource_group = "aksdemocluster-rg"

cluster_name = "aksdemocluster"

dns_name = "aksdemocluster"

admin_username = "aksuser"

kubernetes_version = "1.21.7"

agent_pools = {
      name            = "pool1"
      count           = 2
      vm_size         = "Standard_D2_v2"
      os_disk_size_gb = "30"
    }
