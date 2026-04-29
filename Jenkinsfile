pipeline {
    agent any

    tools {
        // Doit correspondre exactement au nom dans ta capture d'écran
        maven 'Maven3'
    }

    stages {
        stage('Checkout SCM') {
            steps {
                echo 'Récupération du code...'
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
                script {
                    echo 'Construction de l’image Docker...'
                    // On copie le JAR généré vers la racine (là où est le Dockerfile)
                    sh 'cp Maven/target/*.jar ./app.jar'
                    
                    // Construction de l'image
                    sh 'docker build -t tp-java-pipeline:latest .'
                }
            }
        }

        stage('Run Docker Container (test)') {
            steps {
                echo 'Lancement du conteneur de test...'
                // Nettoyage d'un ancien conteneur s'il existe
                sh 'docker rm -f java-app-test || true'
                sh 'docker run -d --name java-app-test tp-java-pipeline:latest'
            }
        }
    }

    post {
        success {
            echo 'Pipeline réussi ! ✅'
        }
        failure {
            echo 'Pipeline échoué ❌ - Vérifiez si Docker est bien installé sur le serveur Jenkins.'
        }
    }
}
