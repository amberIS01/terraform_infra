data "aws_availability_zones" "region1" {
  provider = aws.region1
}

data "aws_availability_zones" "region2" {
  provider = aws.region2
}

data "aws_subnets" "subnets_for_elb_r1" {
  provider = aws.region1
  filter {
    name   = "tag:Name"
    values = ["web"]
  }
  filter {
    name   = "vpc-id"
    values = [module.vpc1.vpc_id]
  }
}

data "aws_instances" "instances_in_subnets_r1" {
  provider = aws.region1
  filter {
    name   = "subnet-id"
    values = data.aws_subnets.subnets_for_elb_r1.ids
  }
}

data "aws_subnets" "subnets_for_elb_r2" {
  provider = aws.region2
  filter {
    name   = "tag:Name"
    values = ["web"]
  }
  filter {
    name   = "vpc-id"
    values = [module.vpc2.vpc_id]
  }
}

data "aws_instances" "instances_in_subnets_r2" {
  provider = aws.region2
  filter {
    name   = "subnet-id"
    values = data.aws_subnets.subnets_for_elb_r2.ids
  }
}