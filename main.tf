module "vpc" {
  source ="./modules/vpc"
  private_subnets = var.private_subnets
  public_subnets = var.public
}

module "security" {
  source = "./modules/security"
  vpc_id = module.vpc.vpc_id
}

module "dynamo_DB" {
source = "./modules/dynamoDB"

}

