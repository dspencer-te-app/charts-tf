module "aqua" {
  source = "./modules/charts/aqua"
}

module "opensearch" {
  source = "./modules/charts/opensearch"
}

module "dashboard" {
  source = "./modules/charts/grafana"
}

