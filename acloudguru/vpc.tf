# VPC

## VPC Router
AWS Reserved IP addresses (example subnet 10.0.64.0/21):
10.0.64.0 - Network address
10.0.64.1 - VPC Router address (default gateway)
10.0.64.2 - IP address of DNS server
10.0.64.3 - Reserved for future use
10.0.71.255 - Network broadcast address

## Security Groups vs. NACLs
- Security Groups are attached to an instance ENI, whereas NACLs are attached to each subnet.
- Security Groups are stateless, whereas NACLs are stateful.
- With Security Groups you only configure ALLOW rules, as they all have an implicit deny at the end of the rule base.
- With NACLs, you need to configure both inbound AND outbound traffic
- You can associate a NACL with multiple subnets
- By default, when you create a subnet if you do not attach it to a NACL it will automatically attach to the default NACL

## Nat Gateway vs. Internet Gateway
- Nat Gateways are for private instances with NO public IP address attached.
- Internet Gateways are for instanes with a public IP address attached to the instance.
- NAT Gateways replace the old NAT instance format of performing translations for the internet.
- NAT Gateways work by the private instance sending traffic to a NAT instance (which is placed within a public subnet), this NAT Gateway does the translation of private-to-public IP mapping.
- NAT Gateways are required in different AZ's for different subnets but are redundant within each AZ.
- You can have up to 5 NAT Gateways per subnet