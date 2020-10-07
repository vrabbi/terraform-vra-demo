resource "kubectl_manifest" "machinedeployment" {
  count = length(var.md_config)
  yaml_body = <<YAML
apiVersion: cluster.x-k8s.io/v1alpha3
kind: MachineDeployment
metadata:
  labels:
    cluster.x-k8s.io/cluster-name: ${var.cluster_name}
  name: ${var.cluster_name}-md-${count.index}
  namespace: ${var.namespace}
spec:
  clusterName: ${var.cluster_name}
  replicas: ${var.md_config[count.index].node_count}
  selector:
    matchLabels:
  strategy:
    rollingUpdate:
      maxSurge: 1
      maxUnavailable: 0
    type: RollingUpdate
  template:
    metadata:
      labels:
        cluster.x-k8s.io/cluster-name: ${var.cluster_name}
    spec:
      bootstrap:
        configRef:
          apiVersion: bootstrap.cluster.x-k8s.io/v1alpha3
          kind: KubeadmConfigTemplate
          name: ${var.cluster_name}-md-${count.index}
      clusterName: ${var.cluster_name}
      infrastructureRef:
        apiVersion: infrastructure.cluster.x-k8s.io/v1alpha3
        kind: VSphereMachineTemplate
        name: ${var.cluster_name}-md-${count.index}
      version: ${var.k8s_version}
YAML
}
