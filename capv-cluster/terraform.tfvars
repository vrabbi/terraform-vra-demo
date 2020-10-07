# VC Details
vc_username = "administrator@vsphere.local"
vc_password = ""
node_network_type = "Opaque"
insecure = true
node_pg_name = ""
vcenter = ""
vc_datacenter = ""
vc_datastore = ""
vc_vm_folder = ""
vc_resource_pool_path = ""

# MGMT Cluster Details
namespace = "default"

# Cluster Details
cluster_name = ""
k8s_version = "v1.18.2"
node_template_name = "centos-7-kube-v1.18.2+vmware.1"
clone_method = "linkedClone"
ssh_key = ""
k8s_api_ip_address = ""
k8s_api_port = 6443
pod_cidrs = ["192.168.0.0/16"]

# Control Plane Details
control_plane_vm_count = 3
vm_disk_size = 25
vm_ram_mb = 8192
vm_cpu_count = 2

# Worker Node Details
md_config = [
  { "node_count": 2 , "cpu_count": 8, "ram_mb": 16384, "disk_gb": 50 },
  { "node_count": 6, "cpu_count": 2, "ram_mb": 8192, "disk_gb": 25 },
]
