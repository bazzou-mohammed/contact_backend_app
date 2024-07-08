pipeline {
    agent any

    tools {
        // Installer la version Maven configurée en tant que "M3" et l'ajouter au chemin d'accès.
        jdk 'jdk-17'
        maven 'maven3'
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
        stage('Build & Tag Docker Image') {
            steps {
                script {
                    // Login to Docker Hub
                    withDockerRegistry(credentialsId: 'docker_credentianls') {
                        bat 'docker build -t bazzoumohammed/bazzoum_repo:v124 .'
                        bat 'docker push bazzoumohammed/bazzoum_repo:v123'
                    }
                }
            }
        }
       
    }
}

