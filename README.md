## TITLE: 

Blue/Green deployment using Terraform via AWS

## PURPOSE:

Blue-green deployments and rolling deployments (canary tests) allow you to release new software gradually, and identify and mitigate the potential blast radius of a failed software release. This allows you to release new software with near-zero downtime.

## PREREQUISITES

* Linux
* Terraform 0.14+
* AWS account
* Configured AWS CLI

## HOW TO USE VARIABLES

File _vars.tf_ contains variables, used as an option to apply deployment:

**blue** means that all deployment will be made on blue instance
**blue-90** means that 90% of traffic will go to blue instance and 10% to green
**split** means that traffic will be distributed 50/50 between blue and green instances
**green-90** means that 90% of traffic will go to green instance and 10% to blue
**green** means that all deployment will be made on green instance

