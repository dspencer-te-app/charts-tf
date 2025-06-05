#resource "kubernetes_namespace" "monitoring" {
#  metadata {
#    name = "monitoring"
#    annotations = {}
#    labels = {}
#  }
#  lifecycle {
#    ignore_changes = []
#  }
#}


resource "helm_release" "opensearch" {
  chart = "opensearch"
  name = "opensearch"
  count = var.enabled ? 1 : 0

  #create_namespace = false
  #namespace = kubernetes_namespace.monitoring.metadata[0].name

  values = [
    file("${path.module}/opensearch-values.yml")
  ]

  repository = "https://opensearch-project.github.io/helm-charts/"
  force_update  = true
  wait          = true
  recreate_pods = true
}

#resource "helm_release" "opensearch-dashboards" {
#  chart = "opensearch-dashboards"
#  name = "opensearch"
#  #create_namespace = false
#  #namespace = kubernetes_namespace.monitoring.metadata[0].name
#  count = var.enabled ? 1 : 0
#  
#  values = [
#    file("${path.module}/dashboard-values.yml")
#  ]
#
#  repository = "https://opensearch-project.github.io/helm-charts/"
#  force_update  = true
#  wait          = true
#  recreate_pods = true
#}

resource "helm_release" "fluent-bit"  {
  name          = "fluent"
  chart         = "fluent-bit"
  #namespace = kubernetes_namespace.monitoring.metadata[0].name
  force_update  = true
  wait          = true
  recreate_pods = true

  repository = "https://fluent.github.io/helm-charts"

  set = []

  values = [
    file("${path.module}/fluent-values.yml")
  ]
}

resource "kubernetes_secret" "os_admin_credentials" {
  metadata {
    name = "os-admin-credentials"
    #    namespace = kubernetes_namespace.monitoring.metadata[0].name
     namespace = "default"
  }

  data = {
    password="SuperSecretR0d3nt"
    username="fluentprod"
  }

  type = "Opaque"
}
