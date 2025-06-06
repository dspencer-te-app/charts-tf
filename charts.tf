module "aqua" {
  source = "./modules/charts/aqua"
}

module "opensearch" {
  source = "./modules/charts/opensearch"
}

module "prometheus" {
  source = "./modules/charts/prometheus"
}

module "jaeger" {
  source = "./modules/charts/jaeger"
}

module "dashboard" {
  source = "./modules/charts/grafana"
}

