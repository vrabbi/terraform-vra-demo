resource "kubernetes_manifest" "configmap_csi_vsphere_vmware_com" {
  provider = kubernetes-alpha
  manifest = {
    "apiVersion" = "v1"
    "data" = {
      "data" = "apiVersion: storage.k8s.io/v1\nkind: CSIDriver\nmetadata:\n  name: csi.vsphere.vmware.com\nspec:\n  attachRequired: true\n"
    }
    "kind" = "ConfigMap"
    "metadata" = {
      "name" = "csi.vsphere.vmware.com"
      "namespace" = var.namespace
    }
  }
}
