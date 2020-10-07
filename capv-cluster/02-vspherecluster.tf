resource "kubernetes_manifest" "vspherecluster" {
  provider = kubernetes-alpha
  manifest = {
    "apiVersion" = "infrastructure.cluster.x-k8s.io/v1alpha3"
    "kind" = "VSphereCluster"
    "metadata" = {
      "name" = var.cluster_name
      "namespace" = var.namespace
    }
    "spec" = {
      "cloudProviderConfiguration" = {
        "global" = {
          "insecure" = var.insecure
          "secretName" = "cloud-provider-vsphere-credentials"
          "secretNamespace" = "kube-system"
        }
        "network" = {
          "name" = var.node_pg_name
        }
        "providerConfig" = {
          "cloud" = {
            "controllerImage" = "gcr.io/cloud-provider-vsphere/cpi/release/manager:v1.2.0"
          }
        }
        "virtualCenter" = {
          (var.vcenter) = {
            "datacenters" = var.vc_datacenter
          }
        }
        "workspace" = {
          "datacenter" = var.vc_datacenter
          "datastore" = var.vc_datastore
          "folder" = var.vc_vm_folder
          "resourcePool" = var.vc_resource_pool_path
          "server" = var.vcenter
        }
      }
      "controlPlaneEndpoint" = {
        "host" = var.k8s_api_ip_address
        "port" = var.k8s_api_port
      }
      "server" = var.vcenter
    }
  }
}
