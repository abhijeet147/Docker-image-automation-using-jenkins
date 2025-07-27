pipeline {
    agent any

    environment {
        IMAGE_NAME = "myapp"
        REGISTRY = "localhost:5000"
    }

    stages {
        stage('Clone Repo') {
            steps {
                git 'https://github.com/abhijeet147/simple-docker-app.git'
            }
        }
        stage('Build Docker Image') {
            steps {
                script {
                    docker.build("${REGISTRY}/${IMAGE_NAME}:latest")
                }
            }
        }
        stage('Push to Local Registry') {
            steps {
                script {
                    docker.withRegistry("http://${REGISTRY}") {
                        docker.image("${REGISTRY}/${IMAGE_NAME}:latest").push()
                    }
                }
            }
        }
    }
}