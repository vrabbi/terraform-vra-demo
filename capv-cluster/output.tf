data "kubernetes_secret" "kubeconfig" {
  depends_on = [
    kubernetes_manifest.cluster
  ]
  metadata {
    name = "${var.cluster_name}-kubeconfig"
    namespace = var.namespace
  }
}
output "kubeconfig" {
  value = data.kubernetes_secret.kubeconfig.data.value
}
