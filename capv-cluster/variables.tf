variable "cluster_name" {
  type = string
}
variable "namespace" {
  default = "default"
  type = string
}
variable "pod_cidrs" {
  type = list(string)
  default = ["192.168.0.0/16"]
}
variable "insecure" {
  default = true
  type = bool
}
variable "node_pg_name" {
  type = string
}
variable "vcenter" {
  type = string
}
variable "vc_datacenter" {
  type = string
}
variable "vc_datastore" {
  type = string
}
variable "vc_vm_folder" {
  type = string
}
variable "vc_resource_pool_path" {
  type = string
}
variable "k8s_api_ip_address" {
  type = string
}
variable "k8s_api_port" {
  type = number
  default = 6443
}
variable "clone_method" {
  type = string
  default = "linkedClone"
}
variable "vm_disk_size" {
  type = number
  default = 25
}
variable "vm_ram_mb" {
  type = number
  default = 8192
}
variable "vm_cpu_count" {
  type = number
  default = 2
}
variable "node_template_name" {
  type = string
  default = "centos-7-kube-v1.18.2+vmware.1"
}
variable "ssh_key" {
  type = string
}
variable "control_plane_vm_count" {
  type = number
  default = 3
}
variable "k8s_version" {
  type = string
  default = "v1.18.2"
}
variable "vc_username" {
  type = string
}
variable "vc_password" {
  type = string
}
variable "node_network_type" {
  type = string
}
variable "md_config" {
  type = list
  default = [
    { "node_count": 3 , "cpu_count": 4, "ram_mb": 8192, "disk_gb": 30 },
    { "node_count": 2, "cpu_count": 2, "ram_mb": 8192, "disk_gb": 25 },
  ]
}
