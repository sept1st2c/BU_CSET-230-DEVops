variable "ami" {
 type = string 
}

variable "instance_type" {
 type = string 
}


variable "common_tags" {
  type = map(string)
}