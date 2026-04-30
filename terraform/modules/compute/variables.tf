variable "name_prefix" {
  type = string
}

variable "student_name" {
  type = string
}

variable "instance_type" {
  type    = string
  default = "t2.micro"
}

variable "subnet_id" {
  type = string
}

variable "security_group_id" {
  type = string
}

variable "common_tags" {
  type = map(string)
}