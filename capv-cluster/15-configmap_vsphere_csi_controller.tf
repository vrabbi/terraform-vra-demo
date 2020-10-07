resource "kubernetes_manifest" "configmap_vsphere_csi_controller" {
  provider = kubernetes-alpha
  manifest = {
    "apiVersion" = "v1"
    "data" = {
      "data" = "apiVersion: apps/v1\nkind: Deployment\nmetadata:\n  name: vsphere-csi-controller\n  namespace: kube-system\nspec:\n  replicas: 1\n  selector:\n    matchLabels:\n      app: vsphere-csi-controller\n  strategy:\n    type: RollingUpdate\n  template:\n    metadata:\n      labels:\n        app: vsphere-csi-controller\n        role: vsphere-csi\n    spec:\n      containers:\n      - args:\n        - --v=4\n        - --timeout=300s\n        - --csi-address=$(ADDRESS)\n        - --leader-election\n        env:\n        - name: ADDRESS\n          value: /csi/csi.sock\n        image: quay.io/k8scsi/csi-attacher:v2.0.0\n        name: csi-attacher\n        resources: {}\n        volumeMounts:\n        - mountPath: /csi\n          name: socket-dir\n      - env:\n        - name: CSI_ENDPOINT\n          value: unix:///var/lib/csi/sockets/pluginproxy/csi.sock\n        - name: X_CSI_MODE\n          value: controller\n        - name: VSPHERE_CSI_CONFIG\n          value: /etc/cloud/csi-vsphere.conf\n        - name: LOGGER_LEVEL\n          value: PRODUCTION\n        - name: X_CSI_LOG_LEVEL\n          value: INFO\n        image: gcr.io/cloud-provider-vsphere/csi/release/driver:v2.0.0\n        lifecycle:\n          preStop:\n            exec:\n              command:\n              - /bin/sh\n              - -c\n              - rm -rf /var/lib/csi/sockets/pluginproxy/csi.vsphere.vmware.com\n        livenessProbe:\n          failureThreshold: 3\n          httpGet:\n            path: /healthz\n            port: healthz\n          initialDelaySeconds: 10\n          periodSeconds: 5\n          timeoutSeconds: 3\n        name: vsphere-csi-controller\n        ports:\n        - containerPort: 9808\n          name: healthz\n          protocol: TCP\n        resources: {}\n        volumeMounts:\n        - mountPath: /etc/cloud\n          name: vsphere-config-volume\n          readOnly: true\n        - mountPath: /var/lib/csi/sockets/pluginproxy/\n          name: socket-dir\n      - args:\n        - --csi-address=$(ADDRESS)\n        env:\n        - name: ADDRESS\n          value: /var/lib/csi/sockets/pluginproxy/csi.sock\n        image: quay.io/k8scsi/livenessprobe:v1.1.0\n        name: liveness-probe\n        resources: {}\n        volumeMounts:\n        - mountPath: /var/lib/csi/sockets/pluginproxy/\n          name: socket-dir\n      - args:\n        - --leader-election\n        env:\n        - name: X_CSI_FULL_SYNC_INTERVAL_MINUTES\n          value: \"30\"\n        - name: LOGGER_LEVEL\n          value: PRODUCTION\n        - name: VSPHERE_CSI_CONFIG\n          value: /etc/cloud/csi-vsphere.conf\n        image: gcr.io/cloud-provider-vsphere/csi/release/syncer:v2.0.0\n        name: vsphere-syncer\n        resources: {}\n        volumeMounts:\n        - mountPath: /etc/cloud\n          name: vsphere-config-volume\n          readOnly: true\n      - args:\n        - --v=4\n        - --timeout=300s\n        - --csi-address=$(ADDRESS)\n        - --feature-gates=Topology=true\n        - --strict-topology\n        - --enable-leader-election\n        - --leader-election-type=leases\n        env:\n        - name: ADDRESS\n          value: /csi/csi.sock\n        image: quay.io/k8scsi/csi-provisioner:v1.4.0\n        name: csi-provisioner\n        resources: {}\n        volumeMounts:\n        - mountPath: /csi\n          name: socket-dir\n      dnsPolicy: Default\n      serviceAccountName: vsphere-csi-controller\n      tolerations:\n      - effect: NoSchedule\n        key: node-role.kubernetes.io/master\n        operator: Exists\n      volumes:\n      - name: vsphere-config-volume\n        secret:\n          secretName: csi-vsphere-config\n      - hostPath:\n          path: /var/lib/csi/sockets/pluginproxy/csi.vsphere.vmware.com\n          type: DirectoryOrCreate\n        name: socket-dir\n"
    }
    "kind" = "ConfigMap"
    "metadata" = {
      "name" = "vsphere-csi-controller"
      "namespace" = var.namespace
    }
  }
}