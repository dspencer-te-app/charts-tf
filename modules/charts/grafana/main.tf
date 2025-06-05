resource "helm_release" "grafana" {
    repository = "https://grafana.github.io/helm-charts"
    name = "grafana"
    chart = "grafana"
    values = []
}
