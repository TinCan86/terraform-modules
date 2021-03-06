%{ if cloud_provider == "azure" }
configuration:
  provider: "azure"
  logLevel: "warning"
  logFormat: "json"
  backupStorageLocation:
    name: "default"
    bucket: "${azure_storage_account_container}"
    config:
      resourceGroup: "${azure_resource_group}"
      storageAccount: "${azure_storage_account_name}"

snapshotsEnable: false

credentials:
  existingSecret: "velero"

initContainers:
  - name: "velero-plugin-for-microsoft-azure"
    image: "velero/velero-plugin-for-microsoft-azure:v1.1.1"
    volumeMounts:
      - mountPath: "/target"
        name: "plugins"

podLabels:
  aadpodidbinding: velero
%{ endif }
