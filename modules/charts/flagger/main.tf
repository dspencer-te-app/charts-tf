resource "helm_release" "flagger" {
  name = "flagger"
  repository = var.repository
  chart = var.chart
  chart_version = var.chart_version
  namespace = var.namespace
  count = var.enabled ? 1 : 0
  values = var.values 
  skip_crds = var.skip_crds 
  set = var.set
}
