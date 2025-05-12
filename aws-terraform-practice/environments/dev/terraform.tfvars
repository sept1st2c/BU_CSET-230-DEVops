ami = "ami-0866a3c8686eaeeba"
instance_type = "t3.micro"
# environment = "dev"

common_tags = {
    environment = "dev"
    app = "ais"
    costing = "IT"
    criticality = "low"
    department = "IT"
}

# Old Scenario

# bucket_name = ["terrastates3back2", "terrastates3back3", "terrastates3back4", "terrastates3back5",  "terrastates3back5"]
# bucket_name = [        " 0 ",              " 1 ",                " 2 ",                " 3 "     ]


# # New Scenario
# bucket_name = ["terrastates3back3", "terrastates3back4", "terrastates3back5"]
# bucket_name = [        " 0 ",              " 1 ",                " 2 ",     ]

bucket_name = {
  "bucket1" = {
    name = "terrastates3back2"
  }
  "bucket3" = {
    name = "terrastates3back4"
  }
  "bucket2" = {
    name = "terrastates3back3"
  }
}