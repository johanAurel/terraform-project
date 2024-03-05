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

module "instance" {
  source = "./modules/instaces"
  security_group_ids = module.security.security_group_ids
  subnet_id = module.vpc.public_subnet_id

}

