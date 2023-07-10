pipeline {
    agent any
    
    tools {
        // Define the Node.js tool with the appropriate version
        nodejs 'node_16_13_0'
    }
    
    stages {
        stage('Checkout') {
            steps {
                git 'https://github.com/drissi2002/frontend-bpmn-workflow-module.git'
            }
        }
        
        stage('Install Dependencies') {
            steps {
                sh 'npm install'
            }
        }
        
        stage('Build') {
            steps {
                sh 'npm run build'
            }
        }
        
        stage('Build Docker Image') {
            steps {
                // Build the Docker image
                sh 'docker build -t drissi2002/frontend-integration:latest -f Dockerfile .'
            }
        }
        stage('Publishing to Docker Hub') {
            steps {
                // Log in to Docker Hub
                 sh 'docker login -u drissi2002 -p 98633589RIMdrissi'
                // Tag the Docker image with a new tag
                 sh 'docker tag drissi2002/frontend-integration:latest drissi2002/frontend-integration:latest'
                // Push the Docker image to Docker Hub
                 sh 'docker push drissi2002/frontend-integration:latest'
                
            }
        }
    
        }
    }