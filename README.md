# ☁️ VSCode Tunnel on Azure Container Instance
This repository contains sample code that allows you to use Visual Studio Code (VSCode) with Azure Container Instances. This can be useful if connectivity into VNETs is required. Feel free to fork and and customize!

## 🔧 Prerequisites 
* [Azure DevOps](https://azure.microsoft.com/en-us/services/devops/)  
* [Azure Container Instances](https://azure.microsoft.com/en-us/services/container-instances/) 
* [Visual Studio Code / vscode.net](http://vscode.dev) 

 ## 📦 Technology Used 
* [Azure Pipelines](https://azure.microsoft.com/en-us/services/devops/) - used for automated building and provisioning of infrastructure
* [CBL-Mariner](https://github.com/microsoft/CBL-Mariner) - used as a base image of the OCI image
* [VSCode Server](https://code.visualstudio.com/docs/remote/vscode-server) - VSCode server is used to spin up a remote tunnel allowing vscode.dev to connect to
* [Docker](https://www.docker.com) - used for building the OCI image

## 🤝 Pipelines 
1. build-code-dependencies pipeline - Builds and pushes the Docker image.
2. provision-container-instance pipeline - One pipeline run provisions a single container instance ment for a single vscode tunnel.

## 🔨 Installation & Usage 
To get started using this project, follow these steps:    
1. Import this repository into your Azure DevOps environment.
2. Add the prepared pipelines and prepare the variable group called `vscodeado`. The required variables are documented within the corresponding pipeline.  
3. Execute both pipelines using Azure Pipelines     
4. Use Visual Studio Code (vscode.dev) with your provisioned tunnel.
