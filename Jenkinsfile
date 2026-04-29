pipeline {
    agent any

    tools {
      
        maven 'maven' 
    }

    stages {
        stage('Récupération du code') {
            steps {
                echo 'Clonage du dépôt depuis GitHub...'
                checkout scm
            }
        }

      stage('Compilation & Tests') {
    steps {
        echo 'Exécution de Maven...'
        // Remove the dir('mavenprog') block if pom.xml is at the root
        sh 'mvn clean package' 
    }
}

        stage('Build Image Docker') {
            steps {
                script {
                    echo "Préparation de l'image Docker..."
                  
                    sh 'docker build -t tp-java-pipeline-mouad .'
                }
            }
        }
    }
    
    post {
        success {
            echo 'Félicitations ! La Pipeline est terminée avec succès.'
        }
        failure {
            echo 'La Pipeline a échoué. Vérifiez les logs de la console.'
        }
    }
}
