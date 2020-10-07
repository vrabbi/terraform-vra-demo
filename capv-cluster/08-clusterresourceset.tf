resource "kubernetes_manifest" "clusterresourceset_0" {
  provider = kubernetes-alpha
  manifest = {
    "apiVersion" = "addons.cluster.x-k8s.io/v1alpha3"
    "kind" = "ClusterResourceSet"
    "metadata" = {
      "labels" = {
        "cluster.x-k8s.io/cluster-name" = var.cluster_name
      }
      "name" = "${var.cluster_name}-crs-0"
      "namespace" = var.namespace
    }
    "spec" = {
      "clusterSelector" = {
        "matchLabels" = {
          "cluster.x-k8s.io/cluster-name" = var.cluster_name
        }
      }
      "resources" = [
        {
          "kind" = "Secret"
          "name" = "vsphere-csi-controller"
        },
        {
          "kind" = "ConfigMap"
          "name" = "vsphere-csi-controller-role"
        },
        {
          "kind" = "ConfigMap"
          "name" = "vsphere-csi-controller-binding"
        },
        {
          "kind" = "Secret"
          "name" = "csi-vsphere-config"
        },
        {
          "kind" = "ConfigMap"
          "name" = "csi.vsphere.vmware.com"
        },
        {
          "kind" = "ConfigMap"
          "name" = "vsphere-csi-node"
        },
        {
          "kind" = "ConfigMap"
          "name" = "vsphere-csi-controller"
        },
      ]
    }
  }
}
