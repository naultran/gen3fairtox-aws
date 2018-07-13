terraform {
  backend "s3" {
    encrypt = "true"
  }
}

provider "aws" {}


module "commons_vpc_es" {
  source          = "../modules/commons-vpc-es"
  vpc_id          = "${var.vpc_id}"
  vpc_octet2      = "${var.vpc_octet2}"
  vpc_octet3      = "${var.vpc_octet3}"
  vpc_name        = "${var.vpc_name}"
}

