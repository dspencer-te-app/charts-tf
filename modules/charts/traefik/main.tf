module "helm_release" {
  source = "cloudposse/helm-release/aws"
  name = "traefik"
  repository = var.repository
  chart = "traefik/traefik"
  chart_version = var.chart_version
  namespace = var.namespace
  count = var.enabled ? 1 : 0
  values = var.values 
  skip_crds = true
  set = var.set
}
