resource "kubernetes_manifest" "configmap_vsphere_csi_controller_role" {
  provider = kubernetes-alpha
  manifest = {
    "apiVersion" = "v1"
    "data" = {
      "data" = "apiVersion: rbac.authorization.k8s.io/v1\nkind: ClusterRole\nmetadata:\n  name: vsphere-csi-controller-role\nrules:\n- apiGroups:\n  - storage.k8s.io\n  resources:\n  - csidrivers\n  verbs:\n  - create\n  - delete\n- apiGroups:\n  - \"\"\n  resources:\n  - nodes\n  - pods\n  - secrets\n  verbs:\n  - get\n  - list\n  - watch\n- apiGroups:\n  - \"\"\n  resources:\n  - persistentvolumes\n  verbs:\n  - get\n  - list\n  - watch\n  - update\n  - create\n  - delete\n  - patch\n- apiGroups:\n  - storage.k8s.io\n  resources:\n  - volumeattachments\n  verbs:\n  - get\n  - list\n  - watch\n  - update\n  - patch\n- apiGroups:\n  - \"\"\n  resources:\n  - persistentvolumeclaims\n  verbs:\n  - get\n  - list\n  - watch\n  - update\n- apiGroups:\n  - storage.k8s.io\n  resources:\n  - storageclasses\n  - csinodes\n  verbs:\n  - get\n  - list\n  - watch\n- apiGroups:\n  - \"\"\n  resources:\n  - events\n  verbs:\n  - list\n  - watch\n  - create\n  - update\n  - patch\n- apiGroups:\n  - coordination.k8s.io\n  resources:\n  - leases\n  verbs:\n  - get\n  - watch\n  - list\n  - delete\n  - update\n  - create\n- apiGroups:\n  - snapshot.storage.k8s.io\n  resources:\n  - volumesnapshots\n  verbs:\n  - get\n  - list\n- apiGroups:\n  - snapshot.storage.k8s.io\n  resources:\n  - volumesnapshotcontents\n  verbs:\n  - get\n  - list\n"
    }
    "kind" = "ConfigMap"
    "metadata" = {
      "name" = "vsphere-csi-controller-role"
      "namespace" = var.namespace
    }
  }
}
