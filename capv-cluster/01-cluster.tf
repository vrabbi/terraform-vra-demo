resource "kubernetes_manifest" "cluster" {
  provider = kubernetes-alpha
  manifest = {
    "apiVersion" = "cluster.x-k8s.io/v1alpha3"
    "kind" = "Cluster"
    "metadata" = {
      "labels" = {
        "cluster.x-k8s.io/cluster-name" = var.cluster_name
      }
      "name" = var.cluster_name
      "namespace" = var.namespace
    }
    "spec" = {
      "clusterNetwork" = {
        "pods" = {
          "cidrBlocks" = var.pod_cidrs
        }
      }
      "controlPlaneRef" = {
        "apiVersion" = "controlplane.cluster.x-k8s.io/v1alpha3"
        "kind" = "KubeadmControlPlane"
        "name" = var.cluster_name
      }
      "infrastructureRef" = {
        "apiVersion" = "infrastructure.cluster.x-k8s.io/v1alpha3"
        "kind" = "VSphereCluster"
        "name" = var.cluster_name
      }
    }
  }
  wait_for = {
    fields = {
      "status.conditions.0.status" = "True"
    }
  }
}
