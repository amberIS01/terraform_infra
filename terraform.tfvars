vpc_config = {
  region1 = {
    cidr            = "10.10.0.0/16"
    public_subnets  = ["10.10.0.0/24", "10.10.3.0/24"]
    private_subnets = ["10.10.1.0/24", "10.10.4.0/24", "10.10.2.0/24", "10.10.5.0/24"]
  }
  region2 = {
    cidr            = "10.20.0.0/16"
    public_subnets  = ["10.20.0.0/24", "10.20.3.0/24"]
    private_subnets = ["10.20.1.0/24", "10.20.4.0/24", "10.20.2.0/24", "10.20.5.0/24"]
  }
}

region1_ami = "ami-02a7ad1c45194c72f"

region2_ami = "ami-012967cc5a8c9f891"

inst_type = "t2.micro"

keypair = "project-key"

elb_name_r1 = "ELB-for-region-1"

elb_name_r2 = "ELB-for-region-2"


