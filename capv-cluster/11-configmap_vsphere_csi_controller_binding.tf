resource "kubernetes_manifest" "configmap_vsphere_csi_controller_binding" {
  provider = kubernetes-alpha
  manifest = {
    "apiVersion" = "v1"
    "data" = {
      "data" = "apiVersion: rbac.authorization.k8s.io/v1\nkind: ClusterRoleBinding\nmetadata:\n  name: vsphere-csi-controller-binding\nroleRef:\n  apiGroup: rbac.authorization.k8s.io\n  kind: ClusterRole\n  name: vsphere-csi-controller-role\nsubjects:\n- kind: ServiceAccount\n  name: vsphere-csi-controller\n  namespace: kube-system\n"
    }
    "kind" = "ConfigMap"
    "metadata" = {
      "name" = "vsphere-csi-controller-binding"
      "namespace" = var.namespace
    }
  }
}
