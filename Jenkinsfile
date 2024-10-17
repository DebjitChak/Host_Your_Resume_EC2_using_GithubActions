pipeline {
    agent{
        label 'built-in'
    }

    environment {
        DOCKER_IMAGE = '08041998/resume-builder'
    }

    stages {
        stage('Clone Repository') {
            steps {
                // Clone your repository
                git 'https://github.com/DebjitChak/Host_Your_Resume_EC2_using_GithubActions.git'
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    // Build the Docker image
                    sh "docker build -t ${DOCKER_IMAGE}:${env.BUILD_NUMBER} ."
                }
            }
        }

        stage('Push Docker Image') {
            steps {
                script {
                    // Login to Docker registry
                    docker.withRegistry('https://index.docker.io/v1/', 'docker-hub-dc') {
                        // Push the Docker image
                        sh "docker push ${DOCKER_IMAGE}:${env.BUILD_NUMBER}"
                    }
                }
            }
        }
    }

    post {
        success {
            echo 'Docker image built and pushed successfully!'
        }
        failure {
            echo 'Pipeline failed!'
        }
    }
}
