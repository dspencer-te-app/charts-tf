
module "helm_release" {
  source = "cloudposse/helm-release/aws"
  name = var.name
  repository = "https://charts.karpenter.sh/"
  chart = "karpenter"
  chart_version = var.chart_version
  namespace = var.namespace
  count = var.enabled ? 1 : 0
  values = var.values
  skip_crds = var.skip_crds
  set = [
    "serviceAccount\\.annotations\\.eks\\.amazonaws\\.com/role-arn=${var.karpenter_iam_role_arn}",
    "clusterName=${var.cluster_name}",
    "clusterEndpoint=${var.cluster_endpoint}",
    "aws.defaultInstanceProfile=KarpenterNodeInstanceProfile-${var.cluster_name}"
  ]
}
