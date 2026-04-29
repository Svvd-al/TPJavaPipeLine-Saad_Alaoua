pipeline {
    agent any

    tools {
        maven 'Maven3' 
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
                script {
                    // On copie le JAR généré vers la racine pour le Dockerfile
                    sh 'cp Maven/target/Maven-1.0-SNAPSHOT.jar ./app.jar'
                    
                    // Construction de l'image
                    sh "docker build -t ${IMAGE_NAME}:${IMAGE_TAG} ."
                }
            }
        }

        stage('Run Docker Container (test)') {
            steps {
                echo 'Lancement du container...'
                // On supprime l'ancien s'il existe, puis on lance le nouveau
                sh """
                docker rm -f tp-java-app || true
                docker run -d --name tp-java-app -p 8080:8080 ${IMAGE_NAME}:${IMAGE_TAG}
                """
            }
        }
    }

    post {
        success {
            echo 'Pipeline terminé avec SUCCÈS 🎉'
        }
        failure {
            echo 'Pipeline échoué ❌'
        }
    }
}
