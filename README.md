# Archbit-test
This repository is for carrying out tests applied by Archbit

## Linux Proficiency

- To create a new partition, simply create a file with the .sh extension, copy and paste the script content.

- After that, run the command, bash nomeScript.sh, with this the new partition will be created.

## Terraform Proficiency

- This task is divided into two folders, Ec2 and S3.
</br>
- EC2 is configured for ssh access, and to connect to the machine we need to add the public key. To do this, I chose to expose variable attractions.
The VPC is also exposed by variables, we receive these values when applying the terraform apply command.
</br>
- S3, the infrastructure for creating this resource is simple, once the resource is created it is possible to send objects via AWS Cli
Run the command: **aws s3 cp file/path/file.txt s3://archbit-s3/**
Example: **aws s3 cp /home/joaopedro/Documentos/Archbit-test/terraform/s3/envio.txt s3://archbit-s3/**
</br>
- The code snippet that defines the credentials is set to default, in this case it must be changed to the credentials of those who will use it.
```terraform
  provider "aws" {
    profile = "profile name"
    region  = var.aws_region
}
```
</br>

## Docker Proficiency

- pull the docker image present in the repository

    - ***docker pull pedrobsouza/devops-jr-challenge:v1***
    - ***docker run -d -p 8080:80 pedrobsouza/devops-jr-challenge:v1***
    -  Exposed on ***localhost:8080***
</br>

## Ansible Proficiency

- This task is divided into two folders, redis and mongo.
Both have the main file where Ansible will read it to apply the playbook

- Change the hosts file to the hostname you want to use.
Use this pattern: 
***[http]
ec2-3-80-229-12.compute-1.amazonaws.com ansible_user=ubuntu***

- Apply the command: ***ansible-playbook -i hosts main.yaml***

## Test proficiencies
- There is an ec2 that is running available for ssh access, create a partition and perform simple tests on mongoDB and redis.