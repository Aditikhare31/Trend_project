🚀 React Application CI/CD Pipeline with Monitoring

This project demonstrates the complete deployment of a React application using a CI/CD pipeline along with monitoring and observability tools.

📌 Project Overview

The pipeline automates:
Building the application
Creating and pushing Docker images
Deploying the application on Kubernetes (EKS)
Monitoring system health and application performance

🛠️ Tools & Technologies Used

Jenkins
Docker & DockerHub
Kubernetes (EKS)
Terraform
Prometheus
Grafana
Node Exporter
GitHub
AWS EC2

📖 Step-by-Step Implementation
🔹 Step 1: Infrastructure Setup using Terraform

Created Terraform scripts (main.tf) to provision:
VPC
Security Groups
IAM User
EC2 Instance (with Jenkins installation via user data)
Terraform automatically provisions the required infrastructure.

EC2 Instance Created
![EC2 Instance](https://github.com/Aditikhare31/Trend_project/blob/main/trend_screenshots/ec2_instance.png)

Security Group
![EC2 Instance](https://github.com/Aditikhare31/Trend_project/blob/main/trend_screenshots/security_groups.png)

IAM User
![EC2 Instance](https://github.com/Aditikhare31/Trend_project/blob/main/trend_screenshots/IAM_user.png)

VPC
![EC2 Instance](https://github.com/Aditikhare31/Trend_project/blob/main/trend_screenshots/VPC.png)

Created an IAM Role and attached it to the EC2 instance for required permissions.
![EC2 Instance](https://github.com/Aditikhare31/Trend_project/blob/main/trend_screenshots/IAM_role.png)

🔹 Step 2: Docker Setup

Logged into the EC2 instance
Installed Docker
Created a Dockerfile for the React application
Built and tested the Docker image locally

🔹 Step 3: Kubernetes (EKS) Setup

Created an EKS cluster using AWS CloudShell
Defined Kubernetes manifests:
deployment.yaml: Creates pods using Docker image from DockerHub
service.yaml: Exposes the application using a LoadBalancer

🔹 Step 4: Jenkins CI/CD Pipeline Setup

Accessed Jenkins:
http://<public_ip>:8080

Created a Pipeline Job
Connected GitHub repository to Jenkins

Pipeline Configuration
![EC2 Instance](https://github.com/Aditikhare31/Trend_project/blob/main/trend_screenshots/jenkins_pipeline_created.png)
![EC2 Instance](https://github.com/Aditikhare31/Trend_project/blob/main/trend_screenshots/Jenkins_pipeline_config.png) 

Installed required plugin:
AWS Credentials Plugin

Plugin Installation
![EC2 Instance](https://github.com/Aditikhare31/Trend_project/blob/main/trend_screenshots/jenkins_plugins.png)

Add webhooks in GitHub repo
![EC2 Instance](https://github.com/Aditikhare31/Trend_project/blob/main/trend_screenshots/webhooks.png)

🔹 Step 5: Pipeline Execution

The pipeline performs:
Build Docker Image
Push Image to DockerHub
![EC2 Instance](https://github.com/Aditikhare31/Trend_project/blob/main/trend_screenshots/docker_hub.png)

Deploy to Kubernetes (EKS)

Pipeline Execution Screenshots
![EC2 Instance](https://github.com/Aditikhare31/Trend_project/blob/main/trend_screenshots/pipeline_execution_1.png)
![EC2 Instance](https://github.com/Aditikhare31/Trend_project/blob/main/trend_screenshots/pipeline_execution_2.png)

🔹 Step 6: Verify Deployment

Verified Docker resources:
Images
Containers

Verified Kubernetes resources:
Pods
Services

Verification
![EC2 Instance](https://github.com/Aditikhare31/Trend_project/blob/main/trend_screenshots/docker_image.png) 
![EC2 Instance](https://github.com/Aditikhare31/Trend_project/blob/main/trend_screenshots/docker_container.png) 
![EC2 Instance](https://github.com/Aditikhare31/Trend_project/blob/main/trend_screenshots/kubectl_resources.png)


🔹 Step 7: Monitoring Setup

Installed and configured:
Node Exporter
Prometheus
Grafana

📊 Prometheus Configuration

Edited Prometheus service file:
sudo nano /etc/systemd/system/prometheus.service
![EC2 Instance](https://github.com/Aditikhare31/Trend_project/blob/main/trend_screenshots/prometheus_config.png)

Added Node Exporter target

🔹 Step 8: Access Monitoring Tools

Node Exporter: http://<public_ip>:9100/metrics
Prometheus: http://<public_ip>:9090

🔹 Step 9: Grafana Configuration

Grafana default port (3000) conflicted with application
Updated Grafana port to 3001
sudo nano /etc/grafana/grafana.ini
![EC2 Instance](https://github.com/Aditikhare31/Trend_project/blob/main/trend_screenshots/grafana_config.png)

🔹 Step 10: Configure Monitoring
Access Grafana: http://<public_ip>:3001
Add Prometheus to the Grafana in data sources
![EC2 Instance](https://github.com/Aditikhare31/Trend_project/blob/main/trend_screenshots/grafana_data_sources.png)

And export the dashboard
![EC2 Instance](https://github.com/Aditikhare31/Trend_project/blob/main/trend_screenshots/Monitoring.png)

🔹 Step 11: Application Access

Application is exposed via Kubernetes LoadBalancer
![EC2 Instance](https://github.com/Aditikhare31/Trend_project/blob/main/trend_screenshots/loadbalancer_arn.png)
