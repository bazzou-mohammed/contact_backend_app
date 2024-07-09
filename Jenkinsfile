pipeline {
    agent any

    tools {
        // Installer la version Maven configurée en tant que "M3" et l'ajouter au chemin d'accès.
        jdk 'jdk-17'
        maven 'maven3'
    }
    environment {
        DOCKER_CREDENTIALS_ID = "docker-credentials"
        DOCKER_REGISTRY = "bazzoumohammed"
        DOCKER_IMAGE_NAME = "contact_backend_app"
        DOCKER_IMAGE_TAG = "latest"
    }

    stages {
        stage('Checkout Code & Build') {
            steps {
                // Récupérer du code à partir d'un dépôt GitHub
                git branch: 'main', url: 'https://github.com/bazzou-mohammed/contact_backend_app.git'

                // Exécuter Maven sur un agent Unix.
                // sh "mvn -Dmaven.test.failure.ignore=true clean package"

                // Pour exécuter Maven sur un agent Windows, utiliser
                bat "mvn clean package" 
            }

        }
        stage('SonarQube Analysis') {
            steps {
                // Execute SonarQube analysis
                script {
                    withSonarQubeEnv('sonar_server') {
                        bat 'mvn org.sonarsource.scanner.maven:sonar-maven-plugin:3.7.0.1746:sonar'
                    }
                }
            }          
        }
        stage('Docker build & push') {
            steps {
                script {
                    // Login to Docker Hub
                    withDockerRegistry(credentialsId: 'docker_credentianls') {
                        bat 'docker build -t bazzoumohammed/imagepush:v1.0 .'
                        //bat 'docker push bazzoumohammed/java_contact_app:v1.0'
                    }
                }
            }
       }
    }
}

