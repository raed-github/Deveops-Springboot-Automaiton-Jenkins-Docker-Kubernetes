pipeline {
    agent any
    tools{
        maven 'maven_3_9_2'
    }
    stages{
        stage('Build Maven'){
            steps{
                checkout([$class: 'GitSCM', branches: [[name: '*/master']], extensions: [], userRemoteConfigs: [[url: 'https://github.com/raed-github/Springboot-Devops-Automaiton-Jenkins-Docker-Kubernetes.git']]])
                sh 'mvn clean install'
            }
        }
        stage('Build docker image'){
            steps{
                script{
                    sh 'docker build -t raedaereatech/Springboot-Devops-Automaiton-Jenkins-Docker-Kubernetes .'
                }
            }
        }
        stage('Push image to Hub'){
            steps{
                script{
                   withCredentials([string(credentialsId: 'dockerhub-pwd', variable: '123456789')]) {
                   sh 'docker login -u raedaereatech -p ${dockerhubpwd}'

}
                   sh 'docker push raedaereatech/Springboot-Devops-Automaiton-Jenkins-Docker-Kubernetes'
                }
            }
        }
        stage('Deploy to k8s'){
            steps{
                script{
                    kubernetesDeploy (configs: 'deploymentservice.yaml',kubeconfigId: 'k8sconfigpwd')
                }
            }
        }
    }
}
