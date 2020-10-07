resource "kubernetes_manifest" "vspheremachinetemplate" {
  provider = kubernetes-alpha
  manifest = {
    "apiVersion" = "infrastructure.cluster.x-k8s.io/v1alpha3"
    "kind" = "VSphereMachineTemplate"
    "metadata" = {
      "name" = var.cluster_name
      "namespace" = var.namespace
    }
    "spec" = {
      "template" = {
        "spec" = {
          "cloneMode" = var.clone_method
          "datacenter" = var.vc_datacenter
          "datastore" = var.vc_datastore
          "diskGiB" = var.vm_disk_size
          "folder" = var.vc_vm_folder
          "memoryMiB" = var.vm_ram_mb
          "network" = {
            "devices" = [
              {
                "dhcp4" = true
                "networkName" = var.node_pg_name
              },
            ]
          }
          "numCPUs" = var.vm_cpu_count
          "resourcePool" = var.vc_resource_pool_path
          "server" = var.vcenter
          "template" = var.node_template_name
        }
      }
    }
  }
}
