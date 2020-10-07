resource "kubernetes_manifest" "kubeadmconfigtemplate_md" {
  provider = kubernetes-alpha
  count = length(var.md_config)
  manifest = {
    "apiVersion" = "bootstrap.cluster.x-k8s.io/v1alpha3"
    "kind" = "KubeadmConfigTemplate"
    "metadata" = {
      "name" = "${var.cluster_name}-md-${count.index}"
      "namespace" = var.namespace
    }
    "spec" = {
      "template" = {
        "spec" = {
          "joinConfiguration" = {
            "nodeRegistration" = {
              "criSocket" = "/var/run/containerd/containerd.sock"
              "kubeletExtraArgs" = {
                "cloud-provider" = "external"
              }
              "name" = "{{ ds.meta_data.hostname }}"
            }
          }
          "preKubeadmCommands" = [
            "hostname \"{{ ds.meta_data.hostname }}\"",
            "echo \"::1         ipv6-localhost ipv6-loopback\" >/etc/hosts",
            "echo \"127.0.0.1   localhost\" >>/etc/hosts",
            "echo \"127.0.0.1   {{ ds.meta_data.hostname }}\" >>/etc/hosts",
            "echo \"{{ ds.meta_data.hostname }}\" >/etc/hostname",
          ]
          "users" = [
            {
              "name" = "capv"
              "sshAuthorizedKeys" = [
                var.ssh_key,
              ]
              "sudo" = "ALL=(ALL) NOPASSWD:ALL"
            },
          ]
        }
      }
    }
  }
}
