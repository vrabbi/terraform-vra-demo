resource "kubernetes_manifest" "secret_csi_vsphere_config" {
  provider = kubernetes-alpha
  manifest = {
    "apiVersion" = "v1"
    "kind" = "Secret"
    "metadata" = {
      "name" = "csi-vsphere-config"
      "namespace" = var.namespace
    }
    "stringData" = {
      "data" = "apiVersion: v1\nkind: Secret\nmetadata:\n  name: csi-vsphere-config\n  namespace: kube-system\nstringData:\n  csi-vsphere.conf: |+\n    [Global]\n    insecure-flag = ${var.insecure}\n    cluster-id = \"default/${var.cluster_name}\"\n\n    [VirtualCenter \"${var.vcenter}\"]\n    user = \"${var.vc_username}\"\n    password = \"${var.vc_password}\"\n    datacenters = \"${var.vc_datacenter}\"\n\n    [Network]\n    public-network = \"${var.node_pg_name}\"\n\ntype: ${var.node_network_type}\n"
    }
    "type" = "addons.cluster.x-k8s.io/resource-set"
  }
}
