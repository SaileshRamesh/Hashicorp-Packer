# Automate image builds with Packer

This repository contains Packer templates for creating Amazon Machine Images (AMIs) with specific configurations. The repository is organized into two main folders:

ami-base-with-docker : Contains a Packer template to create a base AMI with Docker installed.
packer-asg-ami : Contains a Packer template to create an AMI tailored for Auto Scaling Groups (ASG).
Each folder includes:

A packer.json file: The Packer template defining the AMI build process.
A packer-vars.json file: A variables file where you can specify your AWS-specific configurations.

## Folder Structure
    ├── Hashicorp-packer
    ├── ami-base-with-docker/                   
    │   ├── docker.service          
    │   ├── packer-vars.json        
    │   └── packer.json    
    ├── ami-base-with-docker/                   
        ├── docker.service          
        ├── packer-vars.json        
        └── packer.json         


## Prerequisites

Prerequisites
Before using this repository, ensure you have the following prerequisites installed and configured:

Packer :
Install Packer from the [official website](https://www.packer.io/)

Verify the installation by running:
```
packer --version
```

## Usage Instructions

1. Clone the Repository
```
git clone https://github.com/your-username/hashicorp-ami-repository.git
cd hashicorp-ami-repository
```

## Configure Variables
Each folder contains a `packer-vars.json` file where you need to replace placeholder values `(xxxx)` with your actual AWS configurations.


## Validate the Packer Template

To validate the Packer template, navigate to the respective folder and run the following command:

```bash
  packer validate --var-file packer-vars.json packer.json
```

If the template is valid, you will see the message:

```
Template validated successfully.
```

## Build the AMI
To build the AMI, run the following command in the respective folder:
```
packer build --var-file packer-vars.json packer.json
```

### The build process will:

- Launch an EC2 instance.
- Execute the provisioning scripts defined in the Packer template.
Create the AMI.
- Once the process completes, the new AMI ID will be displayed in the output.

### Troubleshooting 
Validation Errors :

- Ensure all required variables are correctly defined in the `packer-vars.json` file.
- Check the syntax of the packer.json file for any formatting issues.

Build Failures :

- Verify that the `source_ami` ID is valid and available in your AWS region.
- Ensure your AWS credentials are properly configured using aws configure.

Debconf Warnings :

- If you encounter warnings like debconf: unable to initialize frontend, these are harmless and can be ignored. To suppress them, add the following line at the beginning of your provisioning scripts:
```
export DEBIAN_FRONTEND=noninteractive
```


## Support

For support, follow me on linkedIN https://www.linkedin.com/in/sailesh-ramesh-96991b13a/