**React application CI/CD pipeline with Monitoring**
This project demonstrate complete Deployment of an application using 
•	Jenkins
•	Docker and DockerHub
•	Kubernetes
•	Grafana
•	Prometheus
•	Node Exporter
The pipeline automatically build, push and deploy the application and also monitors server health and application availability.
Tools and Technologies
•	Jenkins
•	Docker and DockerHub
•	Kubernetes
•	Grafana
•	Prometheus
•	Node Exporter
•	GitHub
•	AWS EC2

Step 1: Create terraform script for creating Security groups, VPC, IAM user and Ec2 instance with userdata for installing Jenkins
Main.tf is present in git repo
This is the server created by terraform script
![EC2 Instance](https://github.com/Aditikhare31/Trend_project/blob/main/trend_screenshots/ec2_instance.png)
 
Security Group
![EC2 Instance](https://github.com/Aditikhare31/Trend_project/blob/main/trend_screenshots/security_groups.png)

IAM User 
![EC2 Instance](https://github.com/Aditikhare31/Trend_project/blob/main/trend_screenshots/IAM_user.png)

Go to IAM role and create a IAM role for Ec2 instance
![EC2 Instance](https://github.com/Aditikhare31/Trend_project/blob/main/trend_screenshots/IAM_role.png)

Step 2: Login to server, install Docker and create Dockerfile

Step 3: Setup EKS cluster using CloudShell, create deployment.yaml and service.yaml file
Deployment.yaml- will create pod and take image from dockerhub
Service.yaml- will create loadbalancer

Step 4: Access Jenkins via http://<public_ip>:8080 and login to Jenkins
 
Create new item and create pipeline
![EC2 Instance](https://github.com/Aditikhare31/Trend_project/blob/main/trend_screenshots/jenkins_pipeline_created.png)

Add GitHub repo to the pipeline
![EC2 Instance](https://github.com/Aditikhare31/Trend_project/blob/main/trend_screenshots/Jenkins_pipeline_config.png)

Go to manage Jenkins-> plugins-> available plugin-> and install AWS credential plugin
![EC2 Instance](https://github.com/Aditikhare31/Trend_project/blob/main/trend_screenshots/jenkins_plugins.png)

Pipeline execution
![EC2 Instance](https://github.com/Aditikhare31/Trend_project/blob/main/trend_screenshots/pipeline_execution_1.png)
![EC2 Instance](https://github.com/Aditikhare31/Trend_project/blob/main/trend_screenshots/pipeline_execution_2.png)
 
 
Step 5- Check if resources are created
![EC2 Instance](https://github.com/Aditikhare31/Trend_project/blob/main/trend_screenshots/docker_image.png)
![EC2 Instance](https://github.com/Aditikhare31/Trend_project/blob/main/trend_screenshots/docker_container.png)
![EC2 Instance](https://github.com/Aditikhare31/Trend_project/blob/main/trend_screenshots/kubectl_resources.png)
 
 
Step 6- Login to server and install node exporter, grafana and Prometheus
Once you install Prometheus, open Prometheus configuration file and add node exporter
nano /etc/systemd/system/prometheus.service
![EC2 Instance](https://github.com/Aditikhare31/Trend_project/blob/main/trend_screenshots/prometheus_config.png)
 
Access node exporter via http://<public_ip>:9100/metrics
Access Prometheus via http://<public_ip>:9090
We had to run application on 3000 port and grafana also runs on 3000 port, in order to run application on 3000 port, changed the grafana default port by changing the config file
sudo nano /etc/grafana/grafana.ini
changed 3000 port to 3001
![EC2 Instance](https://github.com/Aditikhare31/Trend_project/blob/main/trend_screenshots/grafana_config.png)

Access application via Loadbalancer ARN
![EC2 Instance](https://github.com/Aditikhare31/Trend_project/blob/main/trend_screenshots/loadbalancer_arn.png)






