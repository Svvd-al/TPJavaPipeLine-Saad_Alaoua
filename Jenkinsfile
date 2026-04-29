pipeline {
    agent any

    tools {
        // Assurez-vous que "docker" est configuré dans 
        // Administrer Jenkins -> Global Tool Configuration
        maven 'Maven 3' 
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
                // On se déplace dans le dossier Maven pour compiler
                dir('Maven') {
                    sh 'mvn clean package'
                }
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    echo 'Construction de l’image Docker...'
                    // Copie du JAR vers la racine pour le Dockerfile
                    sh 'cp Maven/target/*.jar ./app.jar'
                    
                    // Construction de l'image
                    sh 'docker build -t tp-java-pipeline:latest .'
                }
            }
        }

        stage('Run Docker Container (test)') {
            steps {
                echo 'Lancement du conteneur de test...'
                // On supprime l'ancien conteneur s'il existe, puis on lance le nouveau
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
            echo 'Pipeline échoué ❌'
        }
    }
}
