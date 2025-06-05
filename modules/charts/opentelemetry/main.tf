module "helm_release" {
  source = "cloudposse/helm-release/aws"
  name = "opentelemetry"
  repository = var.repository
  chart = var.chart
  chart_version = var.chart_version
  namespace = var.namespace
  count = var.enabled ? 1 : 0
  values = var.values 
  skip_crds = var.skip_crds 
  set = var.set
}
