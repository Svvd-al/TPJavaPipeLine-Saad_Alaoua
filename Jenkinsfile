pipeline {
    agent {
        docker {
            // Utilisez Dockerfile depuis le même dépôt ou l'image construite
            // Option 1: Utiliser un Dockerfile depuis votre dépôt
            dockerfile {
                filename 'Dockerfile'
                dir '.'
                args '-v $HOME/.m2:/root/.m2'
            }
            
            // Option 2: Si vous avez déjà construit l'image localement
            // image 'my-maven-git:latest'
            // args '-v $HOME/.m2:/root/.m2'
        }
    }
    stages {
        stage('Checkout') {
            steps {
                // Clean workspace (meilleur que rm -rf *)
                cleanWs()
                
                // Checkout avec l'outil Git de Jenkins
                checkout scm
            }
        }
        stage('Build') {
            steps {
                script {
                    def currentDir = pwd()
                    echo "Current directory: ${currentDir}"
                    
                    // Le répertoire du projet
                    dir('java-maven/maven') {
                        // Nettoyer, tester et empaqueter
                        sh 'mvn clean test package'
                        
                        // Optionnel: Tester l'exécution (peut bloquer le build)
                        // sh 'java -jar target/maven-0.0.1-SNAPSHOT.jar &'
                        
                        // Archiver les artefacts
                        archiveArtifacts artifacts: 'target/*.jar', fingerprint: true
                    }
                }
            }
        }
    }
    post {
        always {
            // Nettoyer après le build
            cleanWs()
        }
        success {
            echo 'Pipeline réussi !'
        }
        failure {
            echo 'Pipeline échoué !'
        }
    }
}
