resource "kubernetes_manifest" "secret_vsphere_csi_controller" {
  provider = kubernetes-alpha
  manifest = {
    "apiVersion" = "v1"
    "kind" = "Secret"
    "metadata" = {
      "name" = "vsphere-csi-controller"
      "namespace" = var.namespace
    }
    "stringData" = {
      "data" = "apiVersion: v1\nkind: ServiceAccount\nmetadata:\n  name: vsphere-csi-controller\n  namespace: kube-system\n"
    }
    "type" = "addons.cluster.x-k8s.io/resource-set"
  }
}
