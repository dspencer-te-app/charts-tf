resource "helm_release" "opensearch" {
  chart = "opensearch"
  name = "opensearch"
  namespace = var.namespace
  count = var.enabled ? 1 : 0

  values = [
    file("${path.module}/values.yml")
  ]

  repository = "https://opensearch-project.github.io/helm-charts/"
  force_update  = true
  wait          = false
  recreate_pods = false
  create_namespace = true
}

