# aws-infrastructure

Created code for a small AWS environment consisting of following usin terraform:

A VPC with at least one Private and one Public subnet

Two VMs, one in the Private subnet, one in the Public subnet

Restrict access to the VM in the Public subnet to a single IP address

Restrict access to the VM in the Private subnet to only from the VM in the Public subnet

Both VMs should be able to reach the internet (either directly or indirectly)

VMs can be Windows or Linux

The resources must be codified such that we will be able to use opentofu to build
