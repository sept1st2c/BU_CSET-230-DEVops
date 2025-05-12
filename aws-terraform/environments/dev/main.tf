module "ec2" {
  source = "../../modules/ec2"
  count = 5
  instance_ami = var.ami
  instance_type = var.instance_type
  tags = merge(
    var.common_tags,
    {
      Name = "${local.env}-${local.app}-ec2" 
      resource_type = "compute"
    },
  )
}

# Count Loop
# module "s3" {
#   source = "../../modules/s3"
#   count = length(var.bucket_name)
#   bucket_name = var.bucket_name[count.index]
#   tags = merge(
#     var.common_tags,
#     {
#       Name = "${local.env}-${local.app}-s3"
#       resource_type = "storage"
#     },
#   )
# }

# For Each loop
module "s3" {
  source = "../../modules/s3"
  for_each = var.bucket_name
  bucket_name = each.value.name
  tags = merge(
    var.common_tags,
    {
      Name = "${local.env}-${local.app}-s3"
      resource_type = "storage"
    },
  )
}

# module "eip" {
#   source = "../../modules/eip"
#   instance_id = module.ec2.instance_id
#   tags = merge(
#     var.common_tags,
#     {
#       Name = "${local.env}-${local.app}-eip"
#       resource_type = "compute"
#     },
#   )
# }