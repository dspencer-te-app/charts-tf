resource "helm_release" "opensearch-dashboard" {
  name = "opensearch"
  chart = "opensearch-dashboards"
  namespace = "opensearch"
  repository = "https://opensearch-project.github.io/helm-charts/"
  values = [
    file("${path.module}/values.yml")
  ]
  force_update  = true
  wait          = false
  recreate_pods = false
  create_namespace = true
}
