pipeline {
    agent any

    tools {
        maven 'Maven3'   // adapte si ton Jenkins a un autre nom
    }

    environment {
        IMAGE_NAME = "tp-java-pipeline"
        IMAGE_TAG = "latest"
    }

    stages {

        stage('Checkout SCM') {
            steps {
                echo 'Récupération du code GitHub...'
                checkout scm
            }
        }

        stage('Structure du projet') {
            steps {
                echo 'Vérification de la structure...'
                sh 'ls -R'
            }
        }

        stage('Compilation & Tests') {
            steps {
                echo 'Build Maven...'

                dir('Maven') {
                    sh 'mvn clean package'
                }
            }
        }

        stage('Build Docker Image') {
            steps {
                echo 'Construction de l’image Docker...'

                sh """
                docker build -t ${IMAGE_NAME}:${IMAGE_TAG} .
                """
            }
        }

        stage('Run Docker Container (test)') {
            steps {
                echo 'Lancement du container...'

                sh """
                docker run -d --name tp-java-app -p 8080:8080 ${IMAGE_NAME}:${IMAGE_TAG} || true
                """
            }
        }
    }

    post {
        success {
            echo 'Pipeline terminé avec SUCCÈS 🎉'
        }

        failure {
            echo 'Pipeline échoué ❌ Vérifie les logs'
        }

        always {
            echo 'Nettoyage...'
            sh 'docker rm -f tp-java-app || true'
        }
    }
}
