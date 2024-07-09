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
        stage('Checkout') {
            steps {
                git branch: 'main', url: 'https://github.com/bazzou-mohammed/contact_backend_app.git'
            }

        }
        stage('Build') {
            steps {
                bat "mvn clean package" 
            }

        }
        stage('Test') {
            steps {
                bat "mvn test" 
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
        stage('Image build') {
            steps {
                script {
                    // Login to Docker Hub
                    withDockerRegistry(credentialsId: 'docker_credentianls') {
                        //bat 'docker build -t ${DOCKER_REGISTRY}/${DOCKER_IMAGE_NAME}:${DOCKER_IMAGE_TAG} .'
                        bat 'docker build -t %DOCKER_REGISTRY%/%DOCKER_IMAGE_NAME%:%DOCKER_IMAGE_TAG% .'

                    }
                }
            }
       }
       stage('Push') {
            steps {
                script {
                    // Login to Docker Hub
                    withDockerRegistry(credentialsId: 'docker_credentianls') {
                        bat 'docker push %DOCKER_REGISTRY%/%DOCKER_IMAGE_NAME%:%DOCKER_IMAGE_TAG%'
                    }
                }
            }
       }
    //    stage('Deploy') {
    //         steps {
    //             script {
                    
    //             }
    //         }
    //    }
    }
}

