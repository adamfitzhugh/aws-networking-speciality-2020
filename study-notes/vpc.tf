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
- Security groups can span AZ's but NOT VPC's


## Nat Gateway vs. Internet Gateway
- Nat Gateways are for private instances with NO public IP address attached.
- Internet Gateways are for instanes with a public IP address attached to the instance.
- NAT Gateways replace the old NAT instance format of performing translations for the internet.
- NAT Gateways work by the private instance sending traffic to a NAT instance (which is placed within a public subnet), this NAT Gateway does the translation of private-to-public IP mapping.
- NAT Gateways are required in different AZ's for different subnets but are redundant within each AZ.
- You can have up to 5 NAT Gateways per subnet.
- To make a public subnet public, you need to create a route in the subnet route table with a target as the Internet Gateway.


## VPC Endpoints
- 2 types: Interface Endpoints & Gateway Endpoints
- When configuring a VPC endpoint you'll need to specify the VPC it will reside in, what AWS resources it needs to access & a policy.
- When an private subnet endpoint route is added to the routing table the destination is given as a prefix-list ID, followed by the resource being accessed & a target of the VPC endpoint ID. For example, destination = pl-id s3 with a target = vpce-xyz
- Instances within public subnets typically access VPC endpoint services via it's public IP address and over the internet gateway
- Endpoints are a regional service i.e. you cannot access an endpoint in a different regional
- Endpoints are not extendable across VPC boundaries. They cannot be accessed from outside a VPC or over VPC peering
- DNS resolution is required within the VPC. The actual destination endpoint in the routing table maps to a URL
- By default, the VPC endpoint is unrestricted but it can be locked down. VPC endpoint policies DO NOT OVERWRITE specific resource policies (such as policies attached to an S3 bucket)
- Use Security Groups with VPC endpoints as with security groups you can reference logical network objects such as the VPC endpoint ID
- You can have multiple VPC endpoints within the same VPC

### Gateway endpoints 
- Gateway that we specify as a target in our routing table
- S3 and DynamoDB are the only endpoints supported

### Interface Endpoints
- Setup as an ENI
- Powered by AWS PrivateLink

## VPC Peering
- You're unable to peer overlapping subnets together via VPC peering
- Once VPC peer has been configured, in each VPC route table you should have a route to each others subnet via the VPC peer ID in order for communication to be successful

## VPC Flow Logs
- Source/Destination IP's, port numbers, protocol, number of packets/bytes etc can be captured by VPC flow logs
- Flow logs are attached to ENI's, subnets or VPCs
- You can capture ingress and egress traffic and can be configured to log accepted, rejected or both
- Configurations are locked, i.e. you must delete the flow log configuration and recreate it if you want to edit it
- Flow logs are several minutes behind real time
- Flow logs are sent to Cloudwatch or S3
- Source/destination addresses within flow logs will always be the internal primary private IP address associated with the ENI
- Flow Logs do not capture
  - Traffic between VPC resources & AWS DNS
  - License activation such as from Windows instances in your VPC
  - Metadata from 169.254.169.254
  - Traffic to and from 169.254.169.123 (Amazon Time Sync Service)
  - Any communication between your VPC and DHCP servers as well as reserved IP's of the VPC router
  - Traffic between an ENI and Network Load Balancer Network Interface

## High Performance Computing
- Ways in which to beef up computing/networking performance for instances:
  - Changing your instance types to high performance instances - review instance types
  - Placement Groups (Cluster) - placing your instances together in a cluster (within the same AZ) to allow for better throughput
  - When Enhanced Networking is enabled in your AZ you can configure jumbo frames. Many instances support 9001 MTU or jumbo frames - use with caution as once traffic leaves the VPC it will be scaled back to 1500 MTU size