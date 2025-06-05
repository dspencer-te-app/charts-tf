resource "helm_release" "fluent-bit"  {
  name          = "fluent"
  chart         = "fluent-bit"
  namespace     = var.namespace
  force_update  = true
  wait          = false
  recreate_pods = false
  create_namespace = true

  repository = "https://fluent.github.io/helm-charts"

  set = []

  values = [
    file("${path.module}/values.yml")
  ]
}
