resource "helm_release" "aqua" {
  name = "aqua"
  repository = "https://aquasecurity.github.io/helm-charts/"
  chart = "trivy-operator"
  namespace = "trivy-system"
  create_namespace = true
  set = []
  values = [
    "trivy.ignoreUnfixed: true"
  ]
}
