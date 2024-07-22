// pipeline {
//     agent any

//     tools {
//         // Installer la version Maven configurée en tant que "M3" et l'ajouter au chemin d'accès.
//         jdk 'jdk-17'
//         maven 'maven3'
//     }
//     environment {
//         DOCKER_CREDENTIALS_ID = "docker-credentials"
//         DOCKER_REGISTRY = "bazzoumohammed"
//         DOCKER_IMAGE_NAME = "contact_backend_app"
//         DOCKER_IMAGE_TAG = "latest"
//     }

//     stages {
//         stage('Checkout') {
//             steps {
//                 git branch: 'main', url: 'https://github.com/bazzou-mohammed/contact_backend_app.git'
//             }

//         }
//         stage('Build') {
//             steps {
//                 bat "mvn clean package" 
//             }

//         }
//         stage('Test') {
//             steps {
//                 bat "mvn test" 
//             }

//         }
//         stage('SonarQube Analysis') {
//             steps {
//                 // Execute SonarQube analysis
//                 script {
//                     withSonarQubeEnv('sonar_server') {
//                         bat 'mvn org.sonarsource.scanner.maven:sonar-maven-plugin:3.7.0.1746:sonar'
//                     }
//                 }
//             }          
//         }
//         stage('Image build') {
//             steps {
//                 script {
//                     // Login to Docker Hub
//                     withDockerRegistry(credentialsId: 'docker_credentianls') {
//                         //bat 'docker build -t ${DOCKER_REGISTRY}/${DOCKER_IMAGE_NAME}:${DOCKER_IMAGE_TAG} .'
//                         bat 'docker build -t %DOCKER_REGISTRY%/%DOCKER_IMAGE_NAME%:%DOCKER_IMAGE_TAG% .'

//                     }
//                 }
//             }
//        }
//        stage('Push') {
//             steps {
//                 script {
//                     // Login to Docker Hub
//                     withDockerRegistry(credentialsId: 'docker_credentianls') {
//                         bat 'docker push %DOCKER_REGISTRY%/%DOCKER_IMAGE_NAME%:%DOCKER_IMAGE_TAG%'
//                     }
//                 }
//             }
//        }
//        stage('Deploy') {
//             steps {
//                 script {
//                     // Local Déploy 
//                     bat 'docker run -d -p 9090:8080 --name contact_backend_app %DOCKER_REGISTRY%/%DOCKER_IMAGE_NAME%:%DOCKER_IMAGE_TAG%'               
//                 }
//             }
//        }
//     }
// }

pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                // Clone your repository containing the Ansible playbook
                git branch: 'main', url: 'https://github.com/bazzou-mohammed/contact_backend_app.git'
            }
        }

        stage('Run Ansible Playbook') {
            steps {
                script {
                    // Chemin relatif du playbook Ansible
                    def playbook = 'test_ansible.yml'
                    
                    // Exécuter le playbook Ansible via WSL
                    bat "wsl ansible-playbook ${playbook}"
                }
            }
        }

        // stage('Check Ansible Version') {
        //     steps {
        //         script {
        //             // Execute the Ansible command using elevated PowerShell
        //             def ansibleVersionCmd = "powershell.exe -Command \"Start-Process wsl -ArgumentList 'ansible --version' -Verb RunAs\""
        //             bat ansibleVersionCmd
        //         }
        //     }
        // }
    }
}
