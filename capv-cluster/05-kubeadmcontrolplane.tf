resource "kubectl_manifest" "kubeadmcontrolplane" {
yaml_body = <<YAML
apiVersion: controlplane.cluster.x-k8s.io/v1alpha3
kind: KubeadmControlPlane
metadata:
  name: ${var.cluster_name}
  namespace: ${var.namespace}
spec:
  infrastructureTemplate:
    apiVersion: infrastructure.cluster.x-k8s.io/v1alpha3
    kind: VSphereMachineTemplate
    name: ${var.cluster_name} 
  kubeadmConfigSpec:
    clusterConfiguration:
      apiServer:
        extraArgs:
          cloud-provider: external
      controllerManager:
        extraArgs:
          cloud-provider: external
    files:
    - content: |
        apiVersion: v1
        kind: Pod
        metadata:
          creationTimestamp: null
          name: kube-vip
          namespace: kube-system
        spec:
          containers:
          - args:
            - start
            env:
            - name: vip_arp
              value: "true"
            - name: vip_leaderelection
              value: "true"
            - name: vip_address
              value: ${var.k8s_api_ip_address}
            - name: vip_interface
              value: eth0
            image: plndr/kube-vip:0.1.7
            imagePullPolicy: IfNotPresent
            name: kube-vip
            resources: {}
            securityContext:
              capabilities:
                add:
                - NET_ADMIN
                - SYS_TIME
            volumeMounts:
            - mountPath: /etc/kubernetes/admin.conf
              name: kubeconfig
          hostNetwork: true
          volumes:
          - hostPath:
              path: /etc/kubernetes/admin.conf
              type: FileOrCreate
            name: kubeconfig
        status: {}
      owner: root:root
      path: /etc/kubernetes/manifests/kube-vip.yaml
    initConfiguration:
      nodeRegistration:
        criSocket: /var/run/containerd/containerd.sock
        kubeletExtraArgs:
          cloud-provider: external
        name: '{{ ds.meta_data.hostname }}'
    joinConfiguration:
      nodeRegistration:
        criSocket: /var/run/containerd/containerd.sock
        kubeletExtraArgs:
          cloud-provider: external
        name: '{{ ds.meta_data.hostname }}'
    preKubeadmCommands:
    - hostname "{{ ds.meta_data.hostname }}"
    - echo "::1         ipv6-localhost ipv6-loopback" >/etc/hosts
    - echo "127.0.0.1   localhost" >>/etc/hosts
    - echo "127.0.0.1   {{ ds.meta_data.hostname }}" >>/etc/hosts
    - echo "{{ ds.meta_data.hostname }}" >/etc/hostname
    postKubeadmCommands:
    - "kubectl apply --kubeconfig /etc/kubernetes/admin.conf -f https://docs.projectcalico.org/manifests/calico.yaml"
    useExperimentalRetryJoin: true
    users:
    - name: capv
      sshAuthorizedKeys:
      - ${var.ssh_key}
      sudo: ALL=(ALL) NOPASSWD:ALL
  replicas: ${var.control_plane_vm_count}
  version: ${var.k8s_version}
YAML
}
