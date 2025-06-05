module "opensearch" {
  source = "./modules/charts/opensearch"
}

module "opensearch-dashboard" {
  source = "./modules/charts/opensearch-dashboard"
}

module "fluent" {
  source = "./modules/charts/fluent"
}
