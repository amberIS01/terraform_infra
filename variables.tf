variable "vpc_config" {
  type = map(object({
    cidr            = string
    public_subnets  = list(string)
    private_subnets = list(string)
  }))
  description = "Configuration for VPCs in different regions"
}

variable "region1_ami" {
  description = "AMI for region1"
  type        = string
}

variable "region2_ami" {
  description = "AMI for region2"
  type        = string
}

variable "inst_type" {
  type = string
}

variable "keypair" {
  type = string
}

variable "elb_name_r1" {
  type = string
}

variable "elb_name_r2" {
  type = string
}