pipeline {
    agent any

    tools {
        // Installer la version Maven configurée en tant que "M3" et l'ajouter au chemin d'accès.
        jdk 'jdk-11'
        maven 'maven3'
    }

    stages {
        stage('Build') {
            steps {
                // Récupérer du code à partir d'un dépôt GitHub
                git branch: 'main', url: 'https://github.com/bazzou-mohammed/contact_backend_app.git'

                // Exécuter Maven sur un agent Unix.
                // sh "mvn -Dmaven.test.failure.ignore=true clean package"

                // Pour exécuter Maven sur un agent Windows, utiliser
                bat "mvn -Dmaven.test.failure.ignore=true clean package" 
            }

        }
        stage('Test') {
            steps {
                // Pour exécuter Maven sur un agent Windows, utiliser
                bat "mvn test" 
            }

        }
        stage('Deploy') {
            steps {
                // Pour exécuter Maven sur un agent Windows, utiliser
                echo "Artefact deployed" 
            }

        }
       
    }
}

