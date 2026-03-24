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
![EC2 Instance](https://github.com/Aditikhare31/Trend_project/blob/main/trend_screenshots/VPC.png)

Security Groups
IAM User

EC2 Instance (with Jenkins installation via user data)

Terraform automatically provisions the required infrastructure.

EC2 Instance Created


Security Group


IAM User


Created an IAM Role and attached it to the EC2 instance for required permissions.

🔹 Step 2: Docker Setup

Logged into the EC2 instance

Installed Docker

Created a Dockerfile for the React application

Built and tested the Docker image locally

🔹 Step 3: Kubernetes (EKS) Setup

Created an EKS cluster using AWS CloudShell

Defined Kubernetes manifests:

deployment.yaml

Creates pods using Docker image from DockerHub

service.yaml

Exposes the application using a LoadBalancer

🔹 Step 4: Jenkins CI/CD Pipeline Setup

Accessed Jenkins:

http://<public_ip>:8080

Created a Pipeline Job

Connected GitHub repository to Jenkins

Pipeline Configuration


Installed required plugin:

AWS Credentials Plugin

Plugin Installation


🔹 Step 5: Pipeline Execution

The pipeline performs:

Build Docker Image

Push Image to DockerHub

Deploy to Kubernetes (EKS)

Pipeline Execution Screenshots




🔹 Step 6: Verify Deployment

Verified Docker resources:

Images

Containers

Verified Kubernetes resources:

Pods

Services

Verification






🔹 Step 7: Monitoring Setup

Installed and configured:

Node Exporter

Prometheus

Grafana

📊 Prometheus Configuration

Edited Prometheus service file:

sudo nano /etc/systemd/system/prometheus.service

Added Node Exporter target

🔹 Step 8: Access Monitoring Tools

Node Exporter:

http://<public_ip>:9100/metrics

Prometheus:

http://<public_ip>:9090
🔹 Step 9: Grafana Configuration

Grafana default port (3000) conflicted with application

Updated Grafana port to 3001

sudo nano /etc/grafana/grafana.ini

🔹 Step 10: Application Access

Application is exposed via Kubernetes LoadBalancer
