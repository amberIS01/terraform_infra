module "vpc1" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "5.16.0"

  providers = {
    aws = aws.region1
  }

  name = "vpc-region1"

  cidr = "10.10.0.0/16"
  azs  = slice(data.aws_availability_zones.region1.names, 0, 2)

  public_subnets  = ["10.10.0.0/24", "10.10.3.0/24"]
  private_subnets = ["10.10.1.0/24", "10.10.4.0/24", "10.10.2.0/24", "10.10.5.0/24"]

  public_subnet_tags = {
    Name = "public-subnet"
  }

  private_subnet_tags = {
    for idx, subnet in var.vpc_config["region1"].private_subnets :
    subnet => idx < 2 ? "web" : "app"

  }

  enable_nat_gateway     = true
  single_nat_gateway     = false
  one_nat_gateway_per_az = true
  enable_dns_hostnames   = true

  create_igw = true

}

module "vpc2" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "5.16.0"

  name = "vpc-region2"

  providers = {
    aws = aws.region2
  }

  cidr = "10.20.0.0/16"
  azs  = slice(data.aws_availability_zones.region2.names, 0, 2)

  public_subnets  = ["10.20.0.0/24", "10.20.3.0/24"]
  private_subnets = ["10.20.1.0/24", "10.20.4.0/24", "10.20.2.0/24", "10.20.5.0/24"]

  public_subnet_tags = {
    Name = "public-subnet"
  }

  private_subnet_tags = {
    for idx, subnet in var.vpc_config["region2"].private_subnets :
    subnet => idx < 2 ? "web" : "app"

  }
  enable_nat_gateway     = true
  single_nat_gateway     = false
  one_nat_gateway_per_az = true
  enable_dns_hostnames   = true

  create_igw = true

}
