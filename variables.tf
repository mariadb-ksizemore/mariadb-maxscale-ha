#### Before editing this file, be sure to read the AWS documentation on:
####
####  * VPCs
####  * Programmatic Access
####
#### Grab your enterprise token from the MariaDB website (https://customers.mariadb.com/downloads/token/).

#### EDIT THESE ITEMS
#### DATABASE CREDENTIALS

variable "admin_user" {
  type    = string
  default = "admin"
}

variable "admin_pass" {
  type    = string
  default = "AdM1n8ss-7ddh8"
}

variable "maxscale_user" {
  type    = string
  default = "maxscale"
}

variable "maxscale_pass" {
  type    = string
  default = "MaX$c@leP@ssw0rd"
}

variable "repli_user" {
  type    = string
  default = "repli"
}

variable "repli_pass" {
  type    = string
  default = "R3pl1cA-P@ssw0rd"
}

#### DO NOT EDIT BELOW THIS POINT UNLESS YOU ARE FAMILIAR WITH THESE PARAMETERS

variable "mariadb_version" {
  type    = string
  default = "10.6"
}

variable "maxscale_version" {
  type    = string
  default = "22.08"
}

variable "reboot" {
  type    = bool
  default = true
}

variable "aws_ami" {
  type    = string
  default = "ami-0e3654b38a33c9ca5"
}

variable "aws_mariadb_instance_size" {
  type    = string
  default = "t3.small"
}

variable "aws_maxscale_instance_size" {
  type    = string
  default = "t3.small"
}

variable "mariadb_enterprise_token" {
  type    = string
}

variable "aws_access_key" {
  type    = string
}

variable "aws_secret_key" {
  type    = string
}

variable "aws_session_token" {
  type    = string
}

variable "key_pair_name" {
  type    = string
}

variable "ssh_key_file" {
  type    = string
}

variable "aws_vpc" {
  type    = string
}

variable "aws_subnet" {
  type    = string
}

variable "aws_region" {
  type    = string
}

variable "aws_zone" {
  type    = string
}
