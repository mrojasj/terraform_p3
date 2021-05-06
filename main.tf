#Terraform provider definition
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
  region = "us-east-1"
}

# Variables

variable "vpc_cidr_block" {
  type = string
}

variable "snet_pub01_cidr_block" {
  type = string
}

variable "snet_pub02_cidr_block" {
  type = string
}

variable "snet_pri01_cidr_block" {
  type = string
}

variable "snet_pri02_cidr_block" {
  type = string
}

# Resources

resource "aws_vpc" "main" {
  cidr_block = var.vpc_cidr_block
  tags = {
	  Name = "vpc-tf"
  }
}

resource "aws_subnet" "pub01" {
  vpc_id     = aws_vpc.main.id
  cidr_block = var.snet_pub01_cidr_block
  availability_zone = "us-east-1a"
  tags = {
	  Name = "snet-tf-pub-01"
  }
}

resource "aws_subnet" "pub02" {
  vpc_id     = aws_vpc.main.id
  cidr_block = var.snet_pub02_cidr_block
  availability_zone = "us-east-1b"
  tags = {
	  Name = "snet-tf-pub-02"
  }
}

resource "aws_subnet" "pri01" {
  vpc_id     = aws_vpc.main.id
  cidr_block = var.snet_pri01_cidr_block
  availability_zone = "us-east-1a"
  tags = {
	  Name = "snet-tf-pri-01"
  }
}

resource "aws_subnet" "pri02" {
  vpc_id     = aws_vpc.main.id
  cidr_block = var.snet_pri02_cidr_block
  availability_zone = "us-east-1b"
  tags = {
	  Name = "snet-tf-pri-02"
  }
}

