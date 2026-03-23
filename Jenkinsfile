pipeline{
  agent any

    stages {
      stage('Build docker image') {
        steps {
          sh 'docker build -t trend-nginx .'
          sh 'docker run -d -p 3000:80 trend-nginx'
        }
      }

      stage('push to dockerhub') {
        steps {
          sh 'docker login -u adikhare31 -p PurvaManu_0302'
          sh 'docker tag trend-nginx adikhare31/trend-store-project'
          sh 'docker push adikhare31/trend-store-project'
        }
      }
 
      stage('deploy to kubernetes') {
        steps {
          sh 'aws eks update-kubeconfig --region us-east-1 --name trend-cluster'
          sh 'kubectl apply -f trend-deployment.yaml'
          sh 'kubectl apply -f trend-service.yaml'
        }
      }
    }
}
