require 'chef/provisioning/aws_driver'

with_driver 'aws::eu-west-1'

aws_vpc "xyz-eolinfra" do
  cidr_block 			"10.100.0.0/16"
  internet_gateway 		true
  main_routes 			'0.0.0.0/0' => :internet_gateway
  enable_dns_hostnames 	true
  enable_dns_support	true
  aws_tags 				:chef_type ''
end

aws_subnet "xyz-eolinfra-front" do
  vpc "provisioning-vpc"
  cidr_block "10.100.0.0/24"
  availability_zone "eu-west-1a"
  map_public_ip_on_launch true
end

aws_subnet "xyz-eolinfra-middle" do
  vpc "provisioning-vpc"
  cidr_block "10.1000.1.0/24"
  availability_zone "eu-west-1a"
  map_public_ip_on_launch false
end

aws_subnet "xyz-eolinfra-back" do
  vpc "provisioning-vpc"
  cidr_block "10.100.2.0/24"
  availability_zone "eu-west-1a"
  map_public_ip_on_launch false
end

aws_security_group "xyz-eolinfra" do
  inbound_rules [
    {:port => 22, :protocol => :tcp, :sources => ["0.0.0.0/0"] },
    {:port => 3389, :protocol => :tcp, :sources => ["0.0.0.0/0"] },
	{:port => 5985, :protocol => :tcp, :sources => ["0.0.0.0/0"] },
	{:port => 5986, :protocol => :tcp, :sources => ["0.0.0.0/0"] }
  ]
  outbound_rules [
    {:port => 2223, :protocol => :tcp, :destinations => ["1.1.1.0/16"] },
    {:port => 8080, :protocol => :tcp, :destinations => ["2.2.2.0/24"] }
  ]
  vpc "provisioning-vpc"
end