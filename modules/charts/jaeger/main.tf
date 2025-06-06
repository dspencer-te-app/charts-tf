resource "helm_release" "jaeger" {
    repository = "https://jaegertracing.github.io/helm-charts"
    name = "jaegertracing"
    chart = "jaeger"
    values = [
      file("${path.module}/values.yml")
    ]
}
