FROM openjdk:18
EXPOSE 8080
ADD target/Springboot-Devops-Automaiton-Jenkins-Docker-Kubernetes.jar Springboot-Devops-Automaiton-Jenkins-Docker-Kubernetes.jar
ENTRYPOINT ["java","-jar","/Springboot-Devops-Automaiton-Jenkins-Docker-Kubernetes.jar"]