variable "ami" {
 type = string 
}

variable "instance_type" {
 type = string 
}


variable "common_tags" {
  type = map(string)
}

# For count loop
# variable "bucket_name" {
#   type = list(string)
# }

# For "foe_each" loop

variable "bucket_name" {
  type = map(object({
    name = string
  }))
}
