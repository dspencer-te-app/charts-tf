resource "helm_release" "prometheus" {
  name = "prometheus-community"
  repository = "https://prometheus-community.github.io/helm-charts"
  chart = "prometheus"
  namespace = var.namespace
  create_namespace = false
  set = []
  values = [
    file("${path.module}/values.yml")
  ]
}
