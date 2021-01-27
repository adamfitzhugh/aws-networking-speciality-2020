variable database_subnets {
    description = "List of database subnets"
    type = List
    default = ["10.0.1.0/24", "10.0.3.0/24"]
}
variable web_server_subnets {
    description = "List of web server subnets"
    type = List
    default = ["10.0.2.0/24", "10.0.4.0/24"]
}