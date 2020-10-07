resource "kubernetes_manifest" "vspheremachinetemplate_md" {
  count = length(var.md_config)
  provider = kubernetes-alpha
  manifest = {
    "apiVersion" = "infrastructure.cluster.x-k8s.io/v1alpha3"
    "kind" = "VSphereMachineTemplate"
    "metadata" = {
      "name" = "${var.cluster_name}-md-${count.index}"
      "namespace" = var.namespace
    }
    "spec" = {
      "template" = {
        "spec" = {
          "cloneMode" = var.clone_method
          "datacenter" = var.vc_datacenter
          "datastore" = var.vc_datastore
          "diskGiB" = var.md_config[count.index].disk_gb
          "folder" = var.vc_vm_folder
          "memoryMiB" = var.md_config[count.index].ram_mb
          "network" = {
            "devices" = [
              {
                "dhcp4" = true
                "networkName" = var.node_pg_name
              },
            ]
          }
          "numCPUs" = var.md_config[count.index].cpu_count
          "resourcePool" = var.vc_resource_pool_path
          "server" = var.vcenter
          "template" = var.node_template_name
        }
      }
    }
  }
}
