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
  source = "./modules/instances"
  security_group_ids = module.security.security_group_ids
  subnet_id = module.vpc.public_subnet_id
  private_subnet = module.vpc.private_subnet_id[0]
  key_name = var.key_name
  instance_type = var.instance_type

}

module "load_balancer"{
    source = "./modules/load-balancer"
    vpc_id = module.vpc.vpc_id
    public_instance_id = module.instance.status_id
    private_instance_id = module.instance.auth_id
    public_subnets_id = module.vpc.public_subnet_id
    private_subnets_id = module.vpc.private_subnet_id
    security_groups = module.security.security_group_ids

}

module "ami" {
  source = "./modules/ami"
  lighting_id = module.instance.lighting_id
  heating_id = module.instance.heating_id
  status_id = module.instance.status_id
  auth_id = module.instance.auth_id
}

module "autoscaler" {
  source = "./modules/autoscaling"
  ami_id = module.ami.public_ami_id
  security_group_ids = module.security.security_group_ids
  private_ami_id = module.ami.auth_machine_id
  public_subnets_id = module.vpc.public_subnet_id
  private_subnets_id = module.vpc.private_subnet_id
}