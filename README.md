# Flask Service with Terraform and Docker
This repo contains all the files to deploy a simple Flask service in a Docker image to an EC2 instance and spin everything up 

First install terraform, follow the steps in Hashicorp official website

https://learn.hashicorp.com/terraform/getting-started/install.html

Next you need to create a user with programmatic access for terraform and get the access keys. If you already have one that should be enough
Just make sure that this user has privileges to provision resources, such as Admin Access or to an specific set of AWS services that you want to use.

https://docs.aws.amazon.com/es_es/IAM/latest/UserGuide/id_users_create.html

First clone the repo

`git clone https://github.com/skypeter1/FlaskServiceTerraform.git`

Once your are setup with that, go to the root directory and set your AWS env vars.

`cd FlaskServiceTerraform`

`export AWS_ACCESS_KEY_ID=<your-aws-access-key>`

`export AWS_SECRET_ACCESS_KEY=<your-aws-secret-access-key>`

`export AWS_DEFAULT_REGION=us-east-1`

Init Terraform

`terraform init`

To define and check the infrastructure to be created. 

`terraform plan -out <name-of-your-plan>`

To apply the changes described in the plan and proceed with the resource creation

`terraform apply <name-of-your-plan>`
