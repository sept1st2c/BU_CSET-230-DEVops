module "ec2" {
  source = "../../modules/ec2"
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

module "s3" {
  source = "../../modules/s3"
  bucket_name = "terrastates3back1"
  tags = merge(
    var.common_tags,
    {
      Name = "${local.env}-${local.app}-s3"
      resource_type = "storage"
    },
  )
}

module "eip" {
  source = "../../modules/eip"
  instance_id = module.ec2.instance_id
  tags = merge(
    var.common_tags,
    {
      Name = "${local.env}-${local.app}-eip"
      resource_type = "compute"
    },
  )
}