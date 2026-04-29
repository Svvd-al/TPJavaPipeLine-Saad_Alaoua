pipeline {
    agent any

    tools {
        // Assurez-vous que le nom 'maven' correspond exactement 
        // au nom configuré dans "Manage Jenkins" -> "Global Tool Configuration"
        maven 'maven' 
    }

    stages {
        stage('Nettoyage & Diagnostic') {
            steps {
                echo 'Vérification de la structure des fichiers...'
                // Cette commande affiche l'arborescence pour déboguer le chemin du pom.xml
                sh 'ls -R' 
            }
        }

        stage('Récupération du code') {
            steps {
                echo 'Clonage du dépôt depuis GitHub...'
                checkout scm
            }
        }

        stage('Compilation & Tests') {
            steps {
                echo 'Exécution de Maven...'
                script {
                    /* Si votre pom.xml est dans un sous-dossier (ex: 'mavenprog'), 
                       décommentez la ligne dir('mavenprog') ci-dessous.
                       Sinon, laissez tel quel pour la racine.
                    */
                    // dir('mavenprog') {
                        sh 'mvn clean package'
                    // }
                }
            }
        }

        stage('Build Image Docker') {
            steps {
                script {
                    echo "Préparation de l'image Docker..."
                    // On suppose que le Dockerfile est à la racine du projet
                    sh 'docker build -t tp-java-pipeline-saad .'
                }
            }
        }
    }

    post {
        success {
            echo 'Félicitations ! La Pipeline est terminée avec succès.'
        }
        failure {
            echo 'La Pipeline a échoué. Vérifiez les logs de la console (étape Diagnostic).'
        }
    }
}
