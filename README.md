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
![EC2 Instance](https://github.com/Aditikhare31/React-application/blob/main/EC2_instance.png)
 
Security Group
 
![EC2 Instance](https://github.com/Aditikhare31/React-application/blob/main/EC2_instance.png)
IAM User 
 
![EC2 Instance](https://github.com/Aditikhare31/React-application/blob/main/EC2_instance.png)
Go to IAM role and create a IAM role for Ec2 instance
 
 
![EC2 Instance](https://github.com/Aditikhare31/React-application/blob/main/EC2_instance.png)
Step 2: Login to server, install Docker and create Dockerfile
Step 3: Setup EKS cluster using CloudShell, create deployment.yaml and service.yaml file
Deployment.yaml- will create pod and take image from dockerhub
Service.yaml- will create loadbalancer
Step 4: Access Jenkins via http://<public_ip>:8080 and login to Jenkins
 
Create new item and create pipeline
 

Add GitHub repo to the pipeline
 

Go to manage Jenkins-> plugins-> available plugin-> and install AWS credential plugin
 
Pipeline execution
 
 
Step 5- Check if resources are created
 
 
 
 

Step 5- Login to server and install node exporter, grafana and Prometheus
Once you install Prometheus, open Prometheus configuration file and add node exporter
nano /etc/systemd/system/prometheus.service
 
Access node exporter via http://<public_ip>:9100/metrics
Access Prometheus via http://<public_ip>:9090
We had to run application on 3000 port and grafana also runs on 3000 port, in order to run application on 3000 port, changed the grafana default port by changing the config file
sudo nano /etc/grafana/grafana.ini
changed 3000 port to 3001
 

Access application via Loadbalancer ARN
 






